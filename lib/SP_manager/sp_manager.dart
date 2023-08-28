import 'package:shared_preferences/shared_preferences.dart';

class SpManager {
  static Future<SharedPreferences> getPref = SharedPreferences.getInstance();

  static void setPrefrence(String token) async {
    SharedPreferences _pref = await getPref;
    _pref.setString("token", token);
  }

  static void branchid(int branchid) async {
    SharedPreferences _pref = await getPref;
    _pref.setInt("branchid", branchid);
  }

  static void userid(int userid) async {
    SharedPreferences _pref = await getPref;
    _pref.setInt("userid", userid);
  }

  static void factoryid(int factoryid) async {
    SharedPreferences _pref = await getPref;
    _pref.setInt("factoryid", factoryid);
  }

  static void setproduct(String product) async {
    SharedPreferences _pref = await getPref;
    _pref.setString("product", product);
  }

  static void setquantity(int quantity) async {
    SharedPreferences _pref = await getPref;
    _pref.setInt("quantit", quantity);
  }

  static void clearPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  Future<String> getLoggedOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String mobile_number = prefs.getString('KEY_LOGGED_OUT')!;
    return mobile_number;
  }

  static void setLoggedOut(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('KEY_LOGGED_OUT', value);
  }
}
