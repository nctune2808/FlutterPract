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

class UpdateItemEvent extends CartEvent {
  Item item;
  bool isDone;
  UpdateItemEvent({
    required this.item,
    required this.isDone,
  });
}

class InsertItemEvent extends CartEvent {
  int index;
  Item deletedItem;
  InsertItemEvent({
    required this.index,
    required this.deletedItem,
  });
}
