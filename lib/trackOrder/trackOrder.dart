import 'package:fashion_world/downloadInvoice/invoiceApi.dart';
import 'package:fashion_world/ip.dart';
import 'package:fashion_world/placeOrder/placeorder/orderCreation.dart';
import 'package:fashion_world/trackOrder/orderProvider.dart';
import 'package:flutter/material.dart';
import 'package:fashion_world/trackOrder/OrdersHistoryProvider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class TrackOrder extends StatefulWidget {
  final dynamic orderIndex;

  const TrackOrder({Key? key, required this.orderIndex}) : super(key: key);

  @override
  State<TrackOrder> createState() => _TrackOrderState();
}

class _TrackOrderState extends State<TrackOrder> {
  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<OrdersHistoryProvider>(context);
    final order = orderProvider.orderHistory.order?[widget.orderIndex];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Center(
          widthFactor: 1.8.sp,
          child: Text(
            "Track Order",
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: order != null
          ? SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: 100.w,
                        height: 26.h,
                      ),
                      Positioned(
                        top: 3.h,
                        left: 3.w,
                        child: Container(
                          width: 36.w,
                          height: 20.h,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1.sp, color: Colors.grey),
                            borderRadius: BorderRadius.all(Radius.circular(11)),
                            image: DecorationImage(
                              image: NetworkImage(
                                'http://$ip:3000/products-images/${order.items![0].product!.image}',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 7.h,
                        left: 44.w,
                        child: Text(
                          order.items![0].product!.name.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 14.h,
                        left: 44.w,
                        child: Text(
                          'Price : ${order.items!.first.product!.price}',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 10.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Divider(
                    endIndent: 14.sp,
                    indent: 14.sp,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 2.h, left: 3.w),
                    child: Text(
                      "Order Status",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 15.sp,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 4.w),
                    child: Column(
                      children: [
                        MyTimeLine(
                          isFirst: true,
                          isLast: false,
                          isPast: true,
                          eventCart: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 4.h,
                              ),
                              Text(
                                'Name',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10.sp),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Text(
                                order.name.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.sp),
                              ),
                            ],
                          ),
                        ),
                        MyTimeLine(
                          isFirst: false,
                          isLast: false,
                          isPast: true,
                          eventCart: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 4.h, bottom: 1.h),
                                child: Text(
                                  'Address',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10.sp),
                                ),
                              ),
                              Text(
                                order.address.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.sp),
                              ),
                            ],
                          ),
                        ),
                        MyTimeLine(
                          isFirst: false,
                          isLast: true,
                          isPast: false,
                          eventCart: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 4.h, bottom: 1.h),
                                child: Text(
                                  'Status',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10.sp),
                                ),
                              ),
                              Text(
                                order.status.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11.sp),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      //////////////////////////////////////////////////////////////////////////////////////
                      // invoice.addOrderID(widget.orderID);
                      // invoice.initializeNotifications();
                      var orderId = Provider.of<OrderCreationProvider>(context,
                              listen: false)
                          .orderCreation
                          ?.order
                          ?.id;
                      if (orderId != null) {
                        Provider.of<InvoiceApi>(context, listen: false)
                            .addOrderID(orderId);
                      } else {
                        // If orderId is null, show a message or handle the error
                        print('Error: Order ID is null');
                      }
                    },
                    child: SizedBox(
                      height: 5.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.file_download_outlined,
                            color: Colors.black,
                          ),
                          Text(
                            "Invoice download",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
