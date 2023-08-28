// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../Api_service.dart';
// import '../SP_manager/sp_manager.dart';
// import 'factoryModal.dart';

// class ProductList extends StatefulWidget {
//   const ProductList({Key? key}) : super(key: key);

//   @override
//   State<ProductList> createState() => _ProductListState();
// }

// class _ProductListState extends State<ProductList> {
//   List<BranchStock> branchStock = [];
//   List<TextEditingController> _controllers = [];

//   @override
//   void initState() {
//     super.initState();
//     productListApi();
//   }

//   Dio dio = Dio();
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
//           "Stock",
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
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(
//               top: 5,
//               left: 5,
//               right: 5,
//               bottom: 5,
//             ),
//             child: TextField(
//               onChanged: (Value) {},
//               cursorColor: Colors.black,
//               decoration: const InputDecoration(
//                 hintText: 'Search Product',
//                 prefixIcon: Icon(
//                   Icons.search,
//                   color: Colors.black,
//                 ),
//                 border: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.black),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: BorderSide(
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: DefaultTabController(
//               length: getProductTypeCount(),
//               child: Column(
//                 children: [
//                   Container(
//                     constraints: const BoxConstraints.expand(height: 35),
//                     child: TabBar(
//                       isScrollable: true,
//                       indicatorColor: Colors.red,
//                       indicatorSize: TabBarIndicatorSize.label,
//                       labelColor: Colors.red,
//                       unselectedLabelColor: Colors.black,
//                       labelStyle:
//                           TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                       tabs: getProductTypeTabs(),
//                     ),
//                   ),
//                   Expanded(
//                     child: TabBarView(
//                       children: getProductTypeTabViews(),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 45,
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         List<String> quantities = _controllers
//                             .map((controller) => controller.text)
//                             .toList();
//                         requestPost(
//                           context,
//                           quantities: quantities,
//                         );
//                         Navigator.pop(context);
//                       },
//                       style: ElevatedButton.styleFrom(
//                         elevation: 0.0,
//                         backgroundColor: Colors.blue,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                       ),
//                       child: const Text(
//                         'Submit',
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

//   List<Tab> getProductTypeTabs() {
//     List<Tab> tabs = [];

//     Set<String?> productTypes =
//         branchStock.map((product) => product.productType).toSet();
//     for (String? productType in productTypes) {
//       tabs.add(Tab(text: productType));
//     }

//     return tabs;
//   }

//   List<Widget> getProductTypeTabViews() {
//     List<Widget> tabViews = [];

//     Set<String?> productTypes =
//         branchStock.map((product) => product.productType).toSet();
//     for (String? productType in productTypes) {
//       List<BranchStock> filteredProducts = branchStock
//           .where((product) => product.productType == productType)
//           .toList();
//       tabViews.add(
//         ListView.builder(
//           itemCount: filteredProducts.length,
//           itemBuilder: (context, index) {
//             _controllers.add(TextEditingController());
//             return Card(
//               elevation: 1.5,
//               shape: RoundedRectangleBorder(
//                 side:
//                     const BorderSide(color: Color.fromARGB(255, 237, 236, 236)),
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.only(
//                     top: 15, left: 15, right: 15, bottom: 15),
//                 child: Row(
//                   children: [
//                     Text(
//                       branchStock[index].productName!,
//                       style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                             fontSize: 17,
//                             fontWeight: FontWeight.w500,
//                           ),
//                     ),
//                     Spacer(),
//                     Text(branchStock[index].productStock!),
//                     const Spacer(),
//                     Expanded(
//                       child: TextField(
//                         textAlign: TextAlign.center,
//                         keyboardType: TextInputType.number,
//                         controller: _controllers[index],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//       );
//     }

//     return tabViews;
//   }

//   int getProductTypeCount() {
//     return branchStock.map((product) => product.productType).toSet().length;
//   }

//   productListApi() async {
//     SharedPreferences _pref = await SpManager.getPref;

//     String? token = _pref.getString("token");

//     Map<String, String> headerBody = {'Content-Type': 'application/json'};

//     headerBody = {"Authorization": "Bearer $token"};
//     Map<String, dynamic> PostData = {"branch_id": _pref.getInt("factoryid")};
//     try {
//       Response response = await dio.post(
//           "https://swad.itgenixtechnologies.com/api/branch-stock-details",
//           options: Options(headers: headerBody),
//           data: PostData);

//       if (response.statusCode == 200) {
//         print(response.data);
//         factoryproduct factory = factoryproduct.fromJson(response.data);
//         setState(() {
//           branchStock.addAll(factory.data!.branchStock!);
//         });
//       } else {
//         print("error");
//       }
//     } catch (e) {
//       print(e);
//     }
//   }

//   List<dynamic> _postsData = [];
//   final Dio _dio = Dio();

//   Future<void> requestPost(
//     BuildContext context, {
//     required List<String> quantities,
//   }) async {
//     SharedPreferences _pref = await SpManager.getPref;

//     String? token = _pref.getString("token");

//     Map<String, String> headerBody = {'Content-Type': 'application/json'};

//     headerBody = {"Authorization": "Bearer $token"};
//     List<Map<String, dynamic>> productData = [];

//     for (int i = 0; i < branchStock.length; i++) {
//       Map<String, dynamic> product;

//       String quantity = quantities[i];
//       if (quantity.isNotEmpty) {
//         product = {
//           "product_id": branchStock[i].productId,
//           "product_stock": quantity,
//         };
//         productData.add(product);
//       }
//     }
//     if (productData.isNotEmpty) {
//       Map<String, dynamic> PostData = {
//         "current_branch_id": _pref.getInt("branchid"),
//         "req_branch_stock_id": _pref.getInt("factoryid"),
//         "product_stock": productData,
//       };
//       try {
//         Response response = await _dio.post(
//             "https://swad.itgenixtechnologies.com/api/request-stock",
//             data: PostData,
//             options: Options(headers: headerBody));
//         if (response.statusCode == 200) {
//           print(PostData);

//           _postsData.insert(0, response.data);

//           print(response.statusMessage);
//         } else {
//           print(response.statusMessage);
//         }
//       } catch (e) {
//         if (e is DioError) {
//           print(e.response?.data);
//         }
//       }
//     }
//   }
// }
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Api_service.dart';
import '../SP_manager/sp_manager.dart';
import 'factoryModal.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<BranchStock> branchStock = [];
  List<TextEditingController> _controllers = [];
  List<BranchStock> filteredProducts = [];

  @override
  void initState() {
    super.initState();
    productListApi();
  }

  Dio dio = Dio();

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
          "Stock",
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 5,
              left: 5,
              right: 5,
              bottom: 5,
            ),
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
              length: getProductTypeCount(),
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
                      labelStyle:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      tabs: getProductTypeTabs(),
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: getProductTypeTabViews(),
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
                        requestPost(
                          context,
                          quantities: quantities,
                        );
                        Navigator.pop(context);
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
    );
  }

  List<Tab> getProductTypeTabs() {
    List<Tab> tabs = [];

    Set<String?> productTypes =
        filteredProducts.map((product) => product.productType).toSet();
    for (String? productType in productTypes) {
      tabs.add(Tab(text: productType));
    }

    return tabs;
  }

  List<Widget> getProductTypeTabViews() {
    List<Widget> tabViews = [];

    Set<String?> productTypes =
        filteredProducts.map((product) => product.productType).toSet();
    for (String? productType in productTypes) {
      List<BranchStock> filteredProductsByType = filteredProducts
          .where((product) => product.productType == productType)
          .toList();
      tabViews.add(
        ListView.builder(
          itemCount: filteredProductsByType.length,
          itemBuilder: (context, index) {
            _controllers.add(TextEditingController());
            return Card(
              elevation: 1.5,
              shape: RoundedRectangleBorder(
                side:
                    const BorderSide(color: Color.fromARGB(255, 237, 236, 236)),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 15, left: 15, right: 15, bottom: 15),
                child: Row(
                  children: [
                    Text(
                      filteredProductsByType[index].productName!,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    Spacer(),
                    Text(filteredProductsByType[index].productStock!),
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
        ),
      );
    }

    return tabViews;
  }

  int getProductTypeCount() {
    return filteredProducts.map((product) => product.productType).toSet().length;
  }

  productListApi() async {
    SharedPreferences _pref = await SpManager.getPref;

    String? token = _pref.getString("token");

    Map<String, String> headerBody = {'Content-Type': 'application/json'};

    headerBody = {"Authorization": "Bearer $token"};
    Map<String, dynamic> PostData = {"branch_id": _pref.getInt("factoryid")};
    try {
      Response response = await dio.post(
          "https://swad.itgenixtechnologies.com/api/branch-stock-details",
          options: Options(headers: headerBody),
          data: PostData);

      if (response.statusCode == 200) {
        print(response.data);
        factoryproduct factory = factoryproduct.fromJson(response.data);
        setState(() {
          branchStock.addAll(factory.data!.branchStock!);
          filteredProducts.addAll(factory.data!.branchStock!);
        });
      } else {
        print("error");
      }
    } catch (e) {
      print(e);
    }
  }

  List<dynamic> _postsData = [];
  final Dio _dio = Dio();

  Future<void> requestPost(
    BuildContext context, {
    required List<String> quantities,
  }) async {
    SharedPreferences _pref = await SpManager.getPref;

    String? token = _pref.getString("token");

    Map<String, String> headerBody = {'Content-Type': 'application/json'};

    headerBody = {"Authorization": "Bearer $token"};
    List<Map<String, dynamic>> productData = [];

    for (int i = 0; i < filteredProducts.length; i++) {
      Map<String, dynamic> product;

      String quantity = quantities[i];
      if (quantity.isNotEmpty) {
        product = {
          "product_id": filteredProducts[i].productId,
          "product_stock": quantity,
        };
        productData.add(product);
      }
    }
    if (productData.isNotEmpty) {
      Map<String, dynamic> PostData = {
        "current_branch_id": _pref.getInt("branchid"),
        "req_branch_stock_id": _pref.getInt("factoryid"),
        "product_stock": productData,
      };
      try {
        Response response = await _dio.post(
            "https://swad.itgenixtechnologies.com/api/request-stock",
            data: PostData,
            options: Options(headers: headerBody));
        if (response.statusCode == 200) {
          print(PostData);

          _postsData.insert(0, response.data);

          print(response.statusMessage);
        } else {
          print(response.statusMessage);
        }
      } catch (e) {
        if (e is DioError) {
          print(e.response?.data);
        }
      }
    }
  }

  void filterProducts(String keyword) {
    setState(() {
      filteredProducts = branchStock.where((product) {
        final productName = product.productName?.toLowerCase() ?? '';
        final searchKeyword = keyword.toLowerCase();
        return productName.contains(searchKeyword);
      }).toList();
    });
  }
}
