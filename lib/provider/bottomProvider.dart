// void _onItemTapped(int index) {

import 'dart:developer';

import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:fashion_world/cartPages/cartUi.dart';
import 'package:fashion_world/pages/chat.dart';
import 'package:fashion_world/whishList/favouritePage.dart';
import 'package:fashion_world/pages/homePage.dart';
import 'package:flutter/material.dart';

import '../pages/profilePage.dart';

class BottomProvider extends ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  final List<Widget> _pages = [
    HomePage(),
    CartPage(),
    FavoritePage(),
    ChatPage(),
    ProfilePage(),
  ];

  final List<CurvedNavigationBarItem> items = [
    CurvedNavigationBarItem(
      child: Icon(Icons.home),
      label: 'Home',
    ),
    CurvedNavigationBarItem(
      child: Icon(Icons.shopping_bag),
      label: 'Cart',
    ),
    CurvedNavigationBarItem(
      child: Icon(Icons.favorite),
      label: 'Favorites',
    ),
    CurvedNavigationBarItem(
      child: Icon(Icons.chat),
      label: 'Chat',
    ),
    CurvedNavigationBarItem(
      child: Icon(Icons.person),
      label: 'Profile',
    ),
  ];

  void onItemTapped(int index) {
    log('Item tapped: $index');
    try {
      if (_selectedIndex != index) {
        log('Updating selected index to: $index');
        _selectedIndex = index;
        final navigatorState = navigatorKey.currentState;
        if (navigatorState != null) {
          navigatorState.push(
            MaterialPageRoute(
              builder: (BuildContext context) => _pages[index],
            ),
          );
          log('Notifying listeners');
          notifyListeners();
        } else {
          log('Navigator state is null');
        }
      } else {
        log('Selected index is already $index');
      }
    } catch (e) {
      log('Error navigating to page at index $index: $e');
    }
  }
}
