import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:tolo/model/photo.dart';
import 'package:tolo/model/user.dart';
import 'package:tolo/service/graphql/graphql_service.dart';
import 'package:tolo/utility/fragment/photo_fragment.dart';
import 'package:tolo/utility/fragment/user_fragments.dart';

class SessionRepository {
  SessionRepository._();
  static final SessionRepository instance = SessionRepository._();

  static const String RETRIEVE_USER_BY_UUID = '''
    ${UserFragment.USER_DATA}
    query userByUUID (\$UUID: String!){
      users_by_pk(UUID: \$UUID) {
        ...UserData
      }
    }
  ''';

  Future retrieveUserByUUID({required User user}) async {
    try {
      final QueryResult result = await GraphQlService.performQuery(
          document: RETRIEVE_USER_BY_UUID, variables: {"UUID": user.UUID});
      return User.fromMap(result.data?['users_by_pk']);
    } catch (e) {
      throw e;
    }
  }

  //

  static const String INSERT_USER = '''
      ${UserFragment.USER_DATA}
      mutation insertUsers(\$data: users_insert_input!) {
        insert_users_one(object: \$data) {
          ...UserData
        }
      }
    ''';

  Future insertUser({required User user}) async {
    try {
      final QueryResult result = await GraphQlService.performMutate(
        document: INSERT_USER,
        variables: {"data": user.toMap()},
      );
      final insertedUser = result.data?['insert_users_one'];
      print("user inserted: ${insertedUser}");
      return insertedUser;
    } catch (e) {
      throw e;
    }
  }

  static const String INSERT_PHOTO = '''
    ${PhotoFragment.PHOTO_DATA}
    mutation insertPhotos(\$data: photos_insert_input!) {
      insert_photos_one(object: \$data) {
        ...PhotoData
      }
    }
  ''';

  Future insertEmptyAvatar() async {
    // empty avt
    try {
      final QueryResult result = await GraphQlService.performMutate(
        document: INSERT_PHOTO,
        variables: {"data": new Photo().toMap()},
      );
      final insertedPhoto = result.data?['insert_photos_one'];
      print("uploaded: $insertedPhoto");
      return Photo.fromMap(insertedPhoto);
    } catch (e) {
      throw e;
    }
  }

  // not use yet
  static const String UPDATE_USER = '''
      ${UserFragment.USER_DATA}
      mutation MyMutation(\$UUID: String!, \$data: users_set_input!) {
        update_users_by_pk(pk_columns: {UUID: \$UUID}, _set: \$data) {
          ...UserData
        }
      }
    ''';
}
