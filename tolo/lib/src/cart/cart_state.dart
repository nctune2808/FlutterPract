part of 'cart_bloc.dart';

class CartState {
  final List<Cart>? carts;
  final Status status;

  CartState({
    this.carts,
    this.status = const StatusInitial(),
  });

  CartState copyWith({
    List<Cart>? carts,
    Status? status,
  }) {
    return CartState(
      carts: carts ?? this.carts,
      status: status ?? this.status,
    );
  }
}

class InitialCart extends CartState {}

class RefreshableCart extends CartState {}

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
