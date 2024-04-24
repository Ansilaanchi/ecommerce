// ignore_for_file: avoid_print, sized_box_for_whitespace

import 'dart:developer';

import 'package:fashion_world/cartPages/cartGetApi.dart';
import 'package:fashion_world/cartPages/cartIdGet.dart';
import 'package:fashion_world/ip.dart';
import 'package:fashion_world/provider/dataModel.dart';
import 'package:fashion_world/whishList/whishlistApi.dart';
import 'package:fashion_world/whishList/whishlistIdPass.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ElecronicsStack extends StatefulWidget {
  const ElecronicsStack({super.key});

  @override
  State<ElecronicsStack> createState() => _ElecronicsStackState();
}

class _ElecronicsStackState extends State<ElecronicsStack> {
  @override
  void initState() {
    Provider.of<CartGetCart>(context, listen: false).fetchCart();
    Provider.of<WhishlistApi>(context, listen: false).whishData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(builder: (context, provider, child) {
      if (provider.isLoading || provider.homeData == null) {
        // If data is loading or not yet fetched, show loading indicator
        return Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return SizedBox(
            // Data is available, proceed with building the UI
            width: MediaQuery.of(context).size.width,
            height: 500,
            child: ListView.builder(
                itemCount:
                    provider.homeData?.categorizedProducts?.fasion?.length ?? 0,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final electronics = provider
                      .homeData?.categorizedProducts?.electronics![index];

                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 250,
                            width: 180,
                            // color: const Color.fromARGB(255, 182, 133, 118),
                            child: Stack(
                              children: [
                                Container(
                                  width: 150.0,
                                  height: 150.0,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      'http://$ip:3000/products-images/${electronics!.image!}',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 4.w,
                                  // bottom: 10.h,
                                  child: Consumer<WhishlistIdPass>(
                                    builder: (BuildContext context,
                                        WhishlistIdPass value, Widget? child) {
                                      return IconButton(
                                        onPressed: () {
                                          value.addAndRemove(
                                              context, electronics.id);
                                          Provider.of<WhishlistApi>(context,
                                                  listen: false)
                                              .whishData();
                                          // Add your favorite button functionality here
                                          print("favorite button");
                                        },
                                        icon: Icon(
                                          Icons.favorite_border_rounded,
                                          color: Colors.red,
                                          size: 19.sp,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Positioned(
                                  top: 18.8.h,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey,
                                        ),
                                        // color: ColorData.greyColor,
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(9),
                                            bottomRight: Radius.circular(9))),
                                    width: 40.w,
                                    height: 12.h,
                                  ),
                                ),
                                Positioned(
                                  bottom: 75,
                                  left: 8,
                                  child: Text(
                                    electronics.name ?? "",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 55,
                                  left: 8,
                                  child: Text(
                                    '\$ ${electronics.price}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 2, 2, 2)),
                                  ),
                                ),
                                SizedBox(height: 4.0),
                                Positioned(
                                  bottom: 35,
                                  left: 8,
                                  child: Text(
                                    electronics.description ?? "",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 8, 8, 8),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 5.w,
                                  bottom: 0.1.h,
                                  child: IconButton(
                                      onPressed: () {
                                        // Call the addItemToCart method with the product ID
                                        Provider.of<CartItemPass>(context,
                                                listen: false)
                                            .addItemToCart(
                                                context, electronics.id);
                                        // ignore: avoid_print
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          backgroundColor: Colors.red,
                                          content: Text('Add To Cart'),

                                          // ));                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage()
                                        ));
                                        log('$CartItemPass');
                                      },
                                      icon: Icon(
                                        Icons.control_point_rounded,
                                        size: 22.sp,
                                        color: Colors.pink,
                                      )),
                                ),
                                Positioned(
                                  bottom: 0.h,
                                  // left: 18.4.w,
                                  child: IconButton(
                                      onPressed: () {
                                        print("star icon");
                                      },
                                      icon: Icon(
                                        Icons.star_outlined,
                                        color: Colors.red,
                                        size: 13.sp,
                                      )),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 8.0),
                        ]),
                  );
                }));
      }
    });
  }
}
