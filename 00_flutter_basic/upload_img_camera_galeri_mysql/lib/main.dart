import 'package:flutter/material.dart';
import 'package:upload_img_camera_galeri_mysql/src/screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Upload img from camera and gallery with MYSQL",
      home: new Home(),
    );
  }
}
