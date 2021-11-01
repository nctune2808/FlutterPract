import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tolo/model/album.dart';
import 'package:tolo/model/photo.dart';

class AlbumRepository {
  AlbumRepository._();
  static final AlbumRepository instance = AlbumRepository._();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instanceFor(
      bucket: 'gs://tolo-1a943.appspot.com', app: FirebaseAuth.instance.app);

  Future getAvatar() async {
    final ref =
        _storage.ref().child('images/avatars/${_auth.currentUser!.uid}.png');
    String url = await ref.getDownloadURL();
    return url;
  }

  // ---------------------------------------------------------

  Future<List<String>> getLink(List<Reference> refs) async {
    return Future.wait(refs.map((ref) => ref.getDownloadURL()).toList());
  }

  Future<Album> listAll(String path) async {
    final ref = _storage.ref(path);
    final results = await ref.listAll();
    final urls = await getLink(results.items);

    List<Photo> photos = urls
        .asMap()
        .map((index, url) {
          final ref = results.items[index];
          final name = ref.name;
          final file = Photo(name: name, url: url);
          return MapEntry(index, file);
        })
        .values
        .toList();

    return Album(ref: ref, name: path.split("/")[1], photos: photos);
  }

  static Future downloadFile(Reference ref) async {
    final dir = await getApplicationDocumentsDirectory();
    print("Direction: $dir");
    final file = File('${dir.path}/${ref.name}');
    await ref.writeToFile(file);
  }
}
