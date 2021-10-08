part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class LoadingCartEvent extends CartEvent {}

class AddCartEvent extends CartEvent {
  Cart cart;
  AddCartEvent({
    required this.cart,
  });
}

class DeleteCartEvent extends CartEvent {
  String cartId;
  DeleteCartEvent({
    required this.cartId,
  });
}

class SaveCartEvent extends CartEvent {
  Cart cart;
  String note;
  SaveCartEvent({
    required this.cart,
    required this.note,
  });
}

class UpdateCartEvent extends CartEvent {
  Cart cart;
  bool isDone;
  UpdateCartEvent({
    required this.cart,
    required this.isDone,
  });
}

class InsertCartEvent extends CartEvent {
  int index;
  Cart deletedCart;
  InsertCartEvent({
    required this.index,
    required this.deletedCart,
  });
}
