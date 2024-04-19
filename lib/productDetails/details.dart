// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class Details extends StatefulWidget {
//   Details({Key? key}) : super(key: key);

//   @override
//   State<Details> createState() => _DetailsState();
// }

// class _DetailsState extends State<Details> {
//   Future<void> getProductsApi() async {
//     final responce =
//         await http.get(Uri.parse('https://dummyjson.com/products'));
//     var data = jsonDecode(responce.body.toString());
//     if (responce.statusCode == 200) {
//       return Model.fromJson(data);
//     } else {
//       return Model.fromJson(data);
//     }
//   }

//   var s = '\$';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: Drawer(),
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 32, 28, 80),
//         title: Text('Api Get'),
//       ),
//       backgroundColor: Color.fromARGB(255, 32, 28, 80),
//       body: Column(
//         children: [
//           Expanded(
//               child: FutureBuilder<Model>(
//             future: getProductsApi(),
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 return ListView.builder(
//                   itemCount: snapshot.data!.products!.length,
//                   itemBuilder: (context, index) {
//                     print(
//                       snapshot.data!.products!.length,
//                     );
//                     return Column(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(5.0),
//                           child: GestureDetector(
//                             onTap: () {
//                               // Navigator.push(
//                               //     context,
//                               //     MaterialPageRoute(
//                               //       builder: (context) => ProductDetails(),
//                               //     ));
//                             },
//                             child: Container(
//                               height: 100,
//                               width: 500,
//                               child: Card(
//                                 color: Color.fromARGB(255, 185, 239, 243),
//                                 child: Row(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.fromLTRB(
//                                           10, 25, 10, 10),
//                                       child: CircleAvatar(
//                                         backgroundImage: NetworkImage(snapshot
//                                             .data!.products![index].thumbnail!
//                                             .toString()),
//                                       ),
//                                     ),
//                                     Flexible(
//                                       child: Padding(
//                                         padding: const EdgeInsets.fromLTRB(
//                                             8, 10, 8, 0),
//                                         child: Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.start,
//                                           children: [
//                                             Text(
//                                               snapshot
//                                                   .data!.products![index].title
//                                                   .toString(),
//                                               style: TextStyle(
//                                                   fontWeight: FontWeight.bold,
//                                                   fontSize: 17),
//                                             ),
//                                             Text(
//                                               snapshot
//                                                   .data!.products![index].brand
//                                                   .toString(),
//                                               style: TextStyle(
//                                                   fontWeight: FontWeight.bold),
//                                             ),
//                                             Text(
//                                               snapshot.data!.products![index]
//                                                   .description
//                                                   .toString(),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: Text('\$' +
//                                           snapshot.data!.products![index].price
//                                               .toString()),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           )
//                         )
//         ]
//         );
//                } );
//       }   } )
//               )
//              ] )
//               );
//   }
//   }
