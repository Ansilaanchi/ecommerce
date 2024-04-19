import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

// import 'package:flutter/material.dart';

// class PaymentPage extends StatefulWidget {
//   @override
//   _PaymentPageState createState() => _PaymentPageState();
// }

// class _PaymentPageState extends State<PaymentPage> {
//   Token _paymentToken;

//   @override
//   void initState() {
//     super.initState();
//     StripePayment.setOptions(
//       StripeOptions(
//         publishableKey: "YOUR_PUBLISHABLE_KEY",
//         merchantId: "YOUR_MERCHANT_ID",
//         androidPayMode: 'test', // Change to 'production' for live payments
//       ),
//     );
//   }

//   Future<void> _startPayment() async {
//     try {
//       var paymentMethod = await StripePayment.paymentRequestWithCardForm(
//         CardFormPaymentRequest(),
//       );
//       _processPayment(paymentMethod);
//     } catch (error) {
//       print('Error: $error');
//     }
//   }

//   void _processPayment(PaymentMethod paymentMethod) async {
//     try {
//       PaymentIntentResult paymentIntentResult =
//           await StripePayment.confirmPaymentIntent(
//         PaymentIntent(
//           paymentMethodId: paymentMethod.id,
//           clientSecret: "YOUR_CLIENT_SECRET",
//         ),
//       );

//       if (paymentIntentResult.status == PaymentStatus.succeeded) {
//         setState(() {
//           _paymentToken = paymentIntentResult.paymentIntent.token;
//         });
//         // Payment successful, do something here
//       } else {
//         // Payment failed, handle the failure
//       }
//     } catch (error) {
//       print('Error: $error');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Payment Example'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//               onPressed: _startPayment,
//               child: Text('Make Payment'),
//             ),
//             if (_paymentToken != null)
//               Text('Payment Successful! Token: ${_paymentToken.tokenId}'),
//           ],
//         ),
//       ),
//     );
//   }
// }
