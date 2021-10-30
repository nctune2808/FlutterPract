import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AlbumRepository {
  AlbumRepository._();
  static final AlbumRepository instance = AlbumRepository._();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instanceFor(
      bucket: 'gs://tolo-1a943.appspot.com', app: FirebaseAuth.instance.app);

  Future getAvatar() async {
    // 1: Streambuilder inside loop of folder[index]
    // 2: GraphQL ref key
    final ref =
        _storage.ref().child('images/${_auth.currentUser!.uid}/avt.png');
    String url = await ref.getDownloadURL();
    return url;
  }

  Stream<String> imageLocation() {
    final ref = FirebaseStorage.instance.ref().child('images/');
    return ref.getDownloadURL().asStream().map((downloadUrl) => downloadUrl);
  }

  // Future test() async {
  //   final ref = _storage.ref().child('images/Messi_avt.png');
  //   var url = await ref.getDownloadURL();

  //   await _firestore
  //       .collection("images")
  //       .add({"url": url, "name": "imageName"});
  //   return url;
  // }
}
