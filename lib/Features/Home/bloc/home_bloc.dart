import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:grocery_app_bloc/Data/cart_items.dart';
import 'package:grocery_app_bloc/Data/grocery_data.dart';
import 'package:grocery_app_bloc/Data/wishlist_items.dart';
import 'package:meta/meta.dart';

import '../Models/home_product_data_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeWishListButtonNavigateEvent>(homeWishListButtonNavigateEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
    on<HomeProudctWishListButtonClickedEvent>(
        homeProudctWishListButtonClickedEvent);
    on<HomeProudctCartButtonClickedEvent>(homeProudctCartButtonClickedEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 5));
    emit(HomeLoadedSuccessState(
        products: GroceryData.groceryProducts
            .map((e) => ProductDataModel(
                id: e['id'],
                name: e['name'],
                description: e['description'],
                price: e['price'],
                imageUrl: e['imageUrl']))
            .toList()));
  }

  FutureOr<void> homeWishListButtonNavigateEvent(
      HomeWishListButtonNavigateEvent event, Emitter<HomeState> emit) {
    print('Wishlist navigate Clicked');
    emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> homeCartButtonNavigateEvent(
      HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    print('Cart navigate Clicked');
    emit(HomeNavigateToCartPageActionState());
  }

  FutureOr<void> homeProudctWishListButtonClickedEvent(
      HomeProudctWishListButtonClickedEvent event, Emitter<HomeState> emit) {
    print('Wishlist product  is clicked');
    wishlistedItems.add(event.clickedProduct);
    emit(HomeProductItemWishListedActionState());
  }

  FutureOr<void> homeProudctCartButtonClickedEvent(
      HomeProudctCartButtonClickedEvent event, Emitter<HomeState> emit) {
    print('Cart product is clicked');
    cartItems.add(event.clickedProduct);
    emit(HomeProductItemCartedActionState());
  }
}
