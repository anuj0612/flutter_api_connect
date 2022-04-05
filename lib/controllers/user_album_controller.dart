import 'package:flutter_api_connect/model/AlbumModel.dart';
import 'package:flutter_api_connect/network/apiservice.dart';
import 'package:get/get.dart';

class AlbumController extends GetxController {
  var isLoading = true.obs;
  var albums = <AlbumModel>[].obs;

  @override
  void onInit() {
    fetchUserAlbum();
    super.onInit();
  }

  void fetchUserAlbum() async {
    try {
      isLoading(true);
      var album = await ApiService.fetchUserAlbum();
      if (album != null) {
        albums.assignAll(album);
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
