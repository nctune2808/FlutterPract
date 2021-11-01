import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tolo/model/photo.dart';
import 'package:tolo/service/graphql/graphql_service.dart';

class ProfileRepository {
  Future uploadGraph(PickedFile file) async {
    final metadata = SettableMetadata(contentType: 'image/png');
    final storage_path = "images/avatars/${_auth.currentUser!.uid}_avt.png";
    final uploadTask = await _storage
        .ref()
        .child(storage_path)
        .putFile(File(file.path), metadata);
    final String url = (await uploadTask.ref.getDownloadURL());

    print("download: $url");

    final photo = new Photo(url: url, name: "name");

    print(photo.toMap());

    // try {
    //   final QueryResult result = await GraphQlService.performMutate(
    //     document:
    //     variables: {
    //       "data": {
    //         "post_id": ins_post.id,
    //         "user_id": wall.user!.UUID,
    //       }
    //     },
    //   );
    //   final insertedPhoto = result.data?['insert_photos_one'];
    //   print(insertedPhoto);
    //   return Photo.fromMap(insertedPhoto);
    // } catch (e) {
    //   throw e;
    // }
  }

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
