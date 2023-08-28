// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import 'package:techstrock2/SP_manager/sp_manager.dart';

// import 'package:techstrock2/currentStock/smodal.dart';

// import '../Api_service.dart';

// import 'requestModal.dart';
// import 'sendAndReceived.dart';

// class updateBranchproduct extends StatefulWidget {
//   final BranchS branchdetails;
//   updateBranchproduct({
//     Key? key,
//     required this.branchdetails,
//   }) : super(key: key);

//   @override
//   State<updateBranchproduct> createState() => _updateBranchproductState();
// }

// class _updateBranchproductState extends State<updateBranchproduct> {
//   TextEditingController controller = TextEditingController();
//   List<TextEditingController> _controllers = [];
//   RefreshController _refreshController =
//       RefreshController(initialRefresh: true);
//   List<int> quantities = [];
//   List<dynamic> _postsData = [];

//   @override
//   void initState() {
//     super.initState();
//     _refreshData();
//   }

//   void _refreshData() async {
//     _refreshController.refreshCompleted();
//     setState(() {});
//   }

//   void _onRefresh() async {
//     await Future.delayed(const Duration(milliseconds: 1000));
//     _refreshData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     List<Widget> categoryTabs = [];
//     List<Widget> categoryTabViews = [];
//     Map<int, List<BranchStock>> productsByCategory = {};
//     widget.branchdetails.data?.branchStock?.forEach((product) {
//       int categoryId = product.categoryId ?? 0;
//       if (!productsByCategory.containsKey(categoryId)) {
//         productsByCategory[categoryId] = [];
//       }
//       productsByCategory[categoryId]?.add(product);
//     });

//     productsByCategory.forEach((categoryId, products) {
//       String categoryName = products.first.categoryName.toString();

//       categoryTabs.add(
//         FittedBox(
//           child: Tab(
//             text: categoryName,
//           ),
//         ),
//       );

//       categoryTabViews.add(ListView.builder(
//         itemCount: products.length,
//         itemBuilder: (context, index) {
//           BranchStock product = products[index];
//           _controllers
//               .add(TextEditingController()); // Add controller to the list

//           return Card(
//             elevation: 1.5,
//             shape: RoundedRectangleBorder(
//               side: const BorderSide(color: Color.fromARGB(255, 237, 236, 236)),
//               borderRadius: BorderRadius.circular(10.0),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.only(
//                   top: 15, left: 15, right: 15, bottom: 15),
//               child: Row(
//                 children: [
//                   Text(
//                     product.productName!,
//                     style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                           fontSize: 17,
//                           fontWeight: FontWeight.w500,
//                         ),
//                   ),
//                   Spacer(),
//                   Text(product.productStock!),
//                   const Spacer(),
//                   Expanded(
//                     child: TextField(
//                       textAlign: TextAlign.center,
//                       keyboardType: TextInputType.number,
//                       controller: _controllers[index],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ));
//     });

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
//           "Update Branch Product",
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
//       backgroundColor: const Color.fromARGB(255, 243, 243, 243),
//       body: SmartRefresher(
//         controller: _refreshController,
//         onRefresh: _onRefresh,
//         child: Column(
//           children: [
//             Padding(
//               padding:
//                   const EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 5),
//               child: TextField(
//                 onChanged: (Value) {},
//                 cursorColor: Colors.black,
//                 decoration: const InputDecoration(
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
//               child: DefaultTabController(
//                 length: categoryTabs.length,
//                 child: Column(
//                   children: [
//                     Container(
//                       constraints: const BoxConstraints.expand(height: 35),
//                       child: TabBar(
//                         isScrollable: true,
//                         indicatorColor: Colors.red,
//                         indicatorSize: TabBarIndicatorSize.label,
//                         labelColor: Colors.red,
//                         unselectedLabelColor: Colors.black,
//                         labelStyle: TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.bold),
//                         tabs: categoryTabs,
//                       ),
//                     ),
//                     Expanded(
//                       child: TabBarView(
//                         children: categoryTabViews,
//                       ),
//                     ),
//                     SizedBox(
//                       height: 45,
//                       width: double.infinity,
//                       child: ElevatedButton(
//                         onPressed: () {
//                           List<String> quantities = _controllers
//                               .map((controller) => controller.text)
//                               .toList();
//                           requestStock(
//                             context,
//                             quantities: quantities,
//                           );
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => requestTab(),
//                               ));
//                         },
//                         style: ElevatedButton.styleFrom(
//                           elevation: 0.0,
//                           backgroundColor: Colors.blue,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                         ),
//                         child: const Text(
//                           'Submit',
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black,
//                               fontSize: 20),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> requestStock(
//     BuildContext context, {
//     required List<String> quantities,
//   }) async {
//     SharedPreferences _pref = await SpManager.getPref;

//     String? token = _pref.getString("token");

//     Map<String, String> headerBody = {'Content-Type': 'application/json'};

//     headerBody = {"Authorization": "Bearer $token"};
//     List<Map<String, dynamic>> productData = [];

//     for (int i = 0; i < quantities.length; i++) {
//       String quantity = quantities[i];
//       if (quantity.isNotEmpty) {
//         BranchStock product = widget.branchdetails.data!.branchStock![i];
//         int productId = product.productId!;
//         Map<String, dynamic> productInfo = {
//           "product_id": productId,
//           "product_stock": quantity,
//         };
//         productData.add(productInfo);
//       }
//     }

//     if (productData.isNotEmpty) {
//       Map<String, dynamic> postData = {
//         "current_branch_id": _pref.getInt("branchid"),
//         "req_branch_stock_id":
//             widget.branchdetails.data!.branchDetails!.branchId!,
//         "product_stock": productData,
//       };

