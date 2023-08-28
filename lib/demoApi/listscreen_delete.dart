import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PostListScreen extends StatefulWidget {
  final List<dynamic> postsData;

  PostListScreen({
    Key? key,
    required this.postsData,
    required List posts,
  }) : super(key: key);

  @override
  State<PostListScreen> createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {
  final Dio _dio = Dio();
  final String _accessToken =
      "4617fd9427d40cfa59b0144d0923fb0c244ad94af85bc7dc492e45f8514f4";

  void _deletePost(int index) async {
    setState(() {
      widget.postsData.removeAt(index);
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('postsData', json.encode(widget.postsData));

    try {
      Response response = await _dio.delete(
          "https://gorest.co.in/public/v2/posts/${widget.postsData[index]['id']}",
          options: Options(headers: {"Authorization": "Bearer $_accessToken"}));

      if (response.statusCode != 204) {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Selected Product"),
      ),
      body: widget.postsData.isEmpty
          ? Center(
              child: Text("Add Product"),
            )
          : ListView.builder(
              itemCount: widget.postsData.length,
              itemBuilder: (BuildContext context, int index) {
                final post = widget.postsData[index];
                return Card(
                  child: ListTile(
                    //   leading: Text(widget.quantity.toString()),
                    title: Text(post['title']),
                    subtitle: Text(post['body']),
                    trailing: IconButton(
                      onPressed: () {
                        _deletePost(index);
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
