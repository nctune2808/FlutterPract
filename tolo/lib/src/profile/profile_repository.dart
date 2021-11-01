import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tolo/model/photo.dart';
import 'package:tolo/model/user.dart' as tolo;
import 'package:tolo/service/graphql/graphql_service.dart';
import 'package:tolo/utility/fragment/photo_fragment.dart';
import 'package:tolo/utility/fragment/user_fragments.dart';

class ProfileRepository {
// working...
  static const String UPDATE_USER = '''
      ${UserFragment.USER_DATA}
      mutation MyMutation(\$UUID: String!, \$data: users_set_input!) {
        update_users_by_pk(pk_columns: {UUID: \$UUID}, _set: \$data) {
          ...UserData
        }
      }
    ''';

  Future updateAvatar(PickedFile file) async {
    Photo avatar = await uploadGraph(file);

    try {
      final QueryResult result = await GraphQlService.performMutate(
        document: UPDATE_USER,
        variables: {
          "UUID": _auth.currentUser!.uid,
          "data": {
            "avatar_id": avatar.id,
          }
        },
      );
      final updatedUser = result.data?['update_users_by_pk'];
      print("updatedUser: $updatedUser");
      return tolo.User.fromMap(updatedUser);
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

  Future uploadGraph(PickedFile file) async {
    final metadata = SettableMetadata(contentType: 'image/png');
    final storage_path = "images/avatars/${_auth.currentUser!.uid}_avt.png";
    final uploadTask = await _storage
        .ref()
        .child(storage_path)
        .putFile(File(file.path), metadata);
    final String url = (await uploadTask.ref.getDownloadURL());

    final photo = new Photo(url: url, name: "${_auth.currentUser!.uid}_avt");

    try {
      final QueryResult result = await GraphQlService.performMutate(
        document: INSERT_PHOTO,
        variables: {"data": photo.toMap()},
      );
      final insertedPhoto = result.data?['insert_photos_one'];
      print("uploaded: $insertedPhoto");
      return Photo.fromMap(insertedPhoto);
    } catch (e) {
      throw e;
    }
  }

  // -------------------------------------------

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instanceFor(
      bucket: 'gs://tolo-1a943.appspot.com', app: FirebaseAuth.instance.app);

  Future getAvatar() async {
    final ref = _storage
        .ref()
        .child('images/avatars/${_auth.currentUser!.uid}_avt.png');
    String url = await ref.getDownloadURL();
    return url;
  }

  Future upload(PickedFile file) async {
    final metadata = SettableMetadata(contentType: 'image/png');

    return _storage
        .ref()
        .child("images/avatars/${_auth.currentUser!.uid}_avt.png")
        .putFile(File(file.path), metadata);
  }

  // Future uploadImage(File file) async {

  //   StorageReference storageReference;

  //   try {
  //     final fileName = DateTime.now().toIso8601String();
  //     final storageReference =
  //         FirebaseStorage.instance.ref().child("images/$fileName");

  //     final StorageUploadTask uploadTask = storageReference.putFile(file);
  //     final StorageTaskSnapshot downloadUrl = (await uploadTask.onComplete);
  //     final String url = (await downloadUrl.ref.getDownloadURL());
  //     print("URL is $url");
  //   } catch (e) {
  //     throw e;
  //   }
  // }
}
