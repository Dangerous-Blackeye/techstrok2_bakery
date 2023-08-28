import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techstrock2/ProductList/selectbranchmodal.dart';
import 'package:techstrock2/SP_manager/sp_manager.dart';
import 'package:techstrock2/currentStock/smodal.dart';

class BranchStoc extends StatefulWidget {
  final BranchS branchdetails;
  BranchStoc({
    Key? key,
    required this.branchdetails,
  }) : super(key: key);

  @override
  State<BranchStoc> createState() => _BranchStocState();
}

class _BranchStocState extends State<BranchStoc> {
  TextEditingController controller = TextEditingController();

  RefreshController _refreshController =
      RefreshController(initialRefresh: true);
  @override
  void initState() {
    super.initState();
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
    widget.branchdetails.data?.branchStock?.forEach((product) {
      int categoryId = product.categoryId ?? 0;
      if (!productsByCategory.containsKey(categoryId)) {
        productsByCategory[categoryId] = [];
      }
      productsByCategory[categoryId]?.add(product);
    });

    productsByCategory.forEach((categoryId, products) {
      String categoryName = products.first.categoryName.toString();

      categoryTabs.add(FittedBox(
        child: Tab(
          text: categoryName,
        ),
      ));

      categoryTabViews.add(ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          BranchStock product = products[index];
          return Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Card(
              elevation: 1.5,
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: Color.fromARGB(255, 237, 236, 236),
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ListTile(
                title: Text(
                  product.productName!,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        fontSize: 15,
                      ),
                ),
                subtitle: Text(
                  product.productType!,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: const Color.fromARGB(255, 154, 154, 154),
                        fontSize: 15,
                      ),
                ),
                trailing: Text(
                  "Stock-${product.productStock!}",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        fontSize: 17,
                      ),
                ),
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
          "Branch Product",
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
                onChanged: (Value) {},
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
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
