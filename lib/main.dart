import 'package:fashion_world/bannerPage/bannerGet.dart';
import 'package:fashion_world/cartPages/cartGetApi.dart';
import 'package:fashion_world/cartPages/cartIdGet.dart';
import 'package:fashion_world/checkOut/checkoutApi.dart';
import 'package:fashion_world/editProfile/profileService.dart';
import 'package:fashion_world/pages/homePage.dart';
import 'package:fashion_world/paymentPages/verifyPaymentProvider.dart';
import 'package:fashion_world/placeOrder/placeorder/orderCreation.dart';
import 'package:fashion_world/provider/bottomProvider.dart';
import 'package:fashion_world/provider/dataModel.dart';
import 'package:fashion_world/registerPages/login.dart';
import 'package:fashion_world/whishList/whishlistApi.dart';
import 'package:fashion_world/whishList/whishlistIdPass.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool userlogin = prefs.getBool('userlogin') ?? false;
  runApp(
    MyApp(
      userlogin: userlogin,
    ),
  );
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({super.key, required this.userlogin});
  bool userlogin;

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, screenType) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => DataProvider()),
          ChangeNotifierProvider(create: (_) => BottomProvider()),
          ChangeNotifierProvider(create: (_) => ProfileProvider()),
          ChangeNotifierProvider(create: (_) => BannerGetData()),
          ChangeNotifierProvider(create: (_) => CartGetCart()),
          ChangeNotifierProvider(
            create: (_) => CartItemPass(),
          ),
          ChangeNotifierProvider(
            create: (_) => WhishlistApi(),
          ),
          ChangeNotifierProvider(
            create: (_) => WhishlistIdPass(),
          ),
          ChangeNotifierProvider(create: (_) => CheckoutApi()),
          ChangeNotifierProvider(create: (_) => OrderCreationProvider()),
          ChangeNotifierProvider(create: (_) => VerifyPaymentProvider()),

          //VerifyPaymentProvider
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              // textButtonTheme: TextButtonTemeData()
              ),
          home: userlogin ? HomePage() : LoginPage(),
          // home:ProductListScreen(),
        ),
      );
    });
  }
}
