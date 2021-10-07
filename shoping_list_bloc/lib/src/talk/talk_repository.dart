import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shoping_list_bloc/auth/auth_repository.dart';
import 'package:shoping_list_bloc/model/message.dart';

class TalkRepository {
  final _firestore = FirebaseFirestore.instance;
  AuthRepository _authRepo = AuthRepository();

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

  Future<void> enterMessage({required Message message}) async {
    try {
      await _firestore.collection('messages').add({
        'text': message.text,
        'sender': _authRepo.getCurrentUser().displayName,
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
