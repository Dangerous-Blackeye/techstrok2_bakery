// import 'dart:convert';

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:techstrock2/Api_service.dart';
// import 'package:techstrock2/updateStockdetails.dart/UpdateStockDetails.dart';
// import 'package:techstrock2/updateStocklist.dart/updateListmodal.dart';
// import 'package:techstrock2/updatedstock/modalupdated.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';
// import 'package:techstrock2/updatedstock/updateds.dart';

// import '../Api_call/api_call.dart';
// import '../SP_manager/sp_manager.dart';
// import 'updateDetailsmodal.dart';
// import 'updateDetailsmodal.dart';

// class UpdateStock extends StatefulWidget {
//   const UpdateStock({super.key});

//   @override
//   State<UpdateStock> createState() => _UpdateStockState();
// }

// class _UpdateStockState extends State<UpdateStock> {
//   RefreshController _refreshController =
//       RefreshController(initialRefresh: true);
//   final dio = Dio();
//   List<Datamaster> updatestocklist = [];
//   List<DataS> updatedetailslist = [];
//   @override
//   void initState() {
//     super.initState();
//     updatedStockList();
//     _refreshData();
//   }

//   void _refreshData() async {
//     _refreshController.refreshCompleted();
//     setState(() {});
//   }

//   void _onRefresh() async {
//     await Future.delayed(const Duration(milliseconds: 1000));
//     _refreshData();
//     updatedStockList();
//     updatestocklist.clear();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final apiCall = context.watch<ApiCall>();
//     return Scaffold(
//       appBar: AppBar(
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.only(
//               bottomLeft: Radius.circular(25),
//               bottomRight: Radius.circular(25)),
//         ),
//         backgroundColor: Colors.blue,
//         centerTitle: true,
//         title: const Text(
//           "Update Stock List",
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
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => const EditStock(),
//                 ),
//               );
//             },
//             icon: const Icon(
//               Icons.add,
//               color: Colors.black,
//               size: 30,
//             ),
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             const Padding(
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
//             Expanded(
//               child: SmartRefresher(
//                 controller: _refreshController,
//                 onRefresh: _onRefresh,
//                 child: ListView.builder(
//                   itemCount: updatestocklist.length,
//                   itemBuilder: (context, index) {
//                     return InkWell(
//                       onTap: () {
//                         updatedetailsStock(
//                           updatestocklist[index].updateId!,
//                           updatestocklist[index].updateNo!,
//                           updatestocklist[index].updatedBy!,
//                           updatestocklist[index].contact!,
//                           updatestocklist[index].location!,
//                           updatestocklist[index].status!,
//                           updatestocklist[index].updateId!.toString(),
//                           updatestocklist[index].updatedDate!,
//                         );
//                       },
//                       child: Card(
//                         elevation: 1.5,
//                         shape: RoundedRectangleBorder(
//                           side: const BorderSide(
//                               color: Color.fromARGB(255, 237, 236, 236)),
//                           borderRadius: BorderRadius.circular(10.0),
//                         ),
//                         child: Column(
//                           children: [
//                             ListTile(
//                               title: Text(
//                                 updatestocklist[index].updatedBy!,
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .bodyLarge!
//                                     .copyWith(
//                                         fontWeight: FontWeight.w700,
//                                         color: Colors.black,
//                                         fontSize: 15),
//                               ),
//                               subtitle: FittedBox(
//                                 child:
//                                     Text(updatestocklist[index].updatedDate!),
//                               ),
//                               trailing: Text(
//                                   "UpdateNo ${updatestocklist[index].updateNo}",
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .bodyLarge!
//                                       .copyWith(
//                                           color: const Color.fromARGB(
//                                               255, 100, 98, 98),
//                                           fontWeight: FontWeight.bold)),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   void updatedStockList() async {
//     Dio dio = Dio();
//     SharedPreferences _pref = await SpManager.getPref;

//     String token = _pref.getString("token")!;

//     Map<String, String> headerBody = {'Content-Type': 'application/json'};

//     headerBody = {"Authorization": "Bearer $token"};

//     try {
//       Response response = await dio.post(Apiservice.updateListApi,
//           options: Options(headers: headerBody),
//           data: {
//             'branch_id': _pref.getInt("branchid"),
//           });
//       if (response.statusCode == 200) {
//         print(response.data);
//         updateStockList updatelist = updateStockList.fromJson(response.data);
//         setState(() {
//           updatestocklist.addAll(updatelist.data!);
//         });
//       } else {
//         print("error");
//       }
//     } catch (error) {
//       print(error.toString());
//     }
//   }

//   Future<void> updatedetailsStock(
//     int update_id,
//     String updateNo,
//     String updatedBy,
//     String contact,
//     String location,
//     String status,
//     String updateId,
//     String updatedDate,
//   ) async {
//     SharedPreferences _pref = await SpManager.getPref;

//     String token = _pref.getString("token")!;

//     Map<String, String> headerBody = {'Content-Type': 'application/json'};

//     headerBody = {"Authorization": "Bearer $token"};
//     Map<String, dynamic> PostData = {"update_id": update_id};
//     try {
//       Response response = await dio.post(Apiservice.updatedetailsApi,
//           options: Options(headers: headerBody), data: PostData);
//       print(response.data);
//       if (response.statusCode == 200) {
//         updateDetailsList details = updateDetailsList.fromJson(response.data);
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => UpdateStockDetails(
//               updatedetails: details,
//               updateNo: updateNo,
//               updatedby: updatedBy,
//               contact: contact,
//               location: location,
//               status: status,
//               updateId: updateId,
//               updatedDate: updatedDate,
//             ),
//           ),
//         );
//       } else {
//         print("error");
//       }
//     } catch (e) {
//       print(e);
//     }
//   }
// }
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techstrock2/Api_service.dart';
import 'package:techstrock2/updateStockdetails.dart/UpdateStockDetails.dart';
import 'package:techstrock2/updateStocklist.dart/updateListmodal.dart';
import 'package:techstrock2/updatedstock/modalupdated.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:techstrock2/updatedstock/updateds.dart';

import '../Api_call/api_call.dart';
import '../SP_manager/sp_manager.dart';
import 'updateDetailsmodal.dart';
import 'updateDetailsmodal.dart';

class UpdateStock extends StatefulWidget {
  const UpdateStock({Key? key});

  @override
  State<UpdateStock> createState() => _UpdateStockState();
}

class _UpdateStockState extends State<UpdateStock> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: true);
  final dio = Dio();
  List<Datamaster> updatestocklist = [];
  List<DataS> updatedetailslist = [];

  String searchText = '';

  @override
  void initState() {
    super.initState();
    updatedStockList();
    _refreshData();
  }

  void _refreshData() async {
    _refreshController.refreshCompleted();
    setState(() {});
  }

  void _onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    _refreshData();
    updatedStockList();
    updatestocklist.clear();
  }

  @override
  Widget build(BuildContext context) {
    final apiCall = context.watch<ApiCall>();
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25)),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          "Update Stock List",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_circle_left_outlined),
          color: Colors.black,
          iconSize: 35,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EditStock(),
                ),
              );
            },
            icon: const Icon(
              Icons.add,
              color: Colors.black,
              size: 30,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 5),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    searchText = value;
                  });
                },
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  hintText: 'Search Product',
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: SmartRefresher(
                controller: _refreshController,
                onRefresh: _onRefresh,
                child: ListView.builder(
                  itemCount: updatestocklist.length,
                  itemBuilder: (context, index) {
                    final item = updatestocklist[index];
                    if (searchText.isNotEmpty &&
                        !item.updatedBy!.toLowerCase().contains(searchText.toLowerCase())) {
                      return Container(); // Skip items that don't match the search text
                    }
                    return InkWell(
                      onTap: () {
                        updatedetailsStock(
                          item.updateId!,
                          item.updateNo!,
                          item.updatedBy!,
                          item.contact!,
                          item.location!,
                          item.status!,
                          item.updateId!.toString(),
                          item.updatedDate!,
                        );
                      },
                      child: Card(
                        elevation: 1.5,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              color: Color.fromARGB(255, 237, 236, 236)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(
                                item.updatedBy!,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                        fontSize: 15),
                              ),
                              subtitle: FittedBox(
                                child: Text(item.updatedDate!),
                              ),
                              trailing: Text(
                                  "UpdateNo ${item.updateNo}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          color: const Color.fromARGB(
                                              255, 100, 98, 98),
                                          fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void updatedStockList() async {
    Dio dio = Dio();
    SharedPreferences _pref = await SpManager.getPref;

    String token = _pref.getString("token")!;

    Map<String, String> headerBody = {'Content-Type': 'application/json'};

    headerBody = {"Authorization": "Bearer $token"};

    try {
      Response response = await dio.post(Apiservice.updateListApi,
          options: Options(headers: headerBody),
          data: {
            'branch_id': _pref.getInt("branchid"),
          });
      if (response.statusCode == 200) {
        print(response.data);
        updateStockList updatelist = updateStockList.fromJson(response.data);
        setState(() {
          updatestocklist.addAll(updatelist.data!);
        });
      } else {
        print("error");
      }
    } catch (error) {
      print(error.toString());
    }
  }

  Future<void> updatedetailsStock(
    int update_id,
    String updateNo,
    String updatedBy,
    String contact,
    String location,
    String status,
    String updateId,
    String updatedDate,
  ) async {
    SharedPreferences _pref = await SpManager.getPref;

    String token = _pref.getString("token")!;

    Map<String, String> headerBody = {'Content-Type': 'application/json'};

    headerBody = {"Authorization": "Bearer $token"};
    Map<String, dynamic> PostData = {"update_id": update_id};
    try {
      Response response = await dio.post(Apiservice.updatedetailsApi,
          options: Options(headers: headerBody), data: PostData);
      print(response.data);
      if (response.statusCode == 200) {
        updateDetailsList details = updateDetailsList.fromJson(response.data);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UpdateStockDetails(
              updatedetails: details,
              updateNo: updateNo,
              updatedby: updatedBy,
              contact: contact,
              location: location,
              status: status,
              updateId: updateId,
              updatedDate: updatedDate,
            ),
          ),
        );
      } else {
        print("error");
      }
    } catch (e) {
      print(e);
    }
  }
}

