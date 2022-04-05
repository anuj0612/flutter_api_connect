import 'package:flutter/material.dart';
import 'package:flutter_api_connect/controllers/user_todo_controller.dart';
import 'package:get/get.dart';

class Todos extends StatelessWidget {
   Todos({Key? key}) : super(key: key);
  var userTodo = Get.put(TodoController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
      ),
      body: Obx(
            () => userTodo.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
          itemCount: userTodo.todos.length,
          itemBuilder: (context, index) => Card(
            child: ListTile(
              title: Text(userTodo.todos[index].title),
              //subtitle: Text(userTodo.todos[index].completed),
            ),
          ),
        ),
      ),
    );
  }
}
