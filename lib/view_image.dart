import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  ImageView({Key? key, required this.imgUrl}) : super(key: key);

  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('ImageView'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.network(imgUrl),
      ),
    );
  }
}
