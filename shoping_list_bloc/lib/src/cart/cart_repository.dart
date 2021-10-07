import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shoping_list_bloc/model/cart.dart';

class CartRepository {
  final _firestore = FirebaseFirestore.instance;

  List<Cart> carts = [
    // Cart(title: 'pork', note: 'x2', isDone: false),
    // Cart(title: 'beaf', note: 'x1', isDone: false),
    // Cart(title: 'eggs', note: 'x1', isDone: true),
    // Cart(title: 'milk', note: 'x2', isDone: false),
    // Cart(title: 'cake', note: 'x3', isDone: false),
  ];

  Future<List<Cart>> getListCarts() async {
    return carts;
  }

  Future<void> getCarts() async {
    final carts = await _firestore.collection('carts').get();
    try {
      for (var cart in carts.docs) {
        // print(cart.id);
        // print(_firestore.collection('carts').doc(cart.id).delete());
        print(cart.data());
      }
    } catch (e) {
      throw e;
    }
  }

  Future<void> addItem() async {}

  Future<void> addCartToCarts({required Cart cart}) async {
    try {
      await _firestore.collection('carts').add({
        'item': cart.item.name,
        'note': cart.note,
        'isDone': cart.isDone,
      });
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<void> delCartToCarts({required Cart cart}) async {
    try {
      await _firestore.collection('carts').doc(cart.id).delete();
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
