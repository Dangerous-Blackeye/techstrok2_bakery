// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   List<dynamic> data = [];
//    final String _accessToken =
//       "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMGM3NzIxNTgyNDkxMWI2NGJlNmIzMThmNDQyYWI4ZmI5ODZmNTI2ZDU0NThjNzVmOTBlZTUyN2MwMDI4ZjZhZTY3MTIyMzIwMjQwNjJiZTUiLCJpYXQiOjE2ODMxMDI5NDUuMjYzODc4LCJuYmYiOjE2ODMxMDI5NDUuMjYzODgsImV4cCI6MTcxNDcyNTM0NS4yNTg2ODQsInN1YiI6IjEiLCJzY29wZXMiOltdfQ.YMl3HRGLcAm1rKtd0Db7pgnNK2DhsBbIA_Tyy_MLDPJJUb2Bz9W3UE5JdMHXNTroy6uDCwzTKWWMa9ab_H07XqIJtAzF_cyis_hO1WrYUdMc6QlAa8XrEe_RQAe7szQa90W2Tnl2sp8UNtT-IPQqawBBLFi8EGt351cQGwUii9NQemyFsKCDWs1h1ANwhIW5QQavq3hoUaWeWPo1BIhKHoYB5uvwJ4R7e7JTDlamC1E9UBFMJsbaFR3-1bZtDiqFOv9qZtgUQ13aXr1rcQe4RQI0tRmFyvXSTGfTXUCc5RRDmozazm1jsmNI4vVQlowoLMWBUm4PXlYPsDLY2Q8xpn3LTNPv7Cgj2AhP3nzaI5nkHDU0QCsMOIwOHy8d3U8ytDn53Hcqd9j6kW0GFL731Nhqk89XZEse2bhbWVWXz1GP7J6vyRcI0qHPn9EdslRmcwe51p-kHj95YxvQ3dJjgUoy8XkLI38cZEMxURdzjTLkiupdklJHdFx-taa2gjWkoylFgNxjhOR-3-2I45HdkZdxiHj1tHZkJ2v66WrdV3GmPRKCtXAUXPrULtv_ZOAEMgQ9hkQR4tkAMnvDMVO7BWyAcPGudtrdwmKOJfnKN1k3tmffCw5i2sIggLWp5KaViJt-SNcv7roeIL1F84Fj4KmxKeYYPwfki0zpkDj-ClA";

//   Future<List<dynamic>> fetchData() async {
//     final response = await http.get(
//       Uri.parse('https://staging.greatwisher.com/harshad_backup/api/branch-stock'),
//       headers: {
//         'Authorization': 'your_auth_token_here',
//         'Content-Type': 'application/json',
//       },
//     );

//     if (response.statusCode == 200) {
//       // If the call to the server was successful, parse the JSON
//       List<dynamic> jsonResponse = jsonDecode(response.body);
//       setState(() {
//         data = jsonResponse;
//       });
//       return jsonResponse;
//     } else {
//       // If that call was not successful, throw an error.
//       throw Exception('Failed to load data');
//     }
//   }

//   @override
//   void initState() {
//     fetchData();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView.builder(
//         itemCount: data.length,
//         itemBuilder: (BuildContext context, int index) {
//           return ListTile(
//             title: Text(data[index]['title']),
//             subtitle: Text(data[index]['subtitle']),
//           );
//         },
//       ),
//     );
//   }
// }
