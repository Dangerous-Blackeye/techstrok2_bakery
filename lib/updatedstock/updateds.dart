// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';
// import '../Api_call/api_call.dart';

// class EditStock extends StatefulWidget {
//   const EditStock({Key? key}) : super(key: key);

//   @override
//   State<EditStock> createState() => _EditStockState();
// }

// class _EditStockState extends State<EditStock> {
//   List<TextEditingController> _controllers = [];
//   RefreshController _refreshController =
//       RefreshController(initialRefresh: true);

//   @override
//   void initState() {
//     super.initState();
//     context.read<ApiCall>().currentdata();
//     _refreshData();
//   }

//   void _refreshData() async {
//     _refreshController.refreshCompleted();
//     setState(() {});
//   }

//   void _onRefresh() async {
//     await Future.delayed(const Duration(milliseconds: 1000));
//     _refreshData();
//     context.read<ApiCall>().currentdata();

//   }

//   @override
//   Widget build(BuildContext context) {
//     final apiCall = context.watch<ApiCall>();
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
//           "Add Stock",
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
//               List<String> quantities =
//                   _controllers.map((controller) => controller.text).toList();
//               context.read<ApiCall>().createpost(
//                     context,
//                     quantities: quantities,
//                   );
//               Navigator.pop(context);
//             },
//             icon: const Icon(Icons.save),
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             Padding(
//               padding:
//                   const EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 5),
//               child: TextField(
//                 onChanged: (value) {},
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
//               child: SmartRefresher(
//                 controller: _refreshController,
//                 onRefresh: _onRefresh,
//                 child: ListView.builder(
//                   itemCount: apiCall.branchstock.length,
//                   itemBuilder: (context, index) {
//                     _controllers.add(TextEditingController());
//                     return Card(
//                       elevation: 1.5,
//                       shape: RoundedRectangleBorder(
//                         side: const BorderSide(
//                             color: Color.fromARGB(255, 237, 236, 236)),
//                         borderRadius: BorderRadius.circular(10.0),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.only(
//                             top: 15, left: 15, right: 15, bottom: 15),
//                         child: Row(
//                           children: [
//                             Text(
//                               apiCall.branchstock[index].productName ??
//                                   ''.toString(),
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .bodyMedium!
//                                   .copyWith(
//                                     fontSize: 17,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                             ),
//                             Spacer(),
//                             Text(apiCall.branchstock[index].productStock!),
//                             const Spacer(),
//                             Expanded(
//                               child: TextField(
//                                 textAlign: TextAlign.center,
//                                 keyboardType: TextInputType.number,
//                                 controller: _controllers[index],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../Api_call/api_call.dart';

class EditStock extends StatefulWidget {
  const EditStock({Key? key}) : super(key: key);

  @override
  State<EditStock> createState() => _EditStockState();
}

class _EditStockState extends State<EditStock> {
  List<TextEditingController> _controllers = [];
  RefreshController _refreshController =
      RefreshController(initialRefresh: true);
  String searchText = '';

  @override
  void initState() {
    super.initState();
    context.read<ApiCall>().currentdata();
    _refreshData();
  }

  void _refreshData() async {
    _refreshController.refreshCompleted();
    setState(() {});
  }

  void _onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    _refreshData();
    context.read<ApiCall>().currentdata();
    print("yes");
  }

  @override
  Widget build(BuildContext context) {
    final apiCall = context.watch<ApiCall>();
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
          "Add Stock",
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
              List<String> quantities =
                  _controllers.map((controller) => controller.text).toList();
              context.read<ApiCall>().createpost(
                    context,
                    quantities: quantities,
                  );
              Navigator.pop(context);
            },
            icon: const Icon(Icons.save),
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
              child: SmartRefresher(
                controller: _refreshController,
                onRefresh: _onRefresh,
                child: ListView.builder(
                  itemCount: apiCall.branchstock.length,
                  itemBuilder: (context, index) {
                    _controllers.add(TextEditingController());
                    final product = apiCall.branchstock[index];
                    if (searchText.isNotEmpty &&
                        !product.productName!
                            .toLowerCase()
                            .contains(searchText.toLowerCase())) {
                      return Container(); // Skip items that don't match the search text
                    }
                    return Card(
                      elevation: 1.5,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            color: Color.fromARGB(255, 237, 236, 236)),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 15, left: 15, right: 15, bottom: 15),
                        child: Row(
                          children: [
                            Text(
                              product.productName ?? '',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
