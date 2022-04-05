import 'package:flutter_api_connect/network/apiservice.dart';
import 'package:get/get.dart';
import '../model/User.dart';

class UserController extends GetxController {
  var isLoading = true.obs;
  var users = <User>[].obs;

  @override
  void onInit() {
    fetchUser();
    super.onInit();
  }

  void fetchUser() async {
    try {
      isLoading(true);
      var user = await ApiService.fetchUserList();
      if (user != null) {
      users.assignAll(user);
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
