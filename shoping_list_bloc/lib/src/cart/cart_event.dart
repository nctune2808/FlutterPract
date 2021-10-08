part of 'cart_bloc.dart';

abstract class CartEvent {}

class LoadingCartEvent extends CartEvent {}

class AddCartEvent extends CartEvent {
  Cart cart;
  AddCartEvent({
    required this.cart,
  });
}

class DeleteCartEvent extends CartEvent {
  Cart cart;
  DeleteCartEvent({
    required this.cart,
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
  UpdateCartEvent({
    required this.cart,
  });
}

class InsertCartEvent extends CartEvent {
  Cart cart;
  InsertCartEvent({
    required this.cart,
  });
}
