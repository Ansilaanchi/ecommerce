import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:fashion_world/cartPages/cartUi.dart';
import 'package:fashion_world/pages/chat.dart';
import 'package:fashion_world/whishList/favouritePage.dart';
import 'package:fashion_world/pages/profilePage.dart';
import 'package:flutter/material.dart';
import '../pages/homePage.dart';

class BottomBar extends StatefulWidget {
  BottomBar({Key? key}) : super(key: key ?? UniqueKey());

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;

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
      label: 'Shopping',
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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        index: _selectedIndex,
        items: items,
        onTap: _onItemTapped,
      ),
    );
  }
}
