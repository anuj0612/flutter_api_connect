import 'package:flutter/material.dart';
import 'package:flutter_api_connect/controllers/user_photos_controller.dart';
import 'package:flutter_api_connect/view_image.dart';
import 'package:get/get.dart';

class Photos extends StatelessWidget {
  Photos({Key? key}) : super(key: key);
  var userPhotos = Get.put(PhotosController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photos'),
      ),
      body: Obx(
        () => userPhotos.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: userPhotos.photos.length,
                itemBuilder: (context, index) => Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ImageView(imgUrl: userPhotos.photos[index].url)),
                      );
                    },
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        userPhotos.photos[index].thumbnailUrl,
                      ),
                    ),
                    title: Text(userPhotos.photos[index].title),
                  ),
                ),
              ),
      ),
    );
  }
}
