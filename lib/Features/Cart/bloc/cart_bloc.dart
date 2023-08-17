import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:grocery_app_bloc/Data/cart_items.dart';

import 'package:grocery_app_bloc/Features/Home/Models/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvnet>(cartInitialEvnet);
    on<CartRemoveFromCartEvent>(cartRemoveFromCartEvent);
  }

  FutureOr<void> cartInitialEvnet(
      CartInitialEvnet event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartItems: cartItems));
  }

  FutureOr<void> cartRemoveFromCartEvent(
      CartRemoveFromCartEvent event, Emitter<CartState> emit) {
    cartItems.remove(event.productDataModel);
    emit(CartSuccessState(cartItems: cartItems));
    emit(CartProductItemRemovedFromCartActionState());
  }
}
