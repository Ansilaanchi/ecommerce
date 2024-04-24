import 'dart:developer';
// import 'package:fashion_world/ip.dart';
import 'package:fashion_world/paymentPages/verifyPayment.dart';
import 'package:fashion_world/paymentPages/verifyPaymentProvider.dart';
import 'package:fashion_world/placeOrder/placeorder/orderCreation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;


class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<OrderCreationProvider>(
          builder: (BuildContext context, orderProvider, Widget? child) {
            var orderModel = orderProvider.orderCreation;
            if (orderModel != null) {
              var amount = orderModel.order?.amount;
              var orderId = orderModel.order?.id;
              var state = orderModel.order?.receipt;
              log('amount: $amount');
              log('id: $orderId');
              log('receipt:$state');

              log('Order created: $orderModel');

              if (orderProvider.isLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return InkWell(
                  onTap: () {
                    log("Razorpay payment initiated");

                    // Configure Razorpay options
                    var options = {
                      'key': 'rzp_test_pJw1K1QJDp192x',
                      'amount': amount,
                      'name': 'Acme Corp.',
                      'order_id': "$orderId",
                      'description': 'Fine T-Shirt',
                      'prefill': {
                        'contact': '8888888888',
                        'email': 'rasir239@gmail.com',
                      }
                    };

                    Razorpay razorpay = Razorpay();
                    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR,
                        handlePaymentErrorResponse);
                    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
                        handlePaymentSuccessResponse);
                    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET,
                        handleExternalWalletSelected);
                    razorpay.open(options);

                    // if (razorpay == 200) {
                    //   Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) => VerifyPayment()));
                    // }
                  },
                  child: Container(
                    height: 60,
                    width: 100,
                    color: Colors.blue,
                    child: Center(
                      child: Text(
                        'Pay Now',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                );
              }
            } else {
              return Center(
                child: Text('Order is null!....'),
              );
            }
          },
        ),
      ),
    );
  }

  void handlePaymentErrorResponse(PaymentFailureResponse response) {
    /*
    * PaymentFailureResponse contains three values:
    * 1. Error Code
    * 2. Error Description
    * 3. Metadata
    * */
    showAlertDialog(context, "Payment Failed",
        "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response) {
    /*
    * Payment Success Response contains three values:
    * 1. Order ID
    * 2. Payment ID
    * 3. Signature
    * */

  var orderId = response.orderId!;
  var paymentId = response.paymentId!;
  var signature = response.signature!;
  var state = context.read<OrderCreationProvider>().orderCreation?.order?.receipt;

  Provider.of<VerifyPaymentProvider>(context, listen: false).verifyPayment(
    paymentId,
    orderId,
    signature,
    state!,
    context,
  );


    log(response.data.toString());
    showAlertDialog(
        context, "Payment Successful", "Payment ID: ${response.paymentId}");


  }

  void handleExternalWalletSelected(ExternalWalletResponse response) {
    showAlertDialog(
        context, "External Wallet Selected", "${response.walletName}");
  }

  void showAlertDialog(BuildContext context, String title, String message) {
    // set up the buttons
    Widget continueButton = ElevatedButton(
      child: const Text("Continue"),
      onPressed: () {},
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
    // Function to verify payment
  
}
