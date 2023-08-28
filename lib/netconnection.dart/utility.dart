import 'package:connectivity_plus/connectivity_plus.dart';

class Utility {
  static Future<bool> isNetworkConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      print('Conectivity ==> Mobile Network');
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      print('Conectivity ==> Wifi Network');
      return true;
    }
    return false;
  }
}