//       try {
//         Dio dio = Dio();
//         Response response = await dio.post(
//           "https://swad.itgenixtechnologies.com/api/request-stock",
//           data: postData,
//           options: Options(headers: headerBody),
//         );

//         if (response.statusCode == 200) {
//           print(postData);
//           print(response.statusMessage);
//           setState(() {});
//         } else {
//           print("Error ");
//         }
//       } catch (e) {
//         print(e);
//       }
//     }
//   }
// }
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:techstrock2/SP_manager/sp_manager.dart';

import 'package:techstrock2/currentStock/smodal.dart';

import '../Api_service.dart';

import 'requestModal.dart';
import 'sendAndReceived.dart';

class updateBranchproduct extends StatefulWidget {
  final BranchS branchdetails;

  updateBranchproduct({
    Key? key,
    required this.branchdetails,
  }) : super(key: key);

  @override
  _updateBranchproductState createState() => _updateBranchproductState();
}

class _updateBranchproductState extends State<updateBranchproduct> {
  TextEditingController controller = TextEditingController();
  List<TextEditingController> _controllers = [];
  RefreshController _refreshController =
      RefreshController(initialRefresh: true);
  List<int> quantities = [];
  List<dynamic> _postsData = [];
  List<BranchStock> filteredProducts = [];

  @override
  void initState() {
    super.initState();
    filteredProducts.addAll(widget.branchdetails.data?.branchStock ?? []);
    _refreshData();
  }

  void _refreshData() async {
    _refreshController.refreshCompleted();
    setState(() {});
  }

  void _onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    _refreshData();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> categoryTabs = [];
    List<Widget> categoryTabViews = [];
    Map<int, List<BranchStock>> productsByCategory = {};
    filteredProducts.forEach((product) {
      int categoryId = product.categoryId ?? 0;
      if (!productsByCategory.containsKey(categoryId)) {
        productsByCategory[categoryId] = [];
      }
      productsByCategory[categoryId]?.add(product);
    });

    productsByCategory.forEach((categoryId, products) {
      String categoryName = products.first.categoryName.toString();

      categoryTabs.add(
        FittedBox(
          child: Tab(
            text: categoryName,
          ),
        ),
      );

      categoryTabViews.add(ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          BranchStock product = products[index];
          _controllers
              .add(TextEditingController()); // Add controller to the list

          return Card(
            elevation: 1.5,
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Color.fromARGB(255, 237, 236, 236)),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 15, left: 15, right: 15, bottom: 15),
              child: Row(
                children: [
                  Text(
                    product.productName!,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  Spacer(),
                  Text(product.productStock!),
                  const Spacer(),
                  Expanded(
                    child: TextField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      controller: _controllers[index],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ));
    });

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
          "Update Branch Product",
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
      backgroundColor: const Color.fromARGB(255, 243, 243, 243),
      body: SmartRefresher(
        controller: _refreshController,
        onRefresh: _onRefresh,
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 5),
              child: TextField(
                onChanged: (value) {
                  filterProducts(value);
                },
                cursorColor: Colors.black,
                decoration: const InputDecoration(
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
              child: DefaultTabController(
                length: categoryTabs.length,
                child: Column(
                  children: [
                    Container(
                      constraints: const BoxConstraints.expand(height: 35),
                      child: TabBar(
                        isScrollable: true,
                        indicatorColor: Colors.red,
                        indicatorSize: TabBarIndicatorSize.label,
                        labelColor: Colors.red,
                        unselectedLabelColor: Colors.black,
                        labelStyle: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        tabs: categoryTabs,
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: categoryTabViews,
                      ),
                    ),
                    SizedBox(
                      height: 45,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          List<String> quantities = _controllers
                              .map((controller) => controller.text)
                              .toList();
                          requestStock(  context,quantities: quantities, );
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => requestTab(),
                              ));
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0.0,
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Text(
                          'Submit',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void filterProducts(String query) {
    if (query.isEmpty) {
      filteredProducts.clear();
      filteredProducts.addAll(widget.branchdetails.data?.branchStock ?? []);
    } else {
      filteredProducts.clear();
      widget.branchdetails.data?.branchStock?.forEach((product) {
        if (product.productName?.toLowerCase().contains(query.toLowerCase()) ==
            true) {
          filteredProducts.add(product);
        }
      });
    }
    setState(() {});
  }

  Future<void> requestStock(
    BuildContext context, {
    required List<String> quantities,
  }) async {
    SharedPreferences _pref = await SpManager.getPref;

    String? token = _pref.getString("token");

    Map<String, String> headerBody = {'Content-Type': 'application/json'};

    headerBody = {"Authorization": "Bearer $token"};
    List<Map<String, dynamic>> productData = [];

    for (int i = 0; i < quantities.length; i++) {
      String quantity = quantities[i];
      if (quantity.isNotEmpty) {
        BranchStock product = widget.branchdetails.data!.branchStock![i];
        int productId = product.productId!;
        Map<String, dynamic> productInfo = {
          "product_id": productId,
          "product_stock": quantity,
        };
        productData.add(productInfo);
      }
    }

    if (productData.isNotEmpty) {
      Map<String, dynamic> postData = {
        "current_branch_id": _pref.getInt("branchid"),
        "req_branch_stock_id":
            widget.branchdetails.data!.branchDetails!.branchId!,
        "product_stock": productData,
      };

      try {
        Dio dio = Dio();
        Response response = await dio.post(
          "https://swad.itgenixtechnologies.com/api/request-stock",
          data: postData,
          options: Options(headers: headerBody),
        );

        if (response.statusCode == 200) {
          print(postData);
          print(response.statusMessage);
          setState(() {});
        } else {
          print("Error");
        }
      } catch (e) {
        print(e);
      }
    }
  }
}
