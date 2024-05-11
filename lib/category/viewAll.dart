import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'buildUser.dart';

class ViewAll extends StatelessWidget {
  const ViewAll({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 5.h),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1, // Adjust this as needed
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
              ),
              itemCount: user.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      height: 10.h,
                      width: 25.w,
                      decoration: BoxDecoration(
                        // color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                          image: AssetImage(user[index].img),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(user[index].name),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
