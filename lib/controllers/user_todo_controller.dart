import 'package:flutter_api_connect/model/TotoModel.dart';
import 'package:flutter_api_connect/network/apiservice.dart';
import 'package:get/get.dart';

class TodoController extends GetxController{
  var isLoading = true.obs;
  var todos = <TodoModel>[].obs;

  @override
  void onInit() {
    fetchUserTodo();
    super.onInit();
  }

  void fetchUserTodo() async {
    try {
      isLoading(true);
      var todo = await ApiService.fetchUserTodo();
      if (todo != null) {
        todos.assignAll(todo);
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