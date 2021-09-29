part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

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

// class AddItemSuccess extends CartState {
//   final Item item;
//   AddItemSuccess({
//     required this.item,
//   });
// }

// class AddItemFailure extends CartState {
//   final dynamic exception;
//   AddItemFailure({
//     required this.exception,
//   });
// }
