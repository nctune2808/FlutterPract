import 'package:cloud_firestore/cloud_firestore.dart';

class TalkRepository {
  final _firestore = FirebaseFirestore.instance;

  Future<void> getMessages() async {
    final messages = await _firestore.collection('messages').get();
    for (var message in messages.docs) {
      print(message.data());
    }
  }

  Stream<QuerySnapshot> getSnapshots() {
    return _firestore
        .collection("messages")
        .orderBy("time", descending: true)
        .snapshots();
  }

  Future<void> streamMessages() async {
    print("---------------------------------------------");
    try {
      await for (var snapshot
          in _firestore.collection('messages').snapshots()) {
        for (var message in snapshot.docs) {
          print(message.data());
        }
      }
    } catch (e) {
      throw e;
    }
  }

  Future<void> enterMessage({
    required String text,
    required String sender,
    bool? isLiked,
    bool? seen,
    Timestamp? time,
  }) async {
    try {
      await _firestore.collection('messages').add({
        'text': text,
        'sender': sender,
        'time': Timestamp.fromDate(DateTime.now()),
        'isLiked': false,
        'seen': false,
      });
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
