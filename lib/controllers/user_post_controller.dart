import 'package:flutter_api_connect/model/UserPostModel.dart';
import 'package:flutter_api_connect/network/apiservice.dart';
import 'package:flutter_api_connect/user_post.dart' as UserPost;
import 'package:get/get.dart';

class UserPostController extends GetxController {
  var isLoading = true.obs;
  var posts = <UserPostModel>[].obs;

  @override
  void onInit() {
   // UserPost.
    fetchUserPost();
    super.onInit();
  }

  void fetchUserPost() async {
    try{
      isLoading(true);
      var post = await ApiService.fetchUserPost('1');
      if(posts != null){
        print(posts);
        posts.assignAll(post);
        isLoading(false);
      }
    }catch (e, stackTrace) {
      print(e);
      print(stackTrace);
    } finally {
      isLoading(false);
    }

  }
}