// import 'package:fashion_world/swiperPage/swiper.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';
// import 'foodContainer.dart';

// class HomePage extends StatelessWidget {
//   HomePage({super.key});
//   final TextEditingController _searchController =
//       TextEditingController(text: 'What are you looking for?');

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         // backgroundColor: Colors.deepPurple.shade100,
//         // bottomNavigationBar: CurvedNavigationBar(
//         //     backgroundColor: Colors.white,
//         //     color: Color.fromARGB(255, 218, 149, 173),
//         //     animationDuration: Duration(milliseconds: 300),
//         //     items: [
//         //       Icon(Icons.home),
//         //       Icon(Icons.)
//         //                 ]),
//         // appBar: AppBar(
//         //   leading: Icon(
//         //     Icons.favorite,
//         //     color: Colors.red,
//         //   ),
//         //   title: Center(
//         //     child: Text(
//         //       'Cairo_Almaady',
//         //       style: TextStyle(
//         //         color: Colors.grey.shade600,
//         //       ),
//         //     ),
//         //   ),
//         //   actions: [
//         //     IconButton(
//         //         onPressed: () {},
//         //         icon: Icon(
//         //           Icons.notification_add_outlined,
//         //           color: const Color.fromARGB(255, 228, 222, 224),
//         //         ))
//         //   ],
//         // ),
//         body: SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//           child: Column(
//             children: [
//               // SizedBox(
//               //   height: 3.h,
//               // ),
//               // Container(height: 22.h, width: 80.w, child:Swiper()),
//               // SizedBox(
//               //   height: 3.h,
//               // ),
//               // Row(
//               //   mainAxisAlignment: MainAxisAlignment.spaceAround,
//               //   children: [
//               //     Container(
//               //       height: 4.h,
//               //       width: 87.w,
//               //       decoration: BoxDecoration(
//               //         borderRadius: BorderRadius.circular(15),
//               //         border: Border.all(color: Colors.pink),
//               //       ),
//               //       child: CupertinoSearchTextField(
//               //         controller: _searchController,
//               //       ),
//               //     ),
//               //     IconButton(
//               //         onPressed: () {
//               //           print("shareButton");
//               //         },
//               //         icon: Icon(Icons.tune, color: Colors.pink)),
//               //   ],
//               // ),
//               // SizedBox(
//               //   height: 1.h,
//               // ),
//               // Row(
//               //   children: [
//               //     Text(
//               //       'Catagories',
//               //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
//               //     ),
//               //   ],
//               // ),
//               // SizedBox(
//               //   height: 1.h,
//               // ),
//               // Row(
//               //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               //   children: [
//               //     // catagories('Assets/Images/gif-removebg-preview.png'),
//               //     // catagories('Assets/Images/cam-removebg-preview.png'),
//               //     // catagories('Assets/Images/kid2-removebg-preview.png'),
//               //     // catagories('Assets/Images/wed-removebg-preview.png'),
//               //   ],
//               // ),
//               // SizedBox(
//               //   height: 1.h,
//               // ),
//               // Padding(
//               //   padding: EdgeInsets.only(
//               //     left: 6.w,
//               //     top: 1.h,
//               //   ),
//               //   child: Row(
//               //     // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               //     children: [
//               //       // catagories('Assets/Images/cou-removebg-preview.png'),
//               //       SizedBox(
//               //         width: 5.w,
//               //       ),
//               //       // catagories('Assets/Images/he-removebg-preview.png'),
//               //     ],
//               //   ),
//               // ),
//               // SizedBox(
//               //   height: 30,
//               // ),
//               // Row(
//               //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               //   children: [
//               //     Text(
//               //       'Our Products',
//               //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
//               //     ),
//               //     GestureDetector(
//               //       onTap: () {
//               //         // Navigator.push(
//               //         //     context,
//               //             // MaterialPageRoute(
//               //               // builder: (context) => ViewPage(),
//               //             // ));
//               //       },
//               //       child: Text(
//               //         'View All',
//               //         style: TextStyle(
//               //           fontWeight: FontWeight.w400,
//               //           fontSize: 16,
//               //           color: Colors.pink,
//               //         ),
//               //       ),
//               //     )
//               //   ],
//               // ),
//               // SizedBox(
//               //   height: 10,
//               // ),
//               // SingleChildScrollView(
//               //   scrollDirection: Axis.horizontal,
//               //   child: Row(
//               //     children: [
//               //       // FoodContainer()
//               //       ],
//               //   ),
//               // )
//             ],
//           ),
//         ));
//   }

//   Widget catagories(String images) {
//     return Container(
//       height: 8.h,
//       width: 18.w,
//       decoration: BoxDecoration(
//         color: Colors.pink[50],
//         borderRadius: BorderRadius.circular(15),
//         // border: Border.all(color: Colors.pink)
//       ),
//       child: Center(
//           child: Image.asset(
//         images,
//         height: 14.h,
//         width: 14.w,
//       )),
//     );
//   }
// }
