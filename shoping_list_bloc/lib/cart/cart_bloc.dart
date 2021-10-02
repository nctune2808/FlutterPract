import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shoping_list_bloc/cart/cart_repository.dart';
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
        final initItems = await cartRepo.getListItems();
        yield ListCartSuccess(items: initItems);
      } catch (e) {
        yield ListCartFailure(exception: e);
      }
    } else if (event is AddItemEvent) {
      print("Press ADD");
      try {
        state.items!.add(event.item);
        yield ListCartSuccess(items: state.items!);
      } catch (e) {
        yield ListCartFailure(exception: e);
      }
    } else if (event is DeleteItemEvent) {
      print("Press DEL");
      try {
        state.items!.remove(event.item);
        yield ListCartSuccess(items: state.items!);
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
    } else if (event is InsertItemEvent) {
      print('Press INS');
      try {
        state.items!.insert(event.index, event.deletedItem);
        yield ListCartSuccess(items: state.items!);
      } catch (e) {
        yield ListCartFailure(exception: e);
      }
    } else if (event is SaveItemEvent) {
      print('Press SAV');
      try {
        final List<Item> saveItems = state.items!.map((item) {
          return item == event.item ? item.copyWith(note: event.note) : item;
        }).toList();
        yield ListCartSuccess(items: saveItems);
      } catch (e) {
        yield ListCartFailure(exception: e);
      }
    }
  }
}
