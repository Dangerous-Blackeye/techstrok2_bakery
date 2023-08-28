import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techstrock2/Api_service.dart';
import 'package:techstrock2/Common_widget/common_widget.dart';
import 'package:techstrock2/loginpage/login_model.dart';
import 'package:techstrock2/ProductList/primaryProductModal.dart';
import 'package:techstrock2/SP_manager/sp_manager.dart';
import 'package:techstrock2/dashboard/dashboard.dart';
import '../currentStock/smodal.dart';

class ApiCall extends ChangeNotifier {
  final dio = Dio();

  static LoginModel? loginModel;

  void login(BuildContext context,
      {required String phoneNumber, required String password}) {
    CommonWidget.showLoading(context);
    try {
      Dio().post(Apiservice.loginApi, data: {
        "phone_number": phoneNumber,
        "password": password
      }).then((value) {
        if (value.statusCode == 200) {
          loginModel = LoginModel.fromJson(value.data);

          SpManager.setPrefrence(loginModel!.data!.accessToken!);
          SpManager.branchid(loginModel!.data!.user!.branchId!);
          SpManager.userid(loginModel!.data!.user!.userId!);
          SpManager.factoryid(loginModel!.data!.user!.factoryId!);

          Navigator.pop(context);

          Fluttertoast.showToast(
              msg: loginModel!.message!,
              backgroundColor: Theme.of(context).primaryColor);
        }

        if (value.data != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Dashboard(),
            ),
          );
        }
        notifyListeners();
      }).onError((error, stackTrace) {
        Navigator.pop(context);
        Fluttertoast.showToast(
            msg: "Enter valid username and password",
            backgroundColor: Theme.of(context).primaryColor);
      });
    } catch (e) {
      Navigator.pop(context);

      print(e);
    }
  }

//////Branch Stock Api/////

  List<BranchStock> branchstock = [];
  List<int> quantities = [];

  currentdata() async {
    SharedPreferences _pref = await SpManager.getPref;

    String? token = _pref.getString("token");

    Map<String, String> headerBody = {'Content-Type': 'application/json'};

    headerBody = {"Authorization": "Bearer $token"};
    Map<String, dynamic> PostData = {"branch_id": _pref.getInt("branchid")};
    try {
      Response response = await dio.post(Apiservice.branchstockApi,
          options: Options(headers: headerBody), data: PostData);
      print(response.data);
      if (response.statusCode == 200) {
        branchstock.clear();
        BranchS branchS = BranchS.fromJson(response.data);
        branchstock.addAll(branchS.data!.branchStock!);
        notifyListeners();
        print(branchstock.first.productName);
      } else {
        print("error");
      }
    } catch (e) {
      print(e);
    }
  }

  List<dynamic> _postsData = [];
  final Dio _dio = Dio();

  Future<void> createpost(
    BuildContext context, {
    required List<String> quantities,
  }) async {
    SharedPreferences _pref = await SpManager.getPref;

    String? token = _pref.getString("token");

    Map<String, String> headerBody = {'Content-Type': 'application/json'};

    headerBody = {"Authorization": "Bearer $token"};
    List<Map<String, dynamic>> productData = [];

    for (int i = 0; i < branchstock.length; i++) {
      Map<String, dynamic> product;

      String quantity = quantities[i];
      if (quantity.isNotEmpty) {
        product = {
          "productId": branchstock[i].productId,
          "productQty": quantity,
        };
        productData.add(product);
      }
    }
    if (productData.isNotEmpty) {
      Map<String, dynamic> PostData = {
        "branch_id": _pref.getInt("branchid"),
        "type": "less",
        "product_data": productData,
      };
      try {
        Response response = await _dio.post(Apiservice.updatestockApi,
            data: PostData, options: Options(headers: headerBody));
        if (response.statusCode == 200) {
          print(PostData);
          _postsData.insert(0, response.data);

          notifyListeners();
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
}
