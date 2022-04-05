import 'package:flutter/material.dart';
import 'package:flutter_api_connect/controllers/user_album_controller.dart';
import 'package:get/get.dart';

class Albums extends StatelessWidget {
  Albums({Key? key}) : super(key: key);
  var userAlbum = Get.put(AlbumController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Albums'),
      ),
      body: Obx(
            () => userAlbum.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
          itemCount: userAlbum.albums.length,
          itemBuilder: (context, index) => Card(
            child: ListTile(
              title: Text(userAlbum.albums[index].title),
            ),
          ),
        ),
      ),
    );
  }
}
