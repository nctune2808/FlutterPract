import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shoping_list_bloc/model/cart.dart';

class CartRepository {
  final _firestore = FirebaseFirestore.instance;

  Future<void> getCarts() async {
    try {
      final carts = await _firestore.collection('carts').get();
      for (var cart in carts.docs) {
        Cart _cart = Cart.fromMap(cart.data());
        print(_cart.toMap());
      }
    } catch (e) {
      throw e;
    }
  }

  Stream<QuerySnapshot> getSnapshots() {
    return _firestore.collection("carts").snapshots();
  }

  Future<void> streamCarts() async {
    print("---------------------------------------------");
    try {
      await for (var snapshot in _firestore.collection('carts').snapshots()) {
        for (var cart in snapshot.docs) {
          print(cart.data());
        }
      }
    } catch (e) {
      throw e;
    }
  }

  Future<void> addCart({required Cart cart}) async {
    try {
      await _firestore.collection('carts').add(cart.toMap());
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<void> deleteCart({required String cartId}) async {
    try {
      await _firestore.collection('carts').doc(cartId).delete();
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
