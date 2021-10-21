import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tolo/model/message.dart';

class ChatRepository {
  final _firestore = FirebaseFirestore.instance;

  Future<void> getMessages() async {
    try {
      final messages = await _firestore.collection('messages').get();
      for (var message in messages.docs) {
        Message _message = Message.fromMap(message.data());
        print(_message.toMap());
      }
    } catch (e) {
      throw e;
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getSnapshots() {
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
}
