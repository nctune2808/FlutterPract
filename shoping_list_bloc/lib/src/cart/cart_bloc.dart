import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shoping_list_bloc/model/cart.dart';
import 'package:shoping_list_bloc/model/cart.dart';
import 'package:shoping_list_bloc/src/cart/cart_repository.dart';
import 'package:shoping_list_bloc/utility/state/form_submission_status.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final _cartRepo = CartRepository();
  CartBloc() : super(CartState());

  void dispose() {
    super.close();
  }

  @override
  Stream<CartState> mapEventToState(CartEvent event) async* {
    if (event is LoadingCartEvent) {
      // _cartRepo.getCarts();
      yield RefreshableCart();
    }

    if (event is AddCartEvent) {
      yield state.copyWith(formStatus: Submitting());
      print("Press ADD");
      try {
        _cartRepo.addCart(cart: event.cart);
        yield state.copyWith(formStatus: SubmissionSucess());
      } catch (e) {
        yield state.copyWith(formStatus: SubmissionFailed(exception: e));
      }
    }

    if (event is DeleteCartEvent) {
      yield state.copyWith(formStatus: Submitting());
      print("Press DEL");
      try {
        _cartRepo.deleteCart(cart: event.cart);
        yield state.copyWith(formStatus: SubmissionSucess());
      } catch (e) {
        yield state.copyWith(formStatus: SubmissionFailed(exception: e));
      }
    }

    if (event is UpdateCartEvent) {
      print("Press UP");
      try {
        _cartRepo.updateCart(cart: event.cart);
        yield state.copyWith(formStatus: SubmissionSucess());
      } catch (e) {
        yield state.copyWith(formStatus: SubmissionFailed(exception: e));
      }
    }

    if (event is InsertCartEvent) {
      print('Press INS');
      try {
        _cartRepo.recoverCart(cart: event.cart);
        yield state.copyWith(formStatus: SubmissionSucess());
      } catch (e) {
        yield state.copyWith(formStatus: SubmissionFailed(exception: e));
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
