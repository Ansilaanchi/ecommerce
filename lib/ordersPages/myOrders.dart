import 'package:fashion_world/ordersPages/leaveReview.dart';
import 'package:fashion_world/ordersPages/completedPage.dart';
import 'package:fashion_world/ordersPages/whatsappTab.dart';
import 'package:flutter/material.dart';

import 'active.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({super.key});

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
              backgroundColor: Color.fromARGB(255, 230, 228, 235),
              toolbarHeight: 100,
              title: Column(children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  
                    Text(
                      'My Orders',
                      style: TextStyle(
                        color: Color.fromARGB(255, 12, 10, 10),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                TabBar(
                    labelColor: Colors.purple,
                    indicator: BoxDecoration(color: Colors.transparent),
                    tabs: [
                      RowTab(
                        text: 'Active',
                        style: TextStyle(fontSize: 20),
                      ),
                      RowTab(
                        text: 'Completed',
                        style: TextStyle(fontSize: 20),
                      ),
                      // RowTab(
                      //   text: 'Cancelled',
                      //   style: TextStyle(fontSize: 20),
                      // ),
                    ]),
              ])),
          body: TabBarView(children: [
            ActivePage(),
            CompletedPage(),
            // CancelPage(),
          ])),
    );

    //
  }
}
