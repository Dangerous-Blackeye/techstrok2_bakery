// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:techstrock2/branch/SendModal.dart';
// import 'package:techstrock2/branch/requestupdatemodal.dart';

// import '../SP_manager/sp_manager.dart';
// import 'requestDetailsModal.dart';
// import 'requestselectedmodal.dart';

// class RequestDetailsScreen extends StatefulWidget {
//   final requestDetails details;
//   RequestDetailsScreen({Key? key, required this.details}) : super(key: key);

//   @override
//   State<RequestDetailsScreen> createState() => _RequestDetailsScreenState();
// }

// class _RequestDetailsScreenState extends State<RequestDetailsScreen> {
//   Dio dio = Dio();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 243, 243, 243),
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
//           "Update Stock Details",
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
//         padding: const EdgeInsets.only(top: 10, right: 15, left: 15),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Personal Details",
//               style: Theme.of(context)
//                   .textTheme
//                   .bodyText1!
//                   .copyWith(color: Colors.black, fontSize: 18),
//               textAlign: TextAlign.center,
//             ),
//             Row(
//               children: [
//                 Expanded(
//                   child: Card(
//                     elevation: 1.5,
//                     shape: RoundedRectangleBorder(
//                       side: const BorderSide(
//                           color: Color.fromARGB(255, 237, 236, 236)),
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(12.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             children: [
//                               Flexible(
//                                 child: RichText(
//                                   overflow: TextOverflow.ellipsis,
//                                   text: TextSpan(
//                                     text: widget.details.data!.requestProducts!
//                                         .first.products!.productType!,
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .bodyText1!
//                                         .copyWith(
//                                             fontWeight: FontWeight.w700,
//                                             color: Colors.black,
//                                             fontSize: 15),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Text(widget.details.data!.requestProducts!.first
//                               .products!.category!.name!),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 Expanded(
//                   child: Card(
//                     elevation: 1.5,
//                     shape: RoundedRectangleBorder(
//                       side: const BorderSide(
//                         color: Color.fromARGB(255, 237, 236, 236),
//                       ),
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         children: [
//                           Text("Id-${widget.details.data!.requestNo!}"),
//                           FittedBox(
//                             child: Text(
//                               "Date-${widget.details.data!.updatedAt}",
//                             ),
//                           ),
//                           FittedBox(
//                             child: Text(
//                               "${widget.details.data!.status}",
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(
//               height: 2,
//             ),
//             Text(
//               "Product Details",
//               style: Theme.of(context)
//                   .textTheme
//                   .bodyText1!
//                   .copyWith(color: Colors.black, fontSize: 18),
//               textAlign: TextAlign.center,
//             ),
//             Expanded(
//               child: Card(
//                 elevation: 1.5,
//                 shape: RoundedRectangleBorder(
//                   side: const BorderSide(
//                       color: Color.fromARGB(255, 237, 236, 236)),
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//                 child: ListView.builder(
//                   itemCount: widget.details.data?.requestProducts?.length,
//                   itemBuilder: (context, index) {
//                     return Column(
//                       children: [
//                         ListTile(
//                           title: Text(
//                             widget.details.data?.requestProducts?[index]
//                                     .products?.name ??
//                                 '',
//                             style: const TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           trailing: Text(
//                             widget.details.data?.requestProducts?[index]
//                                     .reqStock ??
//                                 '',
//                             style: const TextStyle(
//                               fontSize: 16,
//                             ),
//                           ),
//                         ),
//                       ],
//                     );
//                   },
//                 ),
//               ),
//             ),
//             Row(
//               children: [
//                 Expanded(
//                   child: ElevatedButton(
//                     onPressed: () {
//                       requestUpdate("completed");
//                     },
//                     child: Text("Completed"),
//                   ),
//                 ),
//                 SizedBox(
//                   width: 5,
//                 ),
//                 Expanded(
//                   child: ElevatedButton(
//                     onPressed: () {
//                       requestUpdate("cancelled");
//                     },
//                     child: Text("Cancelled"),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   requestUpdate(String status) async {
//     SharedPreferences _pref = await SpManager.getPref;
//     String? token = _pref.getString("token");

//     Map<String, String> headerBody = {
//       'Content-Type': 'application/json',
//       'Authorization': 'Bearer $token',
//     };

//     Map<String, dynamic> postData = {
//       'request_id': widget.details.data!.requestProducts!.first.requestId,
//       'request_no': widget.details.data!.requestNo,
//       'status': status,
//     };

//     try {
//       Response response = await dio.post(
//         "https://swad.itgenixtechnologies.com/api/request-update",
//         options: Options(headers: headerBody),
//         data: postData,
//       );

//       if (response.statusCode == 200) {
//         print(postData);
//         requestselected request = requestselected.fromJson(response.data);
//         print(response.statusCode);
//       } else {
//         print("error");
//       }
//     } catch (error) {
//       print(error.toString());
//     }
//   }
// }
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techstrock2/branch/SendModal.dart';
import 'package:techstrock2/branch/requestupdatemodal.dart';

import '../SP_manager/sp_manager.dart';
import 'requestDetailsModal.dart';
import 'requestselectedmodal.dart';

class RequestDetailsScreen extends StatefulWidget {
  final requestDetails details;
  RequestDetailsScreen({Key? key, required this.details}) : super(key: key);

  @override
  State<RequestDetailsScreen> createState() => _RequestDetailsScreenState();
}

class _RequestDetailsScreenState extends State<RequestDetailsScreen> {
  Dio dio = Dio();

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
    bool isPending = widget.details.data!.status == "pending";

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 243, 243),
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
          "Update Stock Details",
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
        padding: const EdgeInsets.only(top: 10, right: 15, left: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Personal Details",
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: Colors.black, fontSize: 18),
              textAlign: TextAlign.center,
            ),
            Row(
              children: [
                Expanded(
                  child: Card(
                    elevation: 1.5,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          color: Color.fromARGB(255, 237, 236, 236)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Flexible(
                                child: RichText(
                                  overflow: TextOverflow.ellipsis,
                                  text: TextSpan(
                                    text: widget.details.data!.requestProducts!
                                        .first.products!.productType!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black,
                                            fontSize: 15),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(widget.details.data!.requestProducts!.first
                              .products!.category!.name!),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Expanded(
                  child: Card(
                    elevation: 1.5,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Color.fromARGB(255, 237, 236, 236),
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("Id-${widget.details.data!.requestNo!}"),
                          FittedBox(
                            child: Text(
                              "Date-${widget.details.data!.updatedAt}",
                            ),
                          ),
                          FittedBox(
                            child: Text(widget.details.data!.status!,
                                style: TextStyle(
                                    color: _getStatusColor(
                                        widget.details.data!.status!),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              "Product Details",
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: Colors.black, fontSize: 18),
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: Card(
                elevation: 1.5,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                      color: Color.fromARGB(255, 237, 236, 236)),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ListView.builder(
                  itemCount: widget.details.data?.requestProducts?.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          title: Text(
                            widget.details.data?.requestProducts?[index]
                                    .products?.name ??
                                '',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          trailing: Text(
                            widget.details.data?.requestProducts?[index]
                                    .reqStock ??
                                '',
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            if (isPending)
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        requestUpdate("completed");
                      },
                      child: Text("Completed"),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        requestUpdate("cancelled");
                      },
                      child: Text("Cancelled"),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  requestUpdate(String status) async {
    SharedPreferences _pref = await SpManager.getPref;
    String? token = _pref.getString("token");

    Map<String, String> headerBody = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    Map<String, dynamic> postData = {
      'request_id': widget.details.data!.requestProducts!.first.requestId,
      'request_no': widget.details.data!.requestNo,
      'status': status,
    };

    try {
      Response response = await dio.post(
        "https://swad.itgenixtechnologies.com/api/request-update",
        options: Options(headers: headerBody),
        data: postData,
      );

      if (response.statusCode == 200) {
        print(postData);
        requestselected request = requestselected.fromJson(response.data);
        print(response.statusCode);
      } else {
        print("error");
      }
    } catch (error) {
      print(error.toString());
    }
  }
}
