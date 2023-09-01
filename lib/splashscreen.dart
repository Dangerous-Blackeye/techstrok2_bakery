import 'dart:async';
import 'package:techstrock2/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:techstrock2/loginpage/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoggedIn = true;

  @override
  void initState() {
    super.initState();
    goToPage();
  }

  goToPage() async {
    await Future.delayed(
      const Duration(seconds: 5),
    );
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return isLoggedIn ? Dashboard() : const LoginPage();
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Text(
          'Bakery',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
