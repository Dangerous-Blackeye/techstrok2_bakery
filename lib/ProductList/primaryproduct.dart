// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:techstrock2/ProductList/primaryProductModal.dart';
// import 'package:techstrock2/SP_manager/sp_manager.dart';

// class PrimaryProduct extends StatefulWidget {
//   const PrimaryProduct({super.key});

//   @override
//   State<PrimaryProduct> createState() => _PrimaryProductState();
// }

// class _PrimaryProductState extends State<PrimaryProduct> {
//   TextEditingController _controller = TextEditingController();
//   List<Data> primaryList = [];
//   List<Data> filteredList = [];
//   var count = 0;
//   @override
//   void initState() {
//     super.initState();
//     primaryGetApi();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 243, 243, 243),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(8),
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(
//                       top: 10,
//                       left: 3,
//                       right: 3,
//                     ),
//                     child: TextField(
//                       controller: _controller,
//                       onChanged: (value) {
//                         filterProducts(value);
//                       },
//                       cursorColor: Colors.black,
//                       decoration: const InputDecoration(
//                           hintText: "Search Product",
//                           prefixIcon: Icon(
//                             Icons.search,
//                             color: Colors.black,
//                           ),
//                           border: OutlineInputBorder(
//                             borderSide: BorderSide(color: Colors.black),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: Colors.black))),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Expanded(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         filteredList.isEmpty
//                             ? const Center(child: CircularProgressIndicator())
//                             : Expanded(child: PrimaryProductlist()),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 45,
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       onPressed: () {},
//                       style: ElevatedButton.styleFrom(
//                         elevation: 0.0,
//                         backgroundColor: Colors.blue,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                       ),
//                       child: const Text(
//                         'Save',
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black,
//                             fontSize: 20),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget PrimaryProductlist() {
//     return ListView.builder(
//       itemCount: filteredList.length,
//       itemBuilder: (context, index) {
//         return Card(
//           elevation: 1.5,
//           shape: RoundedRectangleBorder(
//             side: const BorderSide(color: Color.fromARGB(255, 237, 236, 236)),
//             borderRadius: BorderRadius.circular(10.0),
//           ),
//           child: Padding(
//             padding:
//                 const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 15),
//             child: Row(
//               children: [
//                 Text(
//                   filteredList[index].name!,
//                   style: Theme.of(context)
//                       .textTheme
//                       .bodyMedium!
//                       .copyWith(fontSize: 17, fontWeight: FontWeight.w500),
//                 ),
//                 const SizedBox(
//                   width: 4,
//                 ),
//                 Container(
//                   decoration: BoxDecoration(
//                       color: const Color.fromARGB(255, 209, 245, 211),
//                       borderRadius: BorderRadius.circular(5)),
//                   child: Center(
//                     child: Padding(
//                       padding: const EdgeInsets.only(
//                           top: 3, bottom: 3, left: 3, right: 3),
//                       child: Text(
//                         filteredList[index].id.toString(),
//                         style: Theme.of(context).textTheme.bodyLarge!.copyWith(
//                             color: const Color.fromARGB(255, 3, 157, 8),
//                             fontSize: 10),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const Spacer(),
//                 GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       count--;
//                     });
//                   },
//                   child: count == 0
//                       ? const SizedBox()
//                       : Container(
//                           decoration: BoxDecoration(
//                               borderRadius:
//                                   const BorderRadius.all(Radius.circular(50.0)),
//                               border: Border.all(width: 1)),
//                           child: const CircleAvatar(
//                             backgroundColor: Colors.white,
//                             radius: 15,
//                             child: Text(
//                               "-",
//                               style: TextStyle(
//                                   fontWeight: FontWeight.w300,
//                                   fontSize: 18,
//                                   color: Colors.black),
//                             ),
//                           ),
//                         ),
//                 ),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 Text(
//                   "$count",
//                   style: const TextStyle(
//                       fontWeight: FontWeight.w600,
//                       fontSize: 18,
//                       color: Colors.black),
//                 ),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       count++;
//                     });
//                   },
//                   child: Container(
//                     decoration: BoxDecoration(
//                         borderRadius: const BorderRadius.all(
//                           Radius.circular(50.0),
//                         ),
//                         border: Border.all(width: 1)),
//                     child: const CircleAvatar(
//                       backgroundColor: Colors.white,
//                       radius: 15,
//                       child: Text(
//                         "+",
//                         style: TextStyle(
//                             fontWeight: FontWeight.w300,
//                             fontSize: 18,
//                             color: Colors.black),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   void filterProducts(String query) {
//     setState(() {
//       if (query.isEmpty) {
//         filteredList = List.from(primaryList);
//       } else {
//         filteredList = primaryList.where((product) {
//           final productName = product.name!.toLowerCase();
//           return productName.contains(query.toLowerCase());
//         }).toList();
//       }
//     });
//   }

//   primaryGetApi() async {
//     SharedPreferences _pref = await SpManager.getPref;

//     String token = _pref.getString("token")!;

//     Map<String, String> headerBody = {'Content-Type': 'application/json'};

//     headerBody = {"Authorization": "Bearer $token"};
//     try {
//       Response response = await Dio().get(
//         "https://swad.itgenixtechnologies.com/api/get-primary-products",
//         options: Options(headers: headerBody),
//       );

//       if (response.statusCode == 200) {
//         print(
//             "https://swad.itgenixtechnologies.com/api/get-primary-products======>success");
//         primary primaryModal = primary.fromJson(response.data);
//         setState(() {
//           primaryList = primaryModal.data!;
//           filteredList = List.from(primaryList);
//         });
//       } else {
//         print(response.statusMessage);
//       }
//     } catch (e) {
//       print(e.toString());
//     }
//   }
// }
