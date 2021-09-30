import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shoping_list_bloc/cart_repository.dart';
import 'package:shoping_list_bloc/model/item.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final cartRepo = CartRepository();
  CartBloc() : super(CartState());

  @override
  Stream<CartState> mapEventToState(CartEvent event) async* {
    if (event is LoadingItemEvent) {
      yield ListCartInitial();
      try {
        final items = await cartRepo.getListItems();
        yield ListCartSuccess(items: items);
      } catch (e) {
        yield ListCartFailure(exception: e);
      }
    } else if (event is AddItemEvent) {
      print("Press ADD");
      try {
        final items = await cartRepo.addItemToList(item: event.item);
        yield ListCartSuccess(items: items);
      } catch (e) {
        yield ListCartFailure(exception: e);
      }
    } else if (event is DeleteItemEvent) {
      print("Press DEL");
      try {
        final items = await cartRepo.delItemFromList(item: event.item);
        yield ListCartSuccess(items: items);
      } catch (e) {
        yield ListCartFailure(exception: e);
      }
    } else if (event is UpdateItemEvent) {
      print("Press UP");
      try {
        final List<Item> updateItems = state.items!.map((item) {
          return item == event.item
              ? item.copyWith(isDone: event.isDone)
              : item;
        }).toList();
        yield ListCartSuccess(items: updateItems);
      } catch (e) {
        yield ListCartFailure(exception: e);
      }
    }
  }
}
