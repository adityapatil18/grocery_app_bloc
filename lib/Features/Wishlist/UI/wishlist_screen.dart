import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app_bloc/Features/Wishlist/UI/wishlist_tile_widget.dart';

import 'package:grocery_app_bloc/Features/Wishlist/bloc/wishlist_bloc.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  final WishlistBloc wishlistBloc = WishlistBloc();
  @override
  void initState() {
    wishlistBloc.add(WishlistInitialEvent());
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist Items'),
      ),
      body: BlocConsumer<WishlistBloc, WishlistState>(
        bloc: wishlistBloc,
        listener: (context, state) {},
        listenWhen: (previous, current) => current is WishlistActionState,
        buildWhen: (previous, current) => current is! WishlistActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case WishlistSucessState:
              final successState = state as WishlistSucessState;
              return ListView.builder(
                itemCount: successState.wishlistedItems.length,
                itemBuilder: (context, index) {
                  return WishlisTileWidget(
                    wishlistBloc: wishlistBloc,
                    productDataModel: successState.wishlistedItems[index],
                  );
                },
              );

            default:
          }
          return Container();
        },
      ),
    );
  }
}
