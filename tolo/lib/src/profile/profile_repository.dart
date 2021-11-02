import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tolo/auth/session/session_repository.dart';
import 'package:tolo/model/photo.dart';
import 'package:tolo/model/user.dart' as tolo;
import 'package:tolo/service/graphql/graphql_service.dart';
import 'package:tolo/utility/fragment/photo_fragment.dart';
import 'package:tolo/utility/fragment/user_fragments.dart';

class ProfileRepository {
// working user avatar NULL

  static const String UPDATE_AVATAR = '''
    ${PhotoFragment.PHOTO_DATA}
    mutation MyMutation(\$id: Int!, \$data: photos_set_input!) {
      update_photos_by_pk(pk_columns: {id: \$id}, _set: \$data) {
        ...PhotoData
      }
    }
  ''';

  Future updateAvatar({
    required tolo.User user,
    required String path,
  }) async {
    Photo avatar = await uploadStorage(path);
    await updateGraph(photo: avatar, user: user);

    return avatar;
  }

  Future updateGraph({required tolo.User user, required Photo photo}) async {
    print("get USER: $user");
    try {
      final QueryResult result = await GraphQlService.performMutate(
        document: UPDATE_AVATAR,
        variables: {
          "id": user.avatar_id,
          "data": photo.toMap(),
        },
      );
      final updatedAvatar = result.data?['update_photos_by_pk'];
      print("updatedAvatar: $updatedAvatar");
      return Photo.fromMap(updatedAvatar);
    } catch (e) {
      throw e;
    }
  }

  Future uploadStorage(String path) async {
    final metadata = SettableMetadata(contentType: 'image/png');
    final storage_path = "images/avatars/${_auth.currentUser!.uid}_avt.png";
    final uploadTask =
        await _storage.ref().child(storage_path).putFile(File(path), metadata);
    final String url = (await uploadTask.ref.getDownloadURL());

    return Photo(
      url: url,
      path: storage_path,
      type: metadata.contentType,
    );
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
}
