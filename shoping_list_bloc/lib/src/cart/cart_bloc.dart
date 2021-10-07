import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shoping_list_bloc/model/cart.dart';
import 'package:shoping_list_bloc/model/cart.dart';
import 'package:shoping_list_bloc/src/cart/cart_repository.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final _cartRepo = CartRepository();
  CartBloc() : super(CartState());

  @override
  Stream<CartState> mapEventToState(CartEvent event) async* {
    if (event is LoadingCartEvent) {
      yield ListCartInitial();
      try {
        final initCarts = await _cartRepo.getListCarts();
        _cartRepo.getCarts();
        yield ListCartSuccess(carts: initCarts);
      } catch (e) {
        yield ListCartFailure(exception: e);
      }
    } else if (event is AddCartEvent) {
      print("Press ADD");
      try {
        // state.carts!.add(event.cart);
        _cartRepo.addCartToCarts(cart: event.cart);
        yield ListCartSuccess(carts: state.carts!);
      } catch (e) {
        yield ListCartFailure(exception: e);
      }
    } else if (event is DeleteCartEvent) {
      print("Press DEL");
      try {
        state.carts!.remove(event.cart);
        _cartRepo.delCartToCarts(cart: event.cart);
        yield ListCartSuccess(carts: state.carts!);
      } catch (e) {
        yield ListCartFailure(exception: e);
      }
    } else if (event is UpdateCartEvent) {
      print("Press UP");
      try {
        final List<Cart> updateCarts = state.carts!.map((cart) {
          return cart == event.cart
              ? cart.copyWith(isDone: event.isDone)
              : cart;
        }).toList();
        yield ListCartSuccess(carts: updateCarts);
      } catch (e) {
        yield ListCartFailure(exception: e);
      }
    } else if (event is InsertCartEvent) {
      print('Press INS');
      try {
        state.carts!.insert(event.index, event.deletedCart);
        yield ListCartSuccess(carts: state.carts!);
      } catch (e) {
        yield ListCartFailure(exception: e);
      }
    } else if (event is SaveCartEvent) {
      print('Press SAV');
      try {
        final List<Cart> saveCarts = state.carts!.map((cart) {
          return cart == event.cart ? cart.copyWith(note: event.note) : cart;
        }).toList();
        yield ListCartSuccess(carts: saveCarts);
      } catch (e) {
        yield ListCartFailure(exception: e);
      }
    }
  }
}
