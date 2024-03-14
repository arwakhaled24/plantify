import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class PreviewPage extends StatelessWidget {
  const PreviewPage({Key? key, required this.picture}) : super(key: key);
  static String routeName = 'PreviewPage';
  final XFile picture;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: FileImage(File(picture.path)),fit: BoxFit.cover),
          ),
        ),
        Center(
          child:Image.asset("assets/images/preview.png"),
        )
      ],
    );
  }
}
