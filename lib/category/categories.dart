import 'package:fashion_world/category/buildUser.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Category extends StatelessWidget {
  const Category({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 100.w,
          height: 10.h,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: user.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 2.w, right: 2.h),
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: ClipOval(
                          child: Image(
                            image: AssetImage(user[index].img),
                            fit: BoxFit.cover,
                            width:
                                60, // Ensure image fits within the circular container
                            height:
                                60, // Ensure image fits within the circular container
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 2.w, right: 2.h),
                      child: Text(user[index].name),
                    ),
                  ],
                );
              }),
        ),
      ],
    );
  }
}
