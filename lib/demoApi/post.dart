// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';
// import 'package:techstrock2/demoApi/listscreen.dart';

// class CreatePostScreen extends StatefulWidget {
//   @override
//   _CreatePostScreenState createState() => _CreatePostScreenState();
// }

// class _CreatePostScreenState extends State<CreatePostScreen> {
//   final TextEditingController _titleController = TextEditingController();
//   final TextEditingController _bodyController = TextEditingController();

//   bool _isLoading = false;
//   final Dio _dio = Dio();
//   List<dynamic> _posts = [];
//   final String _accessToken =
//       "4617fd9427d40cfa59b0144d0923fb0c244ad94af85bc7dc492e45f8514f4a50";

//   Future<void> _createPost() async {
//     // Define the request data.
//     Map<String, dynamic> postData = {
//       "title": _titleController.text,
//       "body": _bodyController.text,
//     };

//     // Set the headers for the request.

//     Map<String, dynamic> headers = {
//       "Authorization": "Bearer $_accessToken",
//       "Content-Type": "application/json"
//     };
//     setState(() {
//       _isLoading = true;
//     });

//     // try {
//     //   // Send the POST request using dio.post() method.

//     //   Response response = await _dio.post(
//     //       "https://gorest.co.in/public/v2/users/814/posts",
//     //       data: postData,
//     //       options: Options(headers: headers));

//     //   if (response.statusCode == 201) {
//     //     // The post was created successfully.
//     //     print(response.data);
//     //   } else {
//     //     // There was an error creating the post.
//     //     print(response.statusMessage);
//     //   }
//     // } catch (e) {
//     //   if (e is DioError) {
//     //     print(e.response?.data);
//     //   }
//     //   print(e.toString());
//     // }
//     try {
//     // Send the POST request using dio.post() method.
//     Response response = await _dio.post(
//         "https://gorest.co.in/public/v2/users/814/posts",
//         data: postData,
//         options: Options(headers: headers));

//     if (response.statusCode == 201) {
//       // The post was created successfully.
//       print(response.data);
//       // Fetch the posts.
//       Response postsResponse = await _dio.get(
//         "https://gorest.co.in/public/v2/users/814/posts",
//         options: Options(headers: headers),
//       );
//       if (postsResponse.statusCode == 200) {
//         setState(() {
//           _posts = postsResponse.data["data"];
//         });
//         // Navigate to the next screen.
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (_) => PostListScreen(posts: _posts, postsData: [], ),
//           ),
//         );
//       } else {
//         // There was an error fetching the posts.
//         print(postsResponse.statusMessage);
//       }
//     } else {
//       // There was an error creating the post.
//       print(response.statusMessage);
//     }
//   } catch (e) {
//     if (e is DioError) {
//       print(e.response?.data);
//     }
//     print(e.toString());
//   }

//     setState(() {
//       _isLoading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Create Post"),
//       ),
//       body: _isLoading
//           ? Center(
//               child: CircularProgressIndicator(),
//             )
//           : SingleChildScrollView(
//               padding: EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   TextField(
//                     controller: _titleController,
//                     decoration: InputDecoration(
//                       labelText: "Title",
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                   SizedBox(height: 16.0),
//                   TextField(
//                     controller: _bodyController,
//                     maxLines: null,
//                     keyboardType: TextInputType.multiline,
//                     decoration: InputDecoration(
//                       labelText: "Body",
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                   SizedBox(height: 16.0),
//                   ElevatedButton(
//                     onPressed: _createPost,
//                     child: Text("Create Post"),
//                   ),
//                 ],
//               ),
//             ),
//     );
//   }
// }
