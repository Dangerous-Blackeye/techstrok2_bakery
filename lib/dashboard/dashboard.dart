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

import '../branch/sendAndReceived.dart';
import '../currentStock/dio_provider_currentS.dart';

class Dashboard extends StatefulWidget {
  Dashboard({
    super.key,
  });
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: true);

  List<Data1> branchList = [];
  List<BranchS> branchdetails = [];
  @override
  void initState() {
    super.initState();
    branchGetApi();
    _refreshData();
    context.read<currentstockprovider>().curentdata();
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
    final currentstockservice = context.watch<currentstockprovider>();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 243, 243),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color.fromARGB(0, 252, 251, 251),
        centerTitle: true,
        title: Text(
          "Dashboard",
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontSize: 19, fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            color: Colors.red,
            onPressed: () {
              logoutConfirmDialog();
            },
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CurrentStock(),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 1.5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Column(
                          children: [
                            const CircleAvatar(
                              radius: 40,
                              child: Icon(Icons.shopify, size: 40),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Container(
                                decoration: const BoxDecoration(
                                    //    borderRadius: BorderRadius.circular(10),
                                    // border: Border.all()
                                    ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Current Stock",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UpdateStock(),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 1.5,
                      shape: RoundedRectangleBorder(
                        // side: const BorderSide(
                        //     color: Color.fromARGB(255, 132, 131, 131)),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Column(
                          children: [
                            const CircleAvatar(
                              radius: 40,
                              child:
                                  Icon(Icons.shopping_cart_outlined, size: 40),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Update Stock",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      _showModalBottomSheet();
                    },
                    child: Card(
                      elevation: 1.5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Column(
                          children: [
                            const CircleAvatar(
                                radius: 40,
                                child: Icon(Icons.dashboard, size: 40)),
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Container(
                                decoration: const BoxDecoration(),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Branch Stock",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const requestTab(),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 1.5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Column(
                          children: [
                            const CircleAvatar(
                                radius: 40,
                                child: Icon(Icons.factory, size: 40)),
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Container(
                                decoration: const BoxDecoration(),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: FittedBox(
                                    child: Text(
                                      "Request",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
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
        "https://swad.itgenixtechnologies.com/api/get-braches",
        options: Options(headers: headerBody),
      );

      if (response.statusCode == 200) {
        print(response.data);
        Autogenerated branchesModal = Autogenerated.fromJson(response.data);
        setState(() {
          branchList.addAll(branchesModal.data!);
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
        print('dashboard.dart -> response.data : ${response.data} ');
        BranchS branchs = BranchS.fromJson(response.data);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BranchStoc(branchdetails: branchs),
          ),
        );
      } else {
        print("error");
      }
    } catch (e) {
      print(e);
    }
  }

  void _showModalBottomSheet() {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return SmartRefresher(
          controller: _refreshController,
          onRefresh: _onRefresh,
          child: ListView.builder(
            itemCount: branchList.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    title: Text(branchList[index].branchName!),
                    onTap: () {
                      branchproduct(branchList[index].branchId!);
                    },
                  ),
                  const Divider()
                ],
              );
            },
          ),
        );
      },
    );
  }

  Future<void> logoutUser() async {
    SharedPreferences _pref = await SpManager.getPref;

    String token = _pref.getString("token")!;

    Map<String, String> headerBody = {'Content-Type': 'application/json'};

    headerBody = {"Authorization": "Bearer $token"};
    try {
      final dio = Dio();

      await dio.get(
        'https://swad.itgenixtechnologies.com/api/logout',
        options: Options(headers: headerBody),
      );

      print("LogOut Successful");
      SpManager.clearPreferences();
      SpManager.setPrefrence(token);
      SpManager.setLoggedOut("true");
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
      );
      Fluttertoast.showToast(
          msg: "LogOut Successful",
          backgroundColor: Theme.of(context).primaryColor);
    } catch (e) {
      Fluttertoast.showToast(
          msg: "Please try again",
          backgroundColor: Theme.of(context).primaryColor);
    }
  }

  Future<void> logoutConfirmDialog() {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button for close dialog!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("LogOut"),
          content: const FittedBox(
            child: Text("Are you sure you want to Log out?"),
          ),
          actions: [
            TextButton(
              child: const Text("No"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
                child: const Text("Yes"),
                onPressed: () {
                  logoutUser();
                  SpManager.clearPreferences();
                  SpManager.setPrefrence("token");
                  SpManager.setLoggedOut("true");
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => LoginPage(),
                    ),
                    (route) => false,
                  );
                }),
          ],
        );
      },
    );
  }
}
