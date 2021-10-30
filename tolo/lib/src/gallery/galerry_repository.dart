import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class GalerryRepository {
  final FirebaseStorage _storage =
      FirebaseStorage.instanceFor(bucket: "gs://tolo-1a943.appspot.com");

  Future<void> listExample() async {
    ListResult result = await FirebaseStorage.instance.ref().listAll();

    result.items.forEach((Reference ref) {
      print('Found file: $ref');
    });

    result.prefixes.forEach((Reference ref) {
      print('Found directory: $ref');
    });
  }

  Future<void> downloadURLExample() async {
    String downloadURL = await FirebaseStorage.instance
        .ref('users/123/avatar.jpg')
        .getDownloadURL();

    // Within your widgets:
    // Image.network(downloadURL);
  }

  Future<void> uploadFile(String filePath) async {
    File file = File(filePath);

    try {
      await FirebaseStorage.instance
          .ref('uploads/file-to-upload.png')
          .putFile(file);
    } on FirebaseException catch (e) {
      // e.g, e.code == 'canceled'
    }
  }
}
