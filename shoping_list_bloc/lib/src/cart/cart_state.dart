part of 'cart_bloc.dart';

class CartState {
  final List<Item>? items;

  CartState({
    this.items,
  });

  CartState copyWith({
    List<Item>? items,
  }) {
    return CartState(
      items: items ?? this.items,
    );
  }
}

class ListCartInitial extends CartState {}

class ListCartSuccess extends CartState {
  final List<Item> items;
  ListCartSuccess({
    required this.items,
  });
}

class ListCartFailure extends CartState {
  final dynamic exception;
  ListCartFailure({
    required this.exception,
  });
}

// class UpdateCartSuccess extends CartState {
//   final Item item;
//   UpdateCartSuccess({
//     required this.item,
//   });
// }
