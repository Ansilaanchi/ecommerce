// import 'package:fashion_world/registerPages/login.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class ProfilePage extends StatelessWidget {
//   const ProfilePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           children: [
//             const SizedBox(height: 40),
//             CircleAvatar(
//               radius: 70,
//               backgroundImage: AssetImage(
//                   'assets/blank-profile-picture-973460_960_720.webp'),
//             ),
//             const SizedBox(height: 20),
//             itemProfile('Name', 'Ahad Hashmi', CupertinoIcons.person),
//             const SizedBox(height: 10),
//             itemProfile('Phone', '03107085816', CupertinoIcons.phone),
//             const SizedBox(height: 10),
//             // itemProfile(
//             //     'Address', 'abc address, xyz city', CupertinoIcons.location),
//             // const SizedBox(height: 10),
//             // itemProfile(
//             //     'Email', 'ahadhashmideveloper@gmail.com', CupertinoIcons.mail),
//             // const SizedBox(
//             //   height: 20,
//             // ),
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     padding: const EdgeInsets.all(15),
//                   ),
//                   child: const Text('Edit Profile')),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => LoginPage()));
//                   },
//                   style: ElevatedButton.styleFrom(
//                     padding: const EdgeInsets.all(15),
//                   ),
//                   child: const Text(' log out')),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   itemProfile(String name, String subName, IconData iconData) {
//     return Container(
//       decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(10),
//           boxShadow: [
//             BoxShadow(
//                 offset: Offset(0, 5),
//                 color: Colors.deepOrange.withOpacity(.2),
//                 spreadRadius: 2,
//                 blurRadius: 10)
//           ]),
//       child: ListTile(
//         title: Text(name),
//         subtitle: Text(subName),
//         leading: Icon(iconData),
//         trailing: Icon(Icons.arrow_forward, color: Colors.grey.shade400),
//         tileColor: Colors.white,
//       ),
//     );
//   }
// }
