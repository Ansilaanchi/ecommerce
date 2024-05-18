// import 'package:fashion_world/ip.dart';
// import 'package:fashion_world/whishList/whishlistApi.dart';
// import 'package:fashion_world/whishList/whishlistIdPass.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:sizer/sizer.dart';

// class FavoritePage extends StatefulWidget {
//   @override
//   State<FavoritePage> createState() => _FavoritePageState();
// }

// class _FavoritePageState extends State<FavoritePage> {
//   @override
//   void initState() {
//     Provider.of<WhishlistApi>(context, listen: false).whishData();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           automaticallyImplyLeading: false,
//           title: Text('Wishlist'),
//         ),
//         body: Consumer<WhishlistApi>(
//           builder: (BuildContext context, value, Widget? child) {
//             if (value.isLoading || value.wishListmodel == null) {
//               return Center(
//                 child: CircularProgressIndicator(),
//               );
//             } else {
//               var wishlist = value.wishListmodel!.wishlist;

//               return GridView.builder(
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   mainAxisSpacing: 8,
//                   crossAxisSpacing: 8,
//                 ),
//                 itemCount: wishlist!.length,
//                 itemBuilder: (context, index) {
//                   // FavoriteItemm item = favoriteItems[index];
//                   var product = wishlist[index].product;
//                   return Container(
//                     height: 75.h,
//                     width: 30.w,
//                     decoration: BoxDecoration(
//                         // color: const Color(0xFF4CAF50),
//                         borderRadius: BorderRadius.circular(10),
//                         border: Border.all(
//                             color: const Color.fromARGB(255, 217, 233, 235))),
//                     child: Stack(
//                       children: [
//                         Container(
//                             height: 15.h,
//                             width: 30.w,
//                             decoration: BoxDecoration(
//                                 image: DecorationImage(
//                                     image: NetworkImage(
//                                       'http://$ip:3000/products-images/${product!.image}',
//                                     ),
//                                     fit: BoxFit.cover))),
//                         Positioned(
//                             right: 15,
//                             child: Consumer<WhishlistIdPass>(
//                               builder: (BuildContext context, idPass,
//                                   Widget? child) {
//                                 return IconButton(
//                                     onPressed: () {
//                                       idPass.addAndRemove(context, product.id);
//                                       Provider.of<WhishlistApi>(context,
//                                               listen: false)
//                                           .whishData();
//                                     },
//                                     icon: Icon(
//                                       Icons.favorite,
//                                       color: Colors.red,
//                                     ));
//                               },
//                             )),
//                         Positioned(
//                             bottom: 38,
//                             left: 5,
//                             child: Consumer<WhishlistApi>(
//                               builder:
//                                   (BuildContext context, value, Widget? child) {
//                                 return Text(
//                                   product.name.toString(),
//                                   style: TextStyle(fontWeight: FontWeight.bold),
//                                 );
//                               },
//                             )),
//                         Positioned(
//                             right: 5,
//                             bottom: 5,
//                             child: IconButton(
//                                 onPressed: () {},
//                                 icon: Icon(Icons.shopping_cart))),
//                       ],
//                     ),
//                   );
//                 },
//               );
//             }
//           },
//         ));
//   }
// }




// ignore_for_file: use_build_context_synchronously, avoid_print, unused_import
import 'dart:developer';

import 'package:fashion_world/ip.dart';
import 'package:fashion_world/whishList/whishlistApi.dart';
import 'package:fashion_world/whishList/whishlistIdPass.dart';
import 'package:fashion_world/whishList/whishlistView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _WishListPageState();
}

class _WishListPageState extends State<FavoritePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    Provider.of<WhishlistApi>(context, listen: false).whishData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        title: Center(
          // widthFactor: 2.6.sp,
          child: Text(
            "Wishlist",
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Consumer<WhishlistApi>(
        builder: (BuildContext context, value, Widget? child) {
                                if (value.isLoading || value.wishListmodel == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              var wishlist = value.wishListmodel!.wishlist;

          if (wishlist == null ||
              wishlist.isEmpty) {
            return Center(
              child: Text(
                "Your wishlist is empty",
                style: TextStyle(
                  fontSize: 13.sp,
                  color: Color.fromARGB(255, 206, 202, 202),
                ),
              ),
            );
          }
          return RefreshIndicator(
            color: Colors.blue,
            onRefresh: _refresh,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 4.4,
                // mainAxisSpacing: 1,
              ),
              shrinkWrap: true,
                            //  itemCount: wishlist!.length,
                itemBuilder: (context, index) {
                  var product = wishlist[index].product;
                if (product == null) {
                  return SizedBox(); // Return an empty widget if product is null
                }

                return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return WishListProduct(
                          productName: product.name.toString(),
                          productImage: product.image.toString(),
                          productPrice: product.price.toString(),
                          productId: product.id.toString());
                    }));
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 1.h,
                      left: 2.w,
                      right: 2.w,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 4.h,
                        ),
                        Stack(
                          children: [
                            SizedBox(
                              width: 20.w,
                              height: 30.h,
                            ),
                            Container(
                              width: 40.w,
                              height: 18.h,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(6),
                                  topRight: Radius.circular(6),
                                ),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    'http://$ip:3000/products-images/${product.image ?? ""}',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsets.only(left: 26.w, bottom: 12.h),
                                child: Consumer<WhishlistIdPass>(
                                  builder: (BuildContext context, value,
                                      Widget? child) {
                                    return IconButton(
                                    onPressed: () {
                                      
                                      // idPass.addAndRemove(context, product.id);
                                      Provider.of<WhishlistApi>(context,
                                              listen: false)
                                          .whishData();
                                    },
                                    icon: Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    ));
                                  },
                                ),
                              ),
                            ),
                            Positioned(
                              top: 17.9.h,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(6),
                                    bottomRight: Radius.circular(6),
                                  ),
                                ),
                                width: 39.9.w,
                                height: 8.5.h,
                              ),
                            ),
                            Positioned(
                              bottom: 6.h,
                              left: 3.w,
                              child: Text(
                                'Price : ${product.price}',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 9.sp),
                              ),
                            ),
                            Positioned(
                              left: 3.w,
                              bottom: 8.7.h,
                              child: Text(
                                product.name ?? "",
                                style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: Colors.black,
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            // Positioned(
                            //   right: 1.w,
                            //   top: 20.h,
                            //   child: IconButton(
                            //     onPressed: () {
                            //       // Add to cart functionality goes here
                            //       print("Add to cart button");
                            //     },
                            //     icon: Icon(
                            //       Icons.add_shopping_cart_sharp,
                            //       size: 29.sp,
                            //       color: Colors.red,
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
            );
     }  } )
    );
  
  }

  Future<void> _refresh() {
    context.read<WhishlistApi>();
    return Future.delayed(Duration(seconds: 1));
  }
}