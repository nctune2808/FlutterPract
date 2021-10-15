part of 'cart_bloc.dart';

class CartState {
  final List<Cart>? carts;
  final FormSubmissionStatus formStatus;

  CartState({
    this.carts,
    this.formStatus = const InitialFormStatus(),
  });

  CartState copyWith({
    List<Cart>? carts,
    FormSubmissionStatus? formStatus,
  }) {
    return CartState(
      carts: carts ?? this.carts,
      formStatus: formStatus ?? this.formStatus,
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
