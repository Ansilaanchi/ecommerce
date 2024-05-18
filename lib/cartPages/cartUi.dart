import 'package:fashion_world/cartPages/cartGetApi.dart';
import 'package:fashion_world/cartPages/cartIdGet.dart';
import 'package:fashion_world/checkOut/shippingAddrss.dart';
import 'package:fashion_world/ip.dart';
import 'package:fashion_world/ordersPages/myOrders.dart';
import 'package:fashion_world/whishList/favouritePage.dart';
import 'package:fashion_world/pages/homePage.dart';
import 'package:fashion_world/pages/profilePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void initState() {
    Provider.of<CartGetCart>(context, listen: false).fetchCart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future<void> _refresh() {
      return Future.delayed(Duration(seconds: 1)).then((_) {
      });
    }

    return Scaffold(
      

      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Center(
          child: Text(
            'My Cart',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.grey[800],
        ),
      ),
      body: Consumer<CartGetCart>(
        builder: (context, value, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // List view of cart
              Expanded(
                child: RefreshIndicator(
                  color: Colors.blue,
                  onRefresh: _refresh,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ListView.builder(
                      itemCount: value.aabb?.data?.items?.length ?? 0,
                      padding: EdgeInsets.all(12),
                      itemBuilder: (context, index) {
                        final item = value.aabb!.data!.items![index];
                        return Stack(children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              height: 20.h,
                              width: 270.w,
                              decoration: BoxDecoration(
                                // border: Border.all(),
                                // color: Color.fromARGB(255, 187, 6, 6),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Stack(
                                children: [
                                  Container(
                                    height: 18.h,
                                    width: 25.w,
                                    decoration: BoxDecoration(
                                        // color: Colors.cyan,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                              'http://$ip:3000/products-images/${item.product!.image}',
                                            ),
                                            fit: BoxFit.cover)),
                                  ),
                                  Positioned(
                                    top: 15,
                                    left: 120,
                                    child: Text(
                                      item.product?.name ?? '',
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Positioned(
                                    top: 40,
                                    left: 120,
                                    child: Text(
                                      item.product!.price.toString(),
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                  ),
                                  Positioned(
                                    top: 65,
                                    left: 120,
                                    child: Text(
                                      item.product!.category.toString(),
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                  ),
                                  Positioned(
                                    top: 20,
                                    right: 10,
                                    child: Consumer<CartItemPass>(
                                      builder: (BuildContext context,
                                          CartItemPass value, Widget? child) {
                                        return IconButton(
                                          onPressed: () {
                                            value.removeItemFromCart(context,
                                                item.product!.sId.toString());
                                          },
                                          icon: Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 4.h,
                                    right: 2.w,
                                    child: Row(
                                      children: [
                                        Consumer<CartItemPass>(
                                          builder: (BuildContext context,
                                              CartItemPass value, Widget? child) {
                                            return InkWell(
                                              onTap: () {
                                                value.valueMinus(context,
                                                    item.product!.sId.toString());
                                                Provider.of<CartGetCart>(context,
                                                        listen: false)
                                                    .fetchCart();
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.grey,
                                                  borderRadius:
                                                      BorderRadius.circular(4.sp),
                                                ),
                                                width: 5.w,
                                                height: 4.h,
                                                child: Icon(Icons.remove,
                                                    size: 14.sp,
                                                    color: Colors.black),
                                              ),
                                            );
                                          },
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 3.w, right: 3.w),
                                          child: Text(
                                            item.quantity.toString(),
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15.sp,
                                            ),
                                          ),
                                        ),
                                        Consumer<CartItemPass>(
                                          builder: (BuildContext context, value,
                                              Widget? child) {
                                            return InkWell(
                                              onTap: () {
                                                value.valueAdd(context,
                                                    item.product!.sId.toString());
                                                Provider.of<CartGetCart>(context,
                                                        listen: false)
                                                    .fetchCart();
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.red,
                                                  borderRadius:
                                                      BorderRadius.circular(4.sp),
                                                ),
                                                width: 5.5.w,
                                                height: 4.h,
                                                child: Icon(Icons.add,
                                                    size: 14.sp,
                                                    color: Colors.white),
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          //  Divider()
                        ]);
                      },
                    ),
                  ),
                ),
              ),

              // total amount + pay now

              Padding(
                padding: const EdgeInsets.all(36.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.green,
                  ),
                  padding: const EdgeInsets.all(24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Delivery Charge: 40',
                            style: TextStyle(color: Colors.white),
                          ),
                          const SizedBox(height: 8),
                          Text(
                  "Total Price :   ${value.aabb!.total}",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),

                      // pay now
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ShippingAddress()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.green.shade200),
                            borderRadius: BorderRadius.circular(28),
                          ),
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            children: const [
                              Text(
                                'Pay Now',
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
