import 'package:fashion_world/ip.dart';
import 'package:fashion_world/ordersPages/leaveReview.dart';
import 'package:fashion_world/trackOrder/OrdersHistoryProvider.dart';
import 'package:fashion_world/trackOrder/trackOrder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class CompletedPage extends StatefulWidget {
  // final int orderIndex;

  const CompletedPage({
    Key? key,
    //  required this.orderIndex
  });

  @override
  State<CompletedPage> createState() => _CompletedPageState();
}

class _CompletedPageState extends State<CompletedPage> {
  @override
  void initState() {
    Provider.of<OrdersHistoryProvider>(context, listen: false).getAllPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<OrdersHistoryProvider>(
        builder: (BuildContext context, value, Widget? child) {
          if (value.isloading) {
            return Center(
              child: SpinKitWave(
                color: Color.fromARGB(255, 71, 161, 235),
                size: 40.0.sp,
              ),
            );
          }

          final orders = value.orderHistory.order ?? [];

          if (orders.isEmpty) {
            return Center(
              child: Text("No Order history available"),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  var product = orders[index].items![0].product;
                  return InkWell(
                    onTap: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LeaveReview(
                            productImage: product.image
                                .toString(), // Pass the product image
                            productName: product.name
                                .toString(), // Pass the product name
                            productPrice: product.price
                                .toString(), // Pass the product price
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: 18.h,
                      width: 300.w,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 231, 230, 231),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 20,
                            left: 20,
                            child: Container(
                              height: 15.h,
                              width: 28.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    'http://$ip:3000/products-images/${product!.image}',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 20,
                            left: 150,
                            child: Text(
                              product.name.toString(),
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 60,
                            left: 150,
                            child: Text(
                              product.price.toString(),
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 60,
                            right: 10,
                            child: Container(
                              height: 50,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  'Leave Review',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
