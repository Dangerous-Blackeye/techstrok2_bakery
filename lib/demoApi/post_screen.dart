import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techstrock2/demoApi/listscreen_delete.dart';

class PostScreen1 extends StatefulWidget {
  @override
  _PostScreen1State createState() => _PostScreen1State();
}

class _PostScreen1State extends State<PostScreen1> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  final Dio _dio = Dio();
  final String _accessToken =
      "4617fd9427d40cfa59b0144d0923fb0c244ad94af85bc7dc492e45f8514f4a50";

  List<dynamic> _postsData = [];

  Future<void> _createPost() async {
    // Define the request data.
    Map<String, dynamic> postData = {
      "title": _titleController.text,
      "body": _bodyController.text,
    };

    // Set the headers for the request.
    Map<String, dynamic> headers = {
      "Authorization": "Bearer $_accessToken",
      "Content-Type": "application/json"
    };

    setState(() {
      _isLoading = true;
    });

    try {
      // Send the POST request using dio.post() method.
      Response response = await _dio.post(
          "https://gorest.co.in/public/v2/users/905/posts",
          data: postData,
          options: Options(headers: headers));

      if (response.statusCode == 201) {
        // The post was created successfully.
        print(response.data);
        setState(() {
          _postsData.insert(0, response.data);
        });
        // Save the updated list to shared preferences.
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('postsData', json.encode(_postsData));

        // Navigate to the PostListScreen with the updated list.
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PostListScreen(
              postsData: _postsData,
              posts: const [],
            ),
          ),
        ).then((value) {
          //This makes sure the textfield is cleared after page is pushed.
          _bodyController.clear();
          _titleController.clear();
        });
      } else {
        // There was an error creating the post.
        print(response.statusMessage);
      }
    } catch (e) {
      if (e is DioError) {
        print(e.response?.data);
      }
      print(e.toString());
    }
    setState(() {
      _isLoading = false;
    });
  }

  void _deletePost(int index) async {
    // Remove the post from the list.
    setState(() {
      _postsData.removeAt(index);
    });
    // Save the updated list to shared preferences.
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('postsData', json.encode(_postsData));

    try {
      // Send the DELETE request using dio.delete() method.
      Response response = await _dio.delete(
          "https://gorest.co.in/public/v2/posts/${_postsData[index]['id']}",
          // users/814
          options: Options(headers: {"Authorization": "Bearer $_accessToken"}));

      if (response.statusCode != 204) {
        // There was an error deleting the post.
        print(response.statusMessage);
      }
    } catch (e) {
      if (e is DioError) {
        print(e.response?.data);
      }
      print(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    _loadPostsData();
  }

  Future<void> _loadPostsData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? postsDataJson = prefs.getString('postsData');
    if (postsDataJson != null) {
      setState(() {
        _postsData = json.decode(postsDataJson);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Post"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PostListScreen(
                        postsData: [],
                        posts: [],
                      ),
                    ));
              },
              icon: Icon(Icons.shopping_cart))
        ],
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: _titleController,
                    decoration: const InputDecoration(
                      labelText: "Product Name",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Can't be emty";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: _bodyController,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                      labelText: "Catergory",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Can't be emty";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _createPost();
                      }
                      return null;
                    },
                    child: const Text("Add Product"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
