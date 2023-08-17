import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:grocery_app_bloc/Data/wishlist_items.dart';
import 'package:grocery_app_bloc/Features/Home/Models/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistInitialEvent>(wishlistInitialEvent);
    on<WishlistRemoveFromWishlistEvent>(wishlistRemoveFromWishlistEvent);
  }

  FutureOr<void> wishlistInitialEvent(
      WishlistInitialEvent event, Emitter<WishlistState> emit) {
    emit(WishlistSucessState(wishlistedItems: wishlistedItems));
  }

  FutureOr<void> wishlistRemoveFromWishlistEvent(
      WishlistRemoveFromWishlistEvent event, Emitter<WishlistState> emit) {
    wishlistedItems.remove(event.productDataModel);
    emit(WishlistSucessState(wishlistedItems: wishlistedItems));
  }
}
