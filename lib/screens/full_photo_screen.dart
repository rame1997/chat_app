import 'package:chat_app/constants/app_constants.dart';
import 'package:chat_app/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class FullPhotoScreen extends StatelessWidget {
  final String url;

  FullPhotoScreen({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.amber,
        title: Text(
          AppConstants.fullPhotoTitle,
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: PhotoView(
          imageProvider: NetworkImage(url),
        ),
      ),
    );
  }
}
