// ignore_for_file: file_names, avoid_print, unused_import, unnecessary_brace_in_string_interps
import 'package:fashion_world/cartPages/cartIdGet.dart';
import 'package:fashion_world/ip.dart';
import 'package:fashion_world/provider/favorite.dart';
import 'package:fashion_world/whishList/whishlistApi.dart';
import 'package:fashion_world/whishList/whishlistIdPass.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class WishListProduct extends StatelessWidget {
  final String productName;
  final String productImage;
  final String productPrice;
  final String productId;
  const WishListProduct(
      {super.key,
      required this.productName,
      required this.productImage,
      required this.productPrice,
      required this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,

        automaticallyImplyLeading: true,
        // leading: IconButton(
        //     onPressed: () {
        //       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        //         return MainPage();
        //       }));
        //     },
        //     icon: Icon(Icons.arrow_back, color: ColorData.white)),
        title: Center(
          // widthFactor: 1.5.sp,
          child: Text(
            "Product Details",
            style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
        actions: [
          Consumer(
            builder: (BuildContext context, value, Widget? child) {
              return Consumer<FavoriteProvider>(
                builder: (BuildContext context, favorite, Widget? child) {
                  return Consumer<WhishlistApi>(
                    builder: (BuildContext context, value, Widget? child) {
                      return IconButton(
                          onPressed: () {
                            context.read<WhishlistIdPass>();
                            // value.addAndRemove(productId, context);
                            context.read<WhishlistApi>().whishData();
                          },
                          icon: Icon(
                            favorite.favorite,
                            color: Colors.white,
                          ));
                    },
                  );
                },
              );
            },
          ),
          SizedBox(
            width: 1.w,
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 2.h,
            ),
            width: 95.w,
            height: 60.h,
            decoration: BoxDecoration(
                // border: Border.all(color: ColorData.wgrey),
                borderRadius: BorderRadius.circular(5.sp),
                image: DecorationImage(
                    image: NetworkImage(
                        'http://$ip:3000/products-images/${productImage}'),
                    fit: BoxFit.cover)),
          ),
          Stack(
            children: [
              SizedBox(
                width: 100.w,
                height: 16.h,
                // color: ColorData.pink,
              ),
              Positioned(
                left: 5.w,
                top: 4.h,
                child: Text(
                  productName,
                  style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Positioned(
                top: 9.h,
                left: 6.w,
                child: Text(
                  "Price : ${productPrice}",
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 55,
            width: 90.w,
            child: Consumer<CartItemPass>(
              builder: (BuildContext context, cart, Widget? child) {
                return ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(12.sp)))),
                    onPressed: () {
                        Provider.of<CartItemPass>(context, listen: false)
                            .addItemToCart(context, productId);
                        print("Add to Cart");
                    },
                    child: Text(
                      "Add to Cart",
                      style: TextStyle(color: Colors.white, fontSize: 11.sp),
                    ));
              },
            ),
          )
        ],
      ),
    );
  }
}