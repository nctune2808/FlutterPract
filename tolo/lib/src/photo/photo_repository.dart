import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class PhotoRepository {
  PhotoRepository._();
  static final PhotoRepository instance = PhotoRepository._();

  List<UploadTask> _uploadTasks = [];

  //-------------gallary repo-----------------

  Future<UploadTask?> uploadFile(PickedFile file) async {
    UploadTask uploadTask;
    final fileName = DateTime.now().toIso8601String();
    Reference ref = FirebaseStorage.instance
        .ref()
        .child('images/bH8P8fLCNiXNoSEZGQ0X7zU97nF3/avt.png');

    final metadata = SettableMetadata(
        contentType: 'image/png',
        contentEncoding: 'Encoding',
        customMetadata: {'picked-file-path': file.path});

    if (kIsWeb) {
      uploadTask = ref.putData(await file.readAsBytes(), metadata);
    } else {
      uploadTask = ref.putFile(File(file.path), metadata);
    }
    return Future.value(uploadTask);
  }

  /// Handles the user pressing the PopupMenuItem item.
  // Future handleUploadType(UploadType type) async {
  //   switch (type) {
  //     case UploadType.string:
  //       setState(() {
  //         _uploadTasks = [..._uploadTasks, uploadString()];
  //       });
  //       break;
  //     case UploadType.file:
  //       PickedFile? file =
  //           await ImagePicker().getImage(source: ImageSource.gallery);
  //       UploadTask? task = await uploadFile(file!);
  //       if (task != null) {
  //         setState(() {
  //           _uploadTasks = [..._uploadTasks, task];
  //         });
  //       }
  //       break;
  //     case UploadType.clear:
  //       setState(() {
  //         _uploadTasks = [];
  //       });
  //       break;
  //   }
  // }
}
