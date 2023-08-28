import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techstrock2/updateStockdetails.dart/detailsModal.dart';
import 'package:techstrock2/updateStocklist.dart/updateDetailsmodal.dart';
import 'package:techstrock2/updateStocklist.dart/updateListmodal.dart';

import '../Api_call/api_call.dart';
import '../SP_manager/sp_manager.dart';
import '../currentStock/smodal.dart';

class UpdateStockDetails extends StatefulWidget {
  final updateDetailsList updatedetails;

  final updateNo;
  final updatedby;
  final contact;
  final location;
  final status;
  final updateId;
  final updatedDate;
  UpdateStockDetails({
    Key? key,
    required this.updatedetails,
    required this.updateNo,
    required this.updatedby,
    required this.contact,
    required this.location,
    required this.status,
    required this.updateId,
    required this.updatedDate,
  }) : super(key: key);

  @override
  State<UpdateStockDetails> createState() => _UpdateStockDetailsState();
}

class _UpdateStockDetailsState extends State<UpdateStockDetails> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final dio = Dio();
  @override
  Widget build(BuildContext context) {
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
                  .bodyLarge!
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
                      padding: const EdgeInsets.only(
                          top: 12, left: 10, right: 10, bottom: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Flexible(
                                child: RichText(
                                    overflow: TextOverflow.ellipsis,
                                    text: TextSpan(
                                      text: widget.updatedby.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                              fontWeight: FontWeight.w700,
                                              color: Colors.black,
                                              fontSize: 15),
                                    )),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 209, 245, 211),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 3, bottom: 3, left: 3, right: 3),
                                    child: FittedBox(
                                      child: Text(
                                        widget.status.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                                color: const Color.fromARGB(
                                                    255, 3, 157, 8),
                                                fontSize: 7),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(widget.location.toString()),
                          Text(widget.contact.toString())
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
                      padding: const EdgeInsets.only(
                          top: 16, left: 10, right: 10, bottom: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("Id-${widget.updateId.toString()}"),
                          FittedBox(
                            child:
                                Text("Date-${widget.updatedDate.toString()}"),
                          ),
                          FittedBox(
                            child: Text(
                              "UpdateNo-${widget.updateNo.toString()}",
                            ),
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
                  .bodyLarge!
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
                child: widget.updatedetails.data!.isEmpty
                    ? Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemCount: widget.updatedetails.data!.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              ListTile(
                                title: Text(
                                  widget
                                      .updatedetails.data![index].productName!,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                trailing: Text(
                                  widget
                                      .updatedetails.data![index].currentStock!,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
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
}
