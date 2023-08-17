part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeProudctWishListButtonClickedEvent extends HomeEvent {
  final ProductDataModel clickedProduct;

  HomeProudctWishListButtonClickedEvent({required this.clickedProduct});
}

class HomeProudctCartButtonClickedEvent extends HomeEvent {
  final ProductDataModel clickedProduct;

  HomeProudctCartButtonClickedEvent({required this.clickedProduct});
}

class HomeWishListButtonNavigateEvent extends HomeEvent {}

class HomeCartButtonNavigateEvent extends HomeEvent {}
