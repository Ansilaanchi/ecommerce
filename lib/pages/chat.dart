import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:fashion_world/provider/bottomProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    Provider.of<BottomProvider>(context, listen: false)
        .onItemTapped(_selectedIndex);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Consumer<BottomProvider>(
        builder: (context, provider, child) => CurvedNavigationBar(
          key: provider.navigatorKey,
          index: provider.selectedIndex,
          items: provider.items,
          onTap: provider.onItemTapped,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Text('WELCOME'),
            )
          ],
        ),
      ),
    );
  }
}
