import 'package:flutter_api_connect/model/AlbumModel.dart';
import 'package:flutter_api_connect/model/PhotosModel.dart';
import 'package:flutter_api_connect/network/apiservice.dart';
import 'package:get/get.dart';

class PhotosController extends GetxController {
  var isLoading = true.obs;
  var photos = <PhotosModel>[].obs;

  @override
  void onInit() {
   fetchUserPhotos();
    super.onInit();
  }

  void fetchUserPhotos() async {
    try {
      isLoading(true);
      var photo = await ApiService.fetchUserPhotos();
      if (photo != null) {
        photos.assignAll(photo);
        isLoading(false);
      }
    } catch (e, stackTrace) {
      print(e);
      print(stackTrace);
    } finally {
      isLoading(false);
    }
  }
}