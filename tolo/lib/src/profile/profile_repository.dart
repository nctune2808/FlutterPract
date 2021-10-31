import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class ProfileRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future upload(PickedFile file) async {
    // not upload yet
    final metadata = SettableMetadata(
        contentType: 'image/png',
        customMetadata: {'picked-file-path': _auth.currentUser!.uid});

    FirebaseStorage.instance
        .ref()
        .child("images/avatars")
        .putFile(File(file.path));
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
