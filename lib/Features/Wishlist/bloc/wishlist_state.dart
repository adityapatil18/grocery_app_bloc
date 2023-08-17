part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistState {}

abstract class WishlistActionState {}

class WishlistInitial extends WishlistState {}

class WishlistSucessState extends WishlistState {
  final List<ProductDataModel> wishlistedItems;

  WishlistSucessState({required this.wishlistedItems});
}
