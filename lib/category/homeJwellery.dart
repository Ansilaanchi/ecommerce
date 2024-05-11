// ignore_for_file: unused_import, file_names
import 'package:fashion_world/category/HomeElectronicsProduct.dart';
import 'package:fashion_world/category/HomeFasionProduct.dart';
import 'package:fashion_world/category/HomeJwelleryProduct.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomeJwellery extends StatelessWidget {
  const HomeJwellery({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return HomeJwelleryProduct();
        }));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 4.w, top: 2.h, right: 4.w),
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/download (2).jpg"),
              backgroundColor: Colors.grey,
              radius: 25.sp,
              // child: CircleAvatar(
              //   backgroundColor: ColorData.grey,
              //   radius: 16.sp,
              //   backgroundImage: AssetImage("assets/images/headSet.PNG"),
              // ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 4.w, top: 1.h, right: 4.w),
            child: Text(
              "Jwellery",
              style: TextStyle(
                  fontSize: 10.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}