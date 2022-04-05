import 'package:flutter/material.dart';
import 'package:flutter_api_connect/controllers/user_post_controller.dart';
import 'package:get/get.dart';

class UserPost extends StatelessWidget {
  UserPost({Key? key, required this.userId}) : super(key: key);
  final int userId;
  var userPost = Get.put(UserPostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: Obx(
        () => userPost.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: userPost.posts.length,
                itemBuilder: (context, index) => Card(
                  child: ListTile(
                    title: Text(userPost.posts[index].title),
                    subtitle: Text(userPost.posts[index].body),
                  ),
                ),
              ),
      ),
    );
  }
}
