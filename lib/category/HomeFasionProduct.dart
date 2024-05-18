// ignore_for_file: use_build_context_synchronously, avoid_print, unused_import
import 'package:fashion_world/ip.dart';
import 'package:fashion_world/productDetailsView/electronicsView.dart';
import 'package:fashion_world/provider/dataModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class HomeFasionProduct extends StatelessWidget {
  const HomeFasionProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<DataProvider>(
        builder: (BuildContext context, value, Widget? child) {
          if (value.isLoading) {
            return Center(
                child: CircularProgressIndicator(
              color: Colors.grey,
            ));
          }
          final categorizedProducts = value.homeData!.categorizedProducts;
          return Padding(
            padding: EdgeInsets.only(top: 2.h),
            child: GridView.builder(
              // itemCount: categorizedProducts
              //         .categorizedProducts?.electronics?.length ??
              //     0,
              itemCount: categorizedProducts?.electronics?.length ?? 0,
              scrollDirection: Axis.vertical,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 6 / 8,
                // mainAxisSpacing: 1,
                // mainAxisExtent: 3,
                // crossAxisSpacing: 1
              ),
              itemBuilder: ((context, index) {
                final fasion = categorizedProducts?.fasion![index];
                return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ElectronicsPage(
                        productName: fasion!.name.toString(),
                        productImage: fasion.image.toString(),
                        productPrice: fasion.price.toString(),
                        productId: fasion.id.toString(),
                      );
                    }));
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: 1.h, left: 2.w, right: 2.w),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            SizedBox(
                              // color: ColorData.pink,
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
                                      topRight: Radius.circular(6)),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          'http://$ip:3000/products-images/${fasion!.image!}'),
                                      fit: BoxFit.cover)),
                              // child: Padding(
                              //   padding:
                              //       EdgeInsets.only(left: 26.w, bottom: 12.h),
                              //   child: Consumer<FavoriteProvider>(
                              //     builder: (BuildContext context, favorite,
                              //         Widget? child) {
                              //       return Consumer<WishListViewProvider>(
                              //         builder: (BuildContext context, value,
                              //             Widget? child) {
                              //           return IconButton(
                              //               onPressed: () {
                              //                 context
                              //                     .read<FavoriteProvider>()
                              //                     .changeFavorite();
                              //                 value.addAndRemove(
                              //                     electronics.id, context);
                              //                 context
                              //                     .read<WishListDataProvider>()
                              //                     .getAllPosts();
                              //                 print("favorite button");
                              //               },
                              //               icon: Icon(
                              //                 favorite.favorite,
                              //                 color: Colors.red,
                              //                 size: 19.sp,
                              //               ));
                              //         },
                              //       );
                              //     },
                              //   ),
                              // ),
                            ),
                            Positioned(
                              top: 17.9.h,
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    // color: ColorData.greyColor,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(6),
                                        bottomRight: Radius.circular(6))),
                                width: 39.9.w,
                                height: 8.5.h,
                              ),
                            ),
                            //
                            // fasion.price;

                            // Positioned(
                            //   bottom: 8.7.h,
                            //   left: 32.w,
                            //   child: Text(
                            //     '\$ ${fasion.price}',
                            //     style: TextStyle(color: (Colors.grey)),
                            //   ),
                            // ),
                            // .star_outlined;
                            //

                            //
                            // Positioned(
                            //   bottom: 6.6.h,
                            //   left: 22.w,
                            //   child: IconButton(
                            //       onPressed: () {
                            //         // ignore: avoid_print
                            //         print("star icon");
                            //       },
                            //       icon: Icon(
                            //         Icons.star_outlined,
                            //         color: Colors.yellow,
                            //         size: 13.sp,
                            //       )),
                            // ),
                            // Positioned(
                            //   bottom: 5.7.h,
                            //   left: 2.3.w,
                            //   child: Text(
                            //     users[index].subName,
                            //     style: TextStyle(
                            //         fontWeight: FontWeight.w400, fontSize: 10.sp),
                            //   ),
                            // ),
                            Positioned(
                                bottom: 6.h,
                                left: 3.w,
                                child: Text(
                                  'Price : ${fasion.price}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 9.sp),
                                )),
                            Positioned(
                              left: 3.w,
                              bottom: 8.7.h,
                              child: Text(
                                fasion.name ?? "",
                                style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.black,
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            // Positioned(
                            //   right: 1.w,
                            //   top: 20.h,
                            //   child: Consumer<AddCartProvider>(
                            //     builder: (BuildContext context, value,
                            //         Widget? child) {
                            //       return IconButton(
                            //           onPressed: () {
                            //             value.add(electronics.id, context);
                            //             print("control button");
                            //           },
                            //           icon: Icon(
                            //             Icons.add_shopping_cart_sharp,
                            //             size: 29.sp,
                            //             color: Colors.red,
                            //           ));
                            //     },
                            //   ),
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          );
        },
      ),
    );
  }
}
