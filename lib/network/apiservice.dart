import 'dart:convert';

import 'package:flutter_api_connect/model/AlbumModel.dart';
import 'package:flutter_api_connect/model/PhotosModel.dart';
import 'package:flutter_api_connect/model/TotoModel.dart';
import 'package:flutter_api_connect/model/User.dart';
import 'package:flutter_api_connect/model/UserPostModel.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static var client = http.Client();

  // Fetch user
  static Future<List<User>> fetchUserList() async {
    var res = await client.get(Uri.parse(
        'https://run.mocky.io/v3/9cb9cfcb-4dd5-4f0c-b8c0-f60ab8f5ddf4'));
    if (res.statusCode == 200) {
      var jsonbody = json.decode(res.body);
      return userFromJson(json.encode(jsonbody['user']));
    } else {
      throw Exception('Failed to load user');
    }
  }

  // Fetch post
  static Future<List<UserPostModel>> fetchUserPost(String userId) async {
    var userPostUrl = await client.get(Uri.parse(
        'https://jsonplaceholder.typicode.com/posts?userId=' + userId));
    if (userPostUrl.statusCode == 200) {
      var postBody = userPostUrl.body;
      return userPostModelFromJson(postBody);
    } else {
      throw Exception('Failed to load user post');
    }
  }

  // Fetch todos
  static Future<List<TodoModel>> fetchUserTodo() async {
    var userTodoUrl = await client
        .get(Uri.parse('https://jsonplaceholder.typicode.com/todos?userId=1'));
    if (userTodoUrl.statusCode == 200) {
      var todosBody = userTodoUrl.body;
      return todoModelFromJson(todosBody);
    } else {
      throw Exception('Failed to load user post');
    }
  }

  // Fetch Photos
  static Future<List<PhotosModel>> fetchUserPhotos() async {
    var userPhotoUrl = await client
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos?userId=1'));
    if (userPhotoUrl.statusCode == 200) {
      var photosBody = userPhotoUrl.body;
      return photosModelFromJson(photosBody);
    } else {
      throw Exception('Failed to load user post');
    }
  }

  // Fetch albums
  static Future<List<AlbumModel>> fetchUserAlbum() async {
    var userAlbumUrl = await client
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums?userId=1'));
    if (userAlbumUrl.statusCode == 200) {
      var albumsBody = userAlbumUrl.body;
      return albumModelFromJson(albumsBody);
    } else {
      throw Exception('Failed to load user post');
    }
  }
}
