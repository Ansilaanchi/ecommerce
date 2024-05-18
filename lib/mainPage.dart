// ignore_for_file: file_names, unused_local_variable, unused_import
import 'dart:developer';
import 'package:fashion_world/cartPages/cartUi.dart';
import 'package:fashion_world/pages/homePage.dart';
import 'package:fashion_world/pages/profilePage.dart';
import 'package:fashion_world/whishList/favouritePage.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> pages = [
    const HomePage(),
    FavoritePage(),
    const CartPage(),
    // AllProducts(),
    const ProfilePage()
  ];
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
          useLegacyColorScheme: false,
          enableFeedback: true,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          // backgroundColor: ColorData.pink,
          currentIndex: currentPage,
          onTap: (value) {
            setState(() {
              currentPage = value;
            });
          },
          iconSize: 22.sp,
          unselectedItemColor: Colors.blue,
          selectedItemColor: Colors.blue,
          elevation: 5.h,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_rounded,
                // color: ColorData.red,
                // size: 22.sp,
              ),
              label: '',
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(
            //     Icons.search,
            //     // color: ColorData.red,
            //     // size: 22.sp,
            //   ),
            //   label: '',
            // ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_border_rounded,
                // color: ColorData.red,
                // size: 22.sp,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart_rounded,
                // color: ColorData.red,
                // size: 22.sp,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
                // color: ColorData.red,
                // size: 22.sp,
              ),
              label: '',
            ),
          ]),
    );
  }
}
