import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techstrock2/Api_service.dart';

import '../SP_manager/sp_manager.dart';
import 'smodal.dart';

class currentstockprovider with ChangeNotifier {
  final dio = Dio();
  List<BranchS> branchdetails = [];
  List<BranchStock> branchstock = [];
  List<BranchStock> filteredBranchStock = [];
  curentdata() async {
    SharedPreferences _pref = await SpManager.getPref;

    String? token = _pref.getString("token");

    Map<String, String> headerBody = {'Content-Type': 'application/json'};

    headerBody = {"Authorization": "Bearer $token"};

    try {
      Dio dio = Dio();
      Map<String, dynamic> PostData = {"branch_id": _pref.getInt("branchid")};

      Response response = await dio.post(Apiservice.branchstockApi,
          options: Options(headers: headerBody), data: PostData);

      if (response.statusCode == 200) {
        print(response.statusCode);

        BranchS branchs = BranchS.fromJson(response.data);
        branchstock.addAll(branchs.data!.branchStock!);

        branchdetails = branchdetails;
        filteredBranchStock = branchstock;
        notifyListeners();
      } else {
        print('Failed to fetch branch stock');
      }
    } catch (e) {
      print(e);
    }
  }

  void filterStock(String keyword) {
    filteredBranchStock = branchstock
        .where((stock) =>
            stock.productName?.toLowerCase().contains(keyword.toLowerCase()) ??
            false)
        .toList();
    notifyListeners();
  }
}
