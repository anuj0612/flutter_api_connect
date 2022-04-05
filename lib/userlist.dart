import 'package:flutter/material.dart';
import 'package:flutter_api_connect/albums.dart';
import 'package:flutter_api_connect/controllers/user_controllers.dart';
import 'package:flutter_api_connect/photos.dart';
import 'package:flutter_api_connect/todos.dart';
import 'package:flutter_api_connect/user_post.dart';
import 'package:get/get.dart';
import 'dart:io' show Platform;

class UserListPage extends StatelessWidget {
  UserListPage({Key? key}) : super(key: key);

  var controller = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User list'),
      ),
      body: Obx(() => controller.isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: controller.users.length,
              itemBuilder: (context, index) => Card(
                    child: GestureDetector(
                        onTap: () {},
                        child: UserCell(
                            title: controller.users[index].name,
                            body: controller.users[index].username)),
                  ))),
    );
  }
}

class UserCell extends StatelessWidget {
  UserCell({Key? key, required this.title, required this.body})
      : super(key: key);
  final String title, body;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 120,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ' + title),
            const SizedBox(height: 10),
            Text('Username: ' + body),
            const SizedBox(height: 10),
            Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserPost(userId: 1)),
                        );
                      },
                      child: const Text(
                        'Posts ',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Todos()),
                        );
                      },
                      child: const Text(
                        'Todos ',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Photos()),
                        );
                      },
                      child: const Text(
                        'Photos ',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Albums()),
                        );
                      },
                      child: const Text(
                        'Album ',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
