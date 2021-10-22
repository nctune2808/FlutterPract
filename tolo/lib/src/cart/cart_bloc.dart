import 'package:bloc/bloc.dart';
import 'package:tolo/model/cart.dart';
import 'package:tolo/src/cart/cart_repository.dart';
import 'package:tolo/utility/state/status.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final _cartRepo = CartRepository();
  CartBloc() : super(CartInitState());

  void dispose() {
    super.close();
  }

  @override
  Stream<CartState> mapEventToState(CartEvent event) async* {
    // if (event is LoadingCartEvent) {
    //   // _cartRepo.getCarts();
    //   yield CartRefreshState();
    // }

    if (event is AddCartEvent) {
      yield state.copyWith(status: StatusLoading());
      print("Press ADD");
      try {
        _cartRepo.addCart(cart: event.cart);
        yield state.copyWith(status: StatusSucess());
      } catch (e) {
        yield state.copyWith(status: StatusFailed(e: e));
      }
    }

    if (event is DeleteCartEvent) {
      yield state.copyWith(status: StatusLoading());
      print("Press DEL");
      try {
        _cartRepo.deleteCart(cart: event.cart);
        yield state.copyWith(status: StatusSucess());
      } catch (e) {
        yield state.copyWith(status: StatusFailed(e: e));
      }
    }

    if (event is UpdateCartEvent) {
      print("Press UP");
      try {
        _cartRepo.updateCart(cart: event.cart);
        yield state.copyWith(status: StatusSucess());
      } catch (e) {
        yield state.copyWith(status: StatusFailed(e: e));
      }
    }

    if (event is InsertCartEvent) {
      print('Press INS');
      try {
        _cartRepo.recoverCart(cart: event.cart);
        yield state.copyWith(status: StatusSucess());
      } catch (e) {
        yield state.copyWith(status: StatusFailed(e: e));
      }
    }

    if (event is SaveCartEvent) {
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
