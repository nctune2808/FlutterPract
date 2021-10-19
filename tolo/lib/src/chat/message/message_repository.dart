import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tolo/auth/auth_repository.dart';
import 'package:tolo/model/message.dart';

class MessageRepository {
  final _firestore = FirebaseFirestore.instance;
  AuthRepository _authRepo = AuthRepository();

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
