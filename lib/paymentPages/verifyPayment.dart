import 'package:fashion_world/downloadInvoice/invoiceApi.dart';
import 'package:fashion_world/pages/homePage.dart';
import 'package:fashion_world/placeOrder/placeorder/orderCreation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class VerifyPayment extends StatelessWidget {
  const VerifyPayment({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30.h,
            ),
            Center(
              child: CircleAvatar(
                radius: 65.sp,
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.verified_rounded,
                  color: Colors.white,
                  size: 90.sp,
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              "Payment Successfully !",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp,
                  color: Colors.black),
            ),
            SizedBox(
              height: 0.4.h,
            ),
            Text(
              "Thank you for your purchase.",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 11.sp,
                  color: Colors.black),
            ),
            SizedBox(
              height: 18.h,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return HomePage();
                  }));
                },
                child: Container(
                    height: 7.h,
                    width: 38.w,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "Continue to shopping",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
              ),
              InkWell(
                onTap: () {
                  // downloadFile();
                  var orderId =
                      Provider.of<OrderCreationProvider>(context, listen: false)
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
                child: Container(
                    height: 7.h,
                    width: 38.w,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "Download Invoice",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 11.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
