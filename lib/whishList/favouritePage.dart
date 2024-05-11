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
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemCount: wishlist!.length,
                itemBuilder: (context, index) {
                  // FavoriteItemm item = favoriteItems[index];
                  var product = wishlist[index].product;
                  return Container(
                    height: 75.h,
                    width: 30.w,
                    decoration: BoxDecoration(
                                          // color: const Color(0xFF4CAF50),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: const Color.fromARGB(255, 217, 233, 235)
                      )
                    ),
                    child: Stack(
                      children: [
                        Container(
                            height: 15.h,
                            width: 30.w,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                      'http://$ip:3000/products-images/${product!.image}',
                                    ),
                                    fit: BoxFit.cover))),
                        Positioned(
                            right: 15,
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
                                    icon: Icon(Icons.favorite, color: Colors.red,));
                              },
                            )),
                        Positioned(
                            bottom: 38,
                            left: 5,
                            child: Consumer<WhishlistApi>(
                              builder:
                                  (BuildContext context, value, Widget? child) {
                                return Text(
                                  product.name.toString(),
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                );
                              },
                            )),
                      Positioned(
                        right: 5,
                        bottom: 5,
                        child: IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart))
                      ),
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
