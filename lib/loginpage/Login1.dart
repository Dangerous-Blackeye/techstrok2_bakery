// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// import 'package:provider/provider.dart';
// import 'package:sizer/sizer.dart';

// import 'package:techstrock2/dashboard/dashboard.dart';
// import 'package:techstrock2/loginpage/dioservice.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final _formKey = GlobalKey<FormState>();
//   //final LoginService _loginService = LoginService();
//   final TextEditingController _password = TextEditingController(text: "");
//   final TextEditingController _phonenumber = TextEditingController(text: "");
//   bool visible = true;
//   String? _errorMessage;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Form(
//         key: _formKey,
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 94.h,
//                 width: double.infinity,
//                 child: Column(
//                   children: [
//                     Container(
//                       height: 40.h,
//                       width: double.infinity,
//                       decoration: const BoxDecoration(
//                         color: Color.fromARGB(255, 202, 229, 249),
//                         borderRadius: BorderRadius.only(
//                           bottomLeft: Radius.circular(50),
//                           bottomRight: Radius.circular(50),
//                         ),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.only(top: 30),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Lottie.asset('assets/login.json',
//                                 height: 250, width: 250),
//                           ],
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 6.h,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 15, right: 15),
//                       child: TextFormField(
//                         controller: _phonenumber,
//                         cursorColor: Colors.grey,
//                         decoration: InputDecoration(
//                           suffixIcon: const Padding(
//                             padding: EdgeInsets.only(right: 15),
//                             child: Icon(Icons.email, color: Colors.grey),
//                           ),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(30),
//                             borderSide: const BorderSide(
//                                 color: Color(0xffd7d7d7), width: 0.0),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(30),
//                             borderSide: const BorderSide(
//                                 color: Color(0xffd7d7d7), width: 0.0),
//                           ),
//                           filled: true,
//                           fillColor: const Color.fromARGB(247, 248, 250, 255),
//                           hintText: "Enter Your Email",
//                           contentPadding: const EdgeInsets.symmetric(
//                               vertical: 15.0, horizontal: 20.0),
//                         ),
//                         keyboardType: TextInputType.emailAddress,
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return "Can't be emty";
//                           } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
//                             return "Enter valid email";
//                           }
//                           return null;
//                         },
//                       ),
//                     ),
//                     SizedBox(
//                       height: 2.5.h,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 15, right: 15),
//                       child: TextFormField(
//                         controller: _password,
//                         cursorColor: Colors.grey,
//                         keyboardType: TextInputType.number,
//                         obscureText: visible,
//                         obscuringCharacter: '*',
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(30),
//                             borderSide: const BorderSide(
//                                 color: Color(0xffd7d7d7), width: 0.0),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(30),
//                             borderSide: const BorderSide(
//                                 color: Color(0xffd7d7d7), width: 0.0),
//                           ),
//                           filled: true,
//                           fillColor: const Color.fromARGB(247, 248, 250, 255),
//                           hintText: "Enter Password",
//                           contentPadding: const EdgeInsets.symmetric(
//                               vertical: 15.0, horizontal: 20.0),
//                           suffixIcon: Padding(
//                             padding: const EdgeInsets.only(right: 10),
//                             child: IconButton(
//                               splashRadius: 0.3,
//                               onPressed: () {
//                                 setState(
//                                   () {
//                                     visible = !visible;
//                                   },
//                                 );
//                               },
//                               icon: Icon(
//                                 visible
//                                     ? Icons.visibility_off
//                                     : Icons.visibility,
//                                 color: Colors.grey,
//                               ),
//                             ),
//                           ),
//                         ),
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return "Can't be emty";
//                           } else if (value.length != 6) {
//                             return "Enter 6 digit password";
//                           }
//                           return null;
//                         },
//                       ),
//                     ),
//                     SizedBox(
//                       height: 13.h,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 15, right: 15),
//                       child: SizedBox(
//                         height: 45,
//                         width: double.infinity,
//                         child: ElevatedButton(
//                           onPressed: () {
//                             if (_formKey.currentState!.validate()) {
//                               //  context.read<ApiCall>().login(context,
//                               // password: _password.text,
//                               // phoneNumber: _phonenumber.text);
//                               print("push");
//                             }
//                           },
//                           style: ElevatedButton.styleFrom(
//                             elevation: 0.0,
//                             backgroundColor: Color.fromARGB(255, 202, 229, 249),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                           ),
//                           child: const Text(
//                             'Login',
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.black54,
//                                 fontSize: 20),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 //  color: Colors.amber,
//                 height: 6.h,
//                 width: double.infinity,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: const [
//                         Text(
//                           "Made with",
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                         Icon(
//                           Icons.favorite_sharp,
//                           color: Colors.red,
//                         ),
//                         Text(
//                           "by Techstrock",
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         )
//                       ],
//                     ),
//                     const Text("Version 1.0.0"),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
