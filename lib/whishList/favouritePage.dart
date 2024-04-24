// ignore_for_file: use_key_in_widget_constructors

import 'package:fashion_world/ip.dart';
import 'package:fashion_world/whishList/whishlistApi.dart';
import 'package:fashion_world/whishList/whishlistIdPass.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class FavoritePage extends StatefulWidget {
  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  void initState() {
    Provider.of<WhishlistApi>(context, listen: false).whishData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Wishlist'),
        ),
        body: Consumer<WhishlistApi>(
          builder: (BuildContext context, value, Widget? child) {
            if (value.isLoading || value.wishListmodel == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              var wishlist = value.wishListmodel!.wishlist;

              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 3,
                ),
                itemCount: wishlist!.length,
                itemBuilder: (context, index) {
                  // FavoriteItemm item = favoriteItems[index];
                  var product = wishlist[index].product;
                  return Container(
                    height: 15.h,
                    width: 8.w,
                    decoration: BoxDecoration(),
                    child: Stack(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                          'http://$ip:3000/products-images/${product!.image}',
                        )))),
                        Positioned(
                            right: 3,
                            child: Consumer<WhishlistIdPass>(
                              builder: (BuildContext context, idPass,
                                  Widget? child) {
                                return IconButton(
                                    onPressed: () {
                                      idPass.addAndRemove(context, product.id);
                                      Provider.of<WhishlistApi>(context,
                                              listen: false)
                                          .whishData();
                                    },
                                    icon: Icon(Icons.favorite));
                              },
                            )),
                        Positioned(
                            bottom: 3,
                            left: 4,
                            child: Consumer<WhishlistApi>(
                              builder:
                                  (BuildContext context, value, Widget? child) {
                                return Text(
                                  product.name.toString(),
                                );
                              },
                            )),
                        // Positioned(
                        //     bottom: 23,
                        //     left: 3,
                        //     child: Consumer<WhishlistApi>(
                        //       builder: (BuildContext context, WhishlistApi value, Widget? child) {
                        //         return Text(
                        //                                         product.category.toString()

                        //       );
                        //        },

                        //     )),
                      ],
                    ),
                  );
                },
              );
            }
          },
        ));
  }
}
