import 'package:flutter/material.dart';

class LoadPage extends StatelessWidget {
  LoadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 180,
        width: 300,
        color: Colors.lightGreenAccent,
        // child:Image.network('https://marketplace.canva.com/EAFEH3mIUaM/1/0/1600w/canva-dark-grey-and-white-minimalist-new-fashion-collection-banner-nvaqxg-8iXI.jpg',fit: BoxFit.cover,) ,
      ),
    );
  }
}
