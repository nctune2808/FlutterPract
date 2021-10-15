import 'package:cloud_firestore/cloud_firestore.dart';

class ItemRepository {
  final _firestore = FirebaseFirestore.instance;

  Future<void> getItems() async {
    final items = await _firestore.collection('items').get();
    try {
      for (var item in items.docs) {
        // print(cart.id);
        // print(_firestore.collection('carts').doc(cart.id).delete());
        print(item.data());
      }
    } catch (e) {
      throw e;
    }
  }
}
