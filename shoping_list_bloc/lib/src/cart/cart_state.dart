part of 'cart_bloc.dart';

class CartState {
  final List<Cart>? carts;

  CartState({
    this.carts,
  });

  CartState copyWith({
    List<Cart>? carts,
  }) {
    return CartState(
      carts: carts ?? this.carts,
    );
  }
}

class ListCartInitial extends CartState {}

class ListCartSuccess extends CartState {
  final List<Cart> carts;
  ListCartSuccess({
    required this.carts,
  });
}

class ListCartFailure extends CartState {
  final dynamic exception;
  ListCartFailure({
    required this.exception,
  });
}

// class UpdateCartSuccess extends CartState {
//   final Cart cart;
//   UpdateCartSuccess({
//     required this.cart,
//   });
// }
