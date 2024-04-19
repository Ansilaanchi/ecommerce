import 'package:fashion_world/model/userModel.dart';
import 'package:flutter/material.dart';
// import 'package:mainproject/NewListViewBuilder/builderUsers.dart';
import 'package:sizer/sizer.dart';

class FoodContainer extends StatelessWidget {
  const FoodContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.amberAccent,
      width: 100.w,
      height: 40.h,
      child: ListView.builder(
          itemCount: users.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) {
            return Padding(
              padding: EdgeInsets.only(left: 2.w, right: 2.w),
              child: Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        // color: ColorData.pink,
                        width: 20.w,
                        height: 30.h,
                      ),
                      Container(
                        width: 40.w,
                        height: 18.h,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color:
                                    const Color.fromARGB(255, 215, 214, 214)),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(9),
                                topRight: Radius.circular(9)),
                            image: DecorationImage(
                                image: AssetImage(users[index].pic),
                                fit: BoxFit.cover)),
                        child: Padding(
                          padding: EdgeInsets.only(left: 23.w, bottom: 10.h),
                          child: IconButton(
                              onPressed: () {
                                // ignore: avoid_print
                                print("favorite button");
                              },
                              icon: Icon(
                                Icons.favorite_border_rounded,
                                color: Colors.red,
                                size: 19.sp,
                              )),
                        ),
                      ),
                      Positioned(
                        top: 17.8.h,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 215, 214, 214)),
                              // color: ColorData.greyColor,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(9),
                                  bottomRight: Radius.circular(9))),
                          width: 40.w,
                          height: 12.h,
                          // child: Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                          //   children: [
                          //     Text(
                          //       "Name",
                          //       style: TextStyle(color: (Colors.black)),
                          //     ),
                          //     Text(
                          //       "review",
                          //       style: TextStyle(color: (Colors.black)),
                          //     ),
                          //   ],
                          // ),
                        ),
                      ),
                      Positioned(
                        left: 3.w,
                        bottom: 8.h,
                        child: Text(
                          users[index].name,
                          style: TextStyle(
                              color: (Colors.black),
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Positioned(
                        bottom: 8.h,
                        left: 28.w,
                        child: Text(
                          users[index].review,
                          style: TextStyle(color: (Colors.grey)),
                        ),
                      ),
                      Positioned(
                        bottom: 6.h,
                        left: 18.4.w,
                        child: IconButton(
                            onPressed: () {
                              // ignore: avoid_print
                              print("star icon");
                            },
                            icon: Icon(
                              Icons.star_outlined,
                              color: Colors.red,
                              size: 13.sp,
                            )),
                      ),
                      Positioned(
                        bottom: 4.8.h,
                        left: 2.3.w,
                        child: Text(
                          users[index].subName,
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 10.sp),
                        ),
                      ),
                      Positioned(
                          bottom: 1.8.h,
                          left: 4.w,
                          child: Text(
                            users[index].price,
                            style: TextStyle(fontWeight: FontWeight.w500),
                          )),
                      Positioned(
                        right: 2.w,
                        bottom: 1.5.h,
                        child: IconButton(
                            onPressed: () {
                              // ignore: avoid_print
                              print("control button");
                            },
                            icon: Icon(
                              Icons.control_point_rounded,
                              size: 22.sp,
                              color: Colors.pink,
                            )),
                      )
                    ],
                  )
                ],
              ),
            );
          })),
    );
  }
}
