// import 'dart:convert';

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:techstrock2/ProductList/primaryproduct.dart';
// import 'package:techstrock2/SP_manager/sp_manager.dart';
// import 'package:techstrock2/product/product.dart';
// import 'package:techstrock2/updateStockdetails.dart/UpdateStockDetails.dart';
// import '../ProductList/branchStock.dart';
// import '../branch/branchRequest.dart';

// class RequestPage extends StatefulWidget {
//   const RequestPage({super.key});

//   @override
//   State<RequestPage> createState() => _RequestPageState();
// }

// class _RequestPageState extends State<RequestPage> {
//   int count = 0;
//   String? selectedSalutation;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.only(
//             bottomLeft: Radius.circular(25),
//             bottomRight: Radius.circular(25),
//           ),
//         ),
//         backgroundColor: Colors.blue,
//         centerTitle: true,
//         title: const Text(
//           "Update Stock",
//           style: TextStyle(
//             color: Colors.black,
//           ),
//         ),
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: const Icon(Icons.arrow_circle_left_outlined),
//           color: Colors.black,
//           iconSize: 35,
//         ),
//         actions: [
//           IconButton(
//               onPressed: () {
//                 selectrequest();
//               },
//               icon: const Icon(
//                 Icons.add,
//                 color: Colors.black,
//                 size: 30,
//               ))
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             Padding(
//               padding: EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 5),
//               child: TextField(
//                 cursorColor: Colors.black,
//                 decoration: InputDecoration(
//                   hintText: 'Search Product',
//                   prefixIcon: Icon(
//                     Icons.search,
//                     color: Colors.black,
//                   ),
//                   border: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.black),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(
//                       color: Colors.black,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             CurrentStock(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget CurrentStock() {
//     return GestureDetector(
//       onTap: () {
//         // Navigator.push(
//         //     context,
//         //     MaterialPageRoute(
//         //       builder: (context) => UpdateStockDetails(

//         //       ),
//         //     ));
//       },
//       child: Card(
//         elevation: 1.5,
//         shape: RoundedRectangleBorder(
//           side: const BorderSide(color: Color.fromARGB(255, 237, 236, 236)),
//           borderRadius: BorderRadius.circular(10.0),
//         ),
//         child: Column(
//           children: [
//             ListTile(
//               title: Text(
//                 "Name",
//                 style: Theme.of(context).textTheme.bodyLarge!.copyWith(
//                     fontWeight: FontWeight.w700,
//                     color: Colors.black,
//                     fontSize: 15),
//               ),
//               subtitle: const Text(
//                 "27-02-2023 10:22 PM",
//               ),
//               trailing: Text("Update ID-123412",
//                   style: Theme.of(context).textTheme.bodyLarge!.copyWith(
//                       color: const Color.fromARGB(255, 100, 98, 98),
//                       fontWeight: FontWeight.bold)),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void selectrequest() {
//     showModalBottomSheet(
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(10),
//           topRight: Radius.circular(10),
//         ),
//       ),
//       context: context,
//       builder: (context) {
//         return Wrap(
//           children: [
//             const Padding(
//               padding: EdgeInsets.only(top: 15, left: 15, bottom: 15),
//               child: Text(
//                 "Select For Request",
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
//               ),
//             ),
//             const Divider(
//               color: Colors.amber,
//             ),
//             ListTile(
//               leading: const Icon(
//                 Icons.home,
//                 color: Colors.green,
//               ),
//               title: const Text('Branch'),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => Branch(),
//                   ),
//                 );
//               },
//             ),
//             const Divider(),
//             ListTile(
//               leading: const Icon(
//                 Icons.factory,
//                 color: Colors.red,
//               ),
//               title: const Text('Factory'),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const ProductList(),
//                   ),
//                 );
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
