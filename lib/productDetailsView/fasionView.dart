// ignore_for_file: file_names, avoid_print, unused_import, unnecessary_brace_in_string_interps
import 'package:fashion_world/cartPages/cartGetApi.dart';
import 'package:fashion_world/cartPages/cartIdGet.dart';
import 'package:fashion_world/cartPages/cartUi.dart';
import 'package:fashion_world/ip.dart';
import 'package:fashion_world/pages/homePage.dart';
import 'package:fashion_world/placeOrder/placeorder/orderCreation.dart';
import 'package:fashion_world/provider/favorite.dart';
import 'package:fashion_world/trackOrder/OrdersHistoryProvider.dart';
import 'package:fashion_world/whishList/whishlistApi.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class FasionViewPage extends StatelessWidget {
  final String productName;
  final String productImage;
  final String productPrice;
  final dynamic productId;

  const FasionViewPage({
    Key? key,
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.productId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.blue,
        title: Center(
          widthFactor: 1.5.sp,
          child: Text(
            "Product Details",
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: 2.h,
              ),
              width: 95.w,
              height: 50.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.sp),
                image: DecorationImage(
                  image: NetworkImage(
                    'http://$ip:3000/products-images/$productImage',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Stack(
              children: [
                SizedBox(
                  width: 100.w,
                  height: 16.h,
                ),
                Positioned(
                  left: 5.w,
                  top: 4.h,
                  child: Text(
                    productName,
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Positioned(
                  top: 9.h,
                  left: 6.w,
                  child: Text(
                    "Price : $productPrice",
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: SizedBox(
                height: 55,
                width: 90.w,
                child: Consumer<CartItemPass>(
                  builder: (BuildContext context, provider, Widget? child) {
                    return ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.sp),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Provider.of<CartItemPass>(context, listen: false)
                            .addItemToCart(context, productId);
                        print("Add to Cart");
                        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>CartPage()));
                      },
                      child: Text(
                        "Add to Cart",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11.sp,
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
