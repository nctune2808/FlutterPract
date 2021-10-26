import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:tolo/model/user.dart';
import 'package:tolo/service/graphql/graphql_service.dart';
import 'package:tolo/utility/fragment/user_fragments.dart';

class SessionRepository {
  SessionRepository._();
  static final SessionRepository instance = SessionRepository._();

  //

  // static const String RETRIEVE_USER_BY_ID = '''
  //   ${UserFragment.USER_DATA}
  //   query userById(\$id: Int!) {
  //     users_by_pk(id: \$id) {
  //       ...UserData
  //     }
  //   }
  // ''';
  // Future retrieveUserById({required User user}) async {
  //   User _user = await retrieveUserByUUID(user: user);
  //   try {
  //     final QueryResult result = await GraphQlService.performQuery(
  //         document: RETRIEVE_USER_BY_ID, variables: {"id": _user.id});
  //     return User.fromMap(result.data?['users_by_pk']);
  //   } catch (e) {
  //     throw e;
  //   }
  // }

  //

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
      return insertedUser;
    } catch (e) {
      throw e;
    }
  }
}
