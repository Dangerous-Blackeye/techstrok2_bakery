// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:provider/provider.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:techstrock2/Api_service.dart';
// import 'package:techstrock2/ProductList/branchStock.dart';
// import 'package:techstrock2/SP_manager/sp_manager.dart';
// import 'package:techstrock2/Request/Request.dart';
// import 'package:techstrock2/currentStock/CurrentStock.dart';
// import 'package:techstrock2/currentStock/smodal.dart';
// import 'package:techstrock2/loginpage/login.dart';
// import 'package:techstrock2/updateStocklist.dart/productlist.dart';
// import '../ProductList/selectbranchmodal.dart';
// import '../currentStock/dio_provider_currentS.dart';
// import 'branchProduct.dart';

// class Branches extends StatefulWidget {
//   const Branches({super.key});

//   @override
//   State<Branches> createState() => _BranchesState();
// }

// class _BranchesState extends State<Branches> {
//   List<Data1> branchList = [];
//   List<BranchS> branchdetails = [];
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     branchGetApi();
//   }

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
//           "Branches",
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
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             const Padding(
//               padding: EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 5),
//               child: TextField(
//                 decoration: InputDecoration(
//                   hintText: 'Search Product',
//                   prefixIcon: Icon(Icons.search),
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: branchList.length,
//                 itemBuilder: (context, index) {
//                   return Column(
//                     children: [
//                       ListTile(
//                         title: Text(branchList[index].branchName!),
//                         onTap: () {
//                           branchproduct(branchList[index].branchId!);
//                         },
//                       ),
//                       const Divider()
//                     ],
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   branchGetApi() async {
//     SharedPreferences _pref = await SpManager.getPref;

//     String? token = _pref.getString("token");

//     Map<String, String> headerBody = {'Content-Type': 'application/json'};

//     headerBody = {"Authorization": "Bearer $token"};
//     try {
//       Response response = await Dio().get(
//         Apiservice.getbranchesApi,
//         options: Options(headers: headerBody),
//       );

//       if (response.statusCode == 200) {
//         print(response.data);
//         Autogenerated branchesModal = Autogenerated.fromJson(response.data);
//         setState(() {
//           branchList.addAll(branchesModal.data!);
//         });
//       } else {
//         print(response.statusMessage);
//       }
//     } catch (e) {
//       print(e);
//     }
//   }

//   branchproduct(int branchId) async {
//     SharedPreferences _pref = await SpManager.getPref;

//     String token = _pref.getString("token")!;

//     Map<String, String> headerBody = {'Content-Type': 'application/json'};

//     headerBody = {"Authorization": "Bearer $token"};
//     try {
//       Dio dio = Dio();

//       Map<String, dynamic> postData = {
//         "branch_id": branchId,
//       };

//       Response response = await dio.post(
//         "https://swad.itgenixtechnologies.com/api/branch-stock-details",
//         options: Options(headers: headerBody),
//         data: postData,
//       );

//       if (response.statusCode == 200) {
//         print(response.data);
//         BranchS branchs = BranchS.fromJson(response.data);
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => updateBranchproduct(branchdetails: branchs),
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
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techstrock2/Api_service.dart';
import 'package:techstrock2/ProductList/branchStock.dart';
import 'package:techstrock2/SP_manager/sp_manager.dart';
import 'package:techstrock2/Request/Request.dart';
import 'package:techstrock2/currentStock/CurrentStock.dart';
import 'package:techstrock2/currentStock/smodal.dart';
import 'package:techstrock2/loginpage/login.dart';
import 'package:techstrock2/updateStocklist.dart/productlist.dart';
import '../ProductList/selectbranchmodal.dart';
import '../currentStock/dio_provider_currentS.dart';
import 'branchProduct.dart';

class Branches extends StatefulWidget {
  const Branches({Key? key});

  @override
  State<Branches> createState() => _BranchesState();
}

class _BranchesState extends State<Branches> {
  List<Data1> branchList = [];
  List<BranchS> branchdetails = [];
  List<Data1> filteredBranchList = [];

  TextEditingController searchController = TextEditingController();
  RefreshController _refreshController =
      RefreshController(initialRefresh: true);
  @override
  void initState() {
    super.initState();
    branchGetApi();
    _refreshData();
  }

  void _refreshData() async {
    _refreshController.refreshCompleted();
    setState(() {});
  }

  void _onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    _refreshData();
    branchGetApi();
    branchList.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          "Branches",
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 5),
              child: TextField(
                controller: searchController,
                onChanged: (value) {
                  filterBranches(value);
                },
                decoration: InputDecoration(
                  hintText: 'Search Product',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Expanded(
              child: SmartRefresher(
                controller: _refreshController,
                onRefresh: _onRefresh,
                child: ListView.builder(
                  itemCount: filteredBranchList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          title: Text(filteredBranchList[index].branchName!),
                          onTap: () {
                            branchproduct(filteredBranchList[index].branchId!);
                          },
                        ),
                        const Divider()
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  branchGetApi() async {
    SharedPreferences _pref = await SpManager.getPref;

    String? token = _pref.getString("token");

    Map<String, String> headerBody = {'Content-Type': 'application/json'};

    headerBody = {"Authorization": "Bearer $token"};
    try {
      Response response = await Dio().get(
        Apiservice.getbranchesApi,
        options: Options(headers: headerBody),
      );

      if (response.statusCode == 200) {
        print(response.data);
        Autogenerated branchesModal = Autogenerated.fromJson(response.data);
        setState(() {
          branchList.addAll(branchesModal.data!);
          filteredBranchList = branchList;
        });
      } else {
        print(response.statusMessage);
      }
    } catch (e) {
      print(e);
    }
  }

  branchproduct(int branchId) async {
    SharedPreferences _pref = await SpManager.getPref;

    String token = _pref.getString("token")!;

    Map<String, String> headerBody = {'Content-Type': 'application/json'};

    headerBody = {"Authorization": "Bearer $token"};
    try {
      Dio dio = Dio();

      Map<String, dynamic> postData = {
        "branch_id": branchId,
      };

      Response response = await dio.post(
        "https://swad.itgenixtechnologies.com/api/branch-stock-details",
        options: Options(headers: headerBody),
        data: postData,
      );

      if (response.statusCode == 200) {
        BranchS branchs = BranchS.fromJson(response.data);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => updateBranchproduct(branchdetails: branchs),
          ),
        );
      } else {
        print("error");
      }
    } catch (e) {
      print(e);
    }
  }

  void filterBranches(String searchTerm) {
    setState(() {
      filteredBranchList = branchList.where((branch) {
        final branchName = branch.branchName!.toLowerCase();
        final searchLower = searchTerm.toLowerCase();

        return branchName.contains(searchLower);
      }).toList();
    });
  }
}
