import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:techstrock2/currentStock/dio_provider_currentS.dart';
import 'package:techstrock2/currentStock/smodal.dart';

class CurrentStock extends StatefulWidget {
  const CurrentStock({super.key});

  @override
  State<CurrentStock> createState() => _CurrentStockState();
}

class _CurrentStockState extends State<CurrentStock> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: true);
  @override
  void initState() {
    super.initState();
    context.read<currentstockprovider>().curentdata();
    _refreshData();
  }

  void _refreshData() async {
    _refreshController.refreshCompleted();
    setState(() {});
  }

  void _onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    _refreshData();
    context.read<currentstockprovider>().curentdata();
  }

  @override
  Widget build(BuildContext context) {
    final currentstockservice = context.watch<currentstockprovider>();

    List<String?> categoryNames = currentstockservice.filteredBranchStock
        .map((product) => product.categoryName)
        .toSet()
        .toList();

    // Create a list of Tab widgets based on category names
    List<Widget> tabWidgets = categoryNames.map((categoryName) {
      return FittedBox(
        child: Tab(text: categoryName),
      );
    }).toList();

    // Create a list of TabBarView widgets based on category names
    List<Widget> tabBarViewWidgets = categoryNames.map((categoryName) {
      List<Widget> categoryProducts = [];
      Set<String> addedProductNames = {}; // Track added product names

      currentstockservice.filteredBranchStock.forEach((product) {
        if (product.categoryName == categoryName &&
            !addedProductNames.contains(product.productName)) {
          categoryProducts.add(
            Card(
              elevation: 1.5,
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: Color.fromARGB(255, 237, 236, 236),
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      product.productName ?? 'Loading..',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            fontSize: 15,
                          ),
                    ),
                    subtitle: Text(
                      product.productType ?? 'Loading..',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: const Color.fromARGB(255, 154, 154, 154),
                            fontSize: 15,
                          ),
                    ),
                    trailing: Text(
                      product.productStock ?? 'Loading..',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            fontSize: 17,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          );
          addedProductNames
              .add(product.productName!); // Add product name to the set
        }
      });

      return Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: ListView(
          children: categoryProducts,
        ),
      );
    }).toList();

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
          "Current Stock",
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
      body: SmartRefresher(
        controller: _refreshController,
        onRefresh: _onRefresh,
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 5),
              child: TextField(
                onChanged: (Value) {
                  context.read<currentstockprovider>().filterStock(Value);
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
                length: categoryNames.length,
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
                        tabs: tabWidgets,
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: tabBarViewWidgets,
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
