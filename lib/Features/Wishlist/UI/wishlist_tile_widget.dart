import 'package:flutter/material.dart';
import 'package:grocery_app_bloc/Features/Home/Models/home_product_data_model.dart';
import 'package:grocery_app_bloc/Features/Wishlist/bloc/wishlist_bloc.dart';

class WishlisTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final WishlistBloc wishlistBloc;
  const WishlisTileWidget(
      {super.key, required this.productDataModel, required this.wishlistBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          height: 200,
          width: double.maxFinite,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(productDataModel.imageUrl))),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          productDataModel.name,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(productDataModel.description),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '\$' + productDataModel.price.toString(),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    wishlistBloc.add(WishlistRemoveFromWishlistEvent(
                        productDataModel: productDataModel));
                  },
                  icon: Icon(Icons.favorite),
                ),
                IconButton(
                  onPressed: () {
                    // wishlistBloc.add(CartRemoveFromCartEvent(
                    //     productDataModel: productDataModel));
                  },
                  icon: Icon(Icons.shopping_bag_outlined),
                ),
              ],
            )
          ],
        ),
      ]),
    );
  }
}
