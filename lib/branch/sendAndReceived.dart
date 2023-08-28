import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techstrock2/ProductList/primaryproduct.dart';
import 'package:techstrock2/ProductList/secondaryproduct.dart';
import '../Api_service.dart';
import '../SP_manager/sp_manager.dart';
import 'ReceivedModal.dart';
import 'SendModal.dart';
import 'branchs.dart';
import 'requestDetails.dart';

import 'package:techstrock2/product/product.dart';

import 'requestDetailsModal.dart';

class requestTab extends StatefulWidget {
  const requestTab({Key? key}) : super(key: key);

  @override
  State<requestTab> createState() => _requestTabState();
}

class _requestTabState extends State<requestTab> {
  List<ReceivedData1> receivedList = [];
  List<SendData> sendList = [];
  List<RequestProduct> requestProducts = [];
  Dio dio = Dio();
  RefreshController _refreshController =
      RefreshController(initialRefresh: true);
  RefreshController _refreshController2 =
      RefreshController(initialRefresh: true);
  @override
  void initState() {
    super.initState();
    sendApi();
    ReceivedApi();
    _refreshData();
    _refreshData2();
  }

  void _refreshData() async {
    _refreshController.refreshCompleted();
    setState(() {});
  }

  void _onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    _refreshData();
    sendApi();
  }

  void _refreshData2() async {
    _refreshController2.refreshCompleted();
    setState(() {});
  }

  void _onRefresh2() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    _refreshData2();
    ReceivedApi();
  }

  Color _getStatusColor(String status) {
    if (status == 'completed') {
      return Colors.green;
    } else if (status == 'cancelled') {
      return Colors.red;
    } else if (status == 'pending') {
      return Colors.orange;
    } else {
      return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
          ),
          backgroundColor: Colors.blue,
          bottom: const TabBar(
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              Tab(
                icon: Icon(Icons.food_bank),
                child: Text("Send"),
              ),
              Tab(
                icon: Icon(Icons.draw),
                child: Text("Received"),
              ),
            ],
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_circle_left_outlined),
            color: Colors.black,
            iconSize: 35,
          ),
          title: const Center(
            child: Text(
              'Request List',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                selectRequest();
              },
              icon: const Icon(
                Icons.add,
                color: Colors.black,
                size: 30,
              ),
            )
          ],
        ),
        body: TabBarView(
          children: [
            SendStockList(),
            ReceivedStockList(),
          ],
        ),
      ),
    );
  }

  Widget SendStockList() {
    return SmartRefresher(
      controller: _refreshController,
      onRefresh: _onRefresh,
      child: ListView.builder(
        itemCount: sendList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              requestdetailsStock(
                sendList[index].requestProducts!.first.requestId.toString(),
                sendList[index].requestNo.toString(),
              );
            },
            child: Card(
              elevation: 1.5,
              shape: RoundedRectangleBorder(
                side:
                    const BorderSide(color: Color.fromARGB(255, 237, 236, 236)),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  ListTile(
                    title: Row(
                      children: [
                        Text(
                          sendList[index].requestBranch!.name!,
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          sendList[index].status!,
                          style: TextStyle(
                              color: _getStatusColor(sendList[index].status!),
                              fontWeight: FontWeight.bold,
                              fontSize: 13),
                        ),
                      ],
                    ),
                    subtitle: Text(sendList[index].requestBranch!.updatedAt!),
                    trailing: Text(
                      sendList[index].requestNo!,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: const Color.fromARGB(255, 100, 98, 98),
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void sendApi() async {
    SharedPreferences _pref = await SpManager.getPref;

    String? token = _pref.getString("token");

    Map<String, String> headerBody = {'Content-Type': 'application/json'};

    headerBody = {"Authorization": "Bearer $token"};

    try {
      Response response = await dio.post(
        "https://swad.itgenixtechnologies.com/api/request-send",
        options: Options(headers: headerBody),
        data: {
          'branch_id': _pref.getInt("branchid"),
        },
      );
      if (response.statusCode == 200) {
        Send danger = Send.fromJson(response.data);
        setState(() {
          sendList = danger.data!;
        });
      } else {
        print("error");
      }
    } catch (error) {
      print(error.toString());
    }
  }

  Widget ReceivedStockList() {
    return SmartRefresher(
      controller: _refreshController2,
      onRefresh: _onRefresh2,
      child: ListView.builder(
        itemCount: receivedList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              requestdetailsStock(
                receivedList[index].requestProducts!.first.requestId.toString(),
                receivedList[index].requestNo.toString(),
              );
              
            },
            child: Card(
              elevation: 1.5,
              shape: RoundedRectangleBorder(
                side:
                    const BorderSide(color: Color.fromARGB(255, 237, 236, 236)),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  ListTile(
                    title: Row(
                      children: [
                        Text(
                          receivedList[index].requestBranch!.name!,
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          receivedList[index].status!,
                          style: TextStyle(
                              color:
                                  _getStatusColor(receivedList[index].status!),
                              fontWeight: FontWeight.bold,
                              fontSize: 13),
                        ),
                      ],
                    ),
                    subtitle:
                        Text(receivedList[index].requestBranch!.updatedAt!),
                    trailing: Text(
                      receivedList[index].requestNo!,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: const Color.fromARGB(255, 100, 98, 98),
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void ReceivedApi() async {
    SharedPreferences _pref = await SpManager.getPref;

    String? token = _pref.getString("token");

    Map<String, String> headerBody = {'Content-Type': 'application/json'};

    headerBody = {"Authorization": "Bearer $token"};

    try {
      Response response = await dio.post(
        "https://swad.itgenixtechnologies.com/api/request-received",
        options: Options(headers: headerBody),
        data: {
          'branch_id': _pref.getInt("branchid"),
        },
      );
      if (response.statusCode == 200) {
        Received collect = Received.fromJson(response.data);
        setState(() {
          receivedList = collect.data!;
        });
      } else {
        print("error");
      }
    } catch (error) {
      print(error.toString());
    }
  }

  void requestdetailsStock(String requestId, String requestNo) async {
    SharedPreferences _pref = await SpManager.getPref;

    String? token = _pref.getString("token");

    Map<String, String> headerBody = {'Content-Type': 'application/json'};

    headerBody = {"Authorization": "Bearer $token"};
    Map<String, dynamic> postData = {
      "request_id": requestId,
      "request_no": requestNo,
    };
    try {
      Response response = await dio.post(
        "https://swad.itgenixtechnologies.com/api/request-details",
        options: Options(headers: headerBody),
        data: postData,
      );

      if (response.statusCode == 200) {
        print(postData);

        requestDetails details = requestDetails.fromJson(response.data);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RequestDetailsScreen(details: details),
          ),
        );
      } else { 
        print("error");
      }
    } catch (e) {
      print(e);
    }
  }

  void selectRequest() {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      context: context,
      builder: (context) {
        return Wrap(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 15, left: 15, bottom: 15),
              child: Text(
                "Select For Request",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
            ),
            const Divider(
              color: Colors.amber,
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
                color: Colors.green,
              ),
              title: const Text('Branch'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Branches(),
                  ),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(
                Icons.factory,
                color: Colors.red,
              ),
              title: const Text('Factory'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProductList(),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
