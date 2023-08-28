import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:techstrock2/Api_call/api_call.dart';
import 'package:techstrock2/currentStock/dio_provider_currentS.dart';
import 'package:techstrock2/dashboard/dashboard.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:techstrock2/loginpage/login.dart';
import 'package:techstrock2/splashscreen.dart';
// import 'package:device_preview/device_preview.dart';

import 'ProductList/branchStock.dart';


void main() => runApp(
      MyApp(), // Wrap your app
    );

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () async {
        await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
        //enables secure mode for app, disables screenshot, screen recording
      },
    );
    checkAutoLogin();
  }

  void checkAutoLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    if (token != null && token.isNotEmpty) {
      setState(() {
        isLoggedIn = true;
      });
    }
  }

//  SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? token = prefs.getString('token');
//     String? branchid = prefs.getString('branchid');
//     String? userid = prefs.getString('userid');
//     if (token != null && userid != null && branchid != null) {
//       setState(() {
//         isLoggedIn = true;
//       });
//     }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ApiCall(),
        ),
        ChangeNotifierProvider(
          create: (context) => currentstockprovider(),
        ),
      ],
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(

              debugShowCheckedModeBanner: false,
              title: '',
              theme: ThemeData.light(),
              home:
               isLoggedIn ? Dashboard() : const LoginPage(),
              );
        },
      ),
    );
  }
}
// C:\Users\TECHSTROCK-04\AppData\Local\Android\Sdk\platform-tools
//shop//https://www.educative.io/answers/how-to-create-a-shopping-cart-app-using-bloc-pattern-in-flutter