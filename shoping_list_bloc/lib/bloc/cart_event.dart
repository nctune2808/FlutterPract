part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class LoadingItemEvent extends CartEvent {}

class AddItemEvent extends CartEvent {
  Item item;
  AddItemEvent({
    required this.item,
  });
}

class DeleteItemEvent extends CartEvent {
  Item item;
  DeleteItemEvent({
    required this.item,
  });
}

class UpdateItemEvent extends CartEvent {}
