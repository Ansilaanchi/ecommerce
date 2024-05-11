import 'dart:developer';

import 'package:fashion_world/cartPages/cartGetApi.dart';
import 'package:fashion_world/cartPages/cartIdGet.dart';
import 'package:fashion_world/ip.dart';
import 'package:fashion_world/productDetailsView/fasionView.dart';
import 'package:fashion_world/whishList/whishlistApi.dart';
import 'package:fashion_world/whishList/whishlistIdPass.dart';
import 'package:flutter/material.dart';
import 'package:fashion_world/provider/dataModel.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class FasionStack extends StatefulWidget {
  const FasionStack({Key? key});

  @override
  State<FasionStack> createState() => _FasionStackState();
}

class _FasionStackState extends State<FasionStack> {
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
         child: SpinKitCircle(
  color: Color.fromARGB(255, 71, 161, 235),
  size: 35.0.sp,
  
),
        );
      } else {
        return SizedBox(
            // Data is available, proceed with building the UI
            width: MediaQuery.of(context).size.width,
                  height: 30.h,
            
            child: ListView.builder(
                itemCount:
                    provider.homeData?.categorizedProducts?.fasion?.length ?? 0,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final fasion =
                      provider.homeData?.categorizedProducts?.fasion![index];

                  return InkWell(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return FasionViewPage(
                            productName: fasion.name.toString(),
                            productImage: fasion.image.toString(),
                            productPrice: fasion.price.toString(),
                            productId: fasion.id.toString());
                      }));
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 11),
                              child: Container(
                                          height: 28.h,
                                width: 42.w,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Color.fromARGB(255, 235, 230, 230)),
                                                                    borderRadius: BorderRadius.circular(10),
                               
                                ),
                                child: Stack(
                                  children: [
                                    Container(
                                        width: 35.w,
                                      height: 15.h,
                                      decoration: BoxDecoration(
                                        // border: Border.all(
                                          // color: Colors.grey,
                                        // ),
                                        borderRadius: BorderRadius.circular(8.0),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8.0),
                                        child: Image.network(
                                          'http://$ip:3000/products-images/${fasion!.image!}',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right: 2.w,
                                      // bottom: 10.h,
                                      child: Consumer<WhishlistIdPass>(
                                        builder: (BuildContext context,
                                            WhishlistIdPass value, Widget? child) {
                                          return IconButton(
                                            onPressed: () {
                                              value.addAndRemove(
                                                  context, fasion.id);
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
                                            // border: Border.all(
                                            //   color: Colors.grey,
                                            // ),
                                            // color: ColorData.greyColor,
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(9),
                                                bottomRight: Radius.circular(9))),
                                        width: 40.w,
                                        height: 12.h,
                                      ),
                                    ),
                                    Positioned(
                                         bottom: 65,
                                      left: 8,
                                      child: Text(
                                        fasion.name ?? "",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                        bottom: 48,
                                      left: 8,
                                      child: Text(
                                        '\$ ${fasion.price}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(255, 2, 2, 2)),
                                      ),
                                    ),
                                    SizedBox(height: 4.0),
                                    
                                    Positioned(
                                      right: 3.w,
                                      bottom: 0.h,
                                      child: IconButton(
                                          onPressed: () {
                                            // Call the addItemToCart method with the product ID
                                            Provider.of<CartItemPass>(context,
                                                    listen: false)
                                                .addItemToCart(context, fasion.id);
                                            // ignore: avoid_print
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                              backgroundColor: Colors.blue,
                                              content: Text('Add To Cart'),
                              
                                              // ));                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage()
                                            ));
                                            log('$CartItemPass');
                              
                                            // AlertDialog(
                                            //   content:Container(
                                            //     height: 180,
                                            //     width: 180,
                                            //     child: Text('ADD TO CART'),
                                            //   ) ,
                                            // );
                              
                                            // ignore: avoid_print
                                            print("control button");
                                          },
                                          icon: Icon(
                                            Icons.shopping_cart,
                                            size: 22.sp,
                                            color: Colors.pink,
                                          )),
                                    ),
                                   
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 8.0),
                          ]),
                    ),
                  );
                }));
      }
    });
  }
}
