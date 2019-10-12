import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  File _image;

  Future getImageGallery() async  {
    var imageFile  = await ImagePicker.pickImage(source: ImageSource.gallery);
    
    setState(() {
      _image = imageFile;
    });
  }

  Future getImageCamera() async  {
    var imageFile = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = imageFile;
    });
  }

  Future upload(File imageFile) async  {
    //  menangkap gambarnya
    var stream = new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    var length = await imageFile.length();
    var uri = Uri.parse("http://192.168.43.35/xdev/xlearn/flutter_img_camera_gallery/upload.php");

    var request = new http.MultipartRequest("POST", uri);

    var multipartFile = new http.MultipartFile("image", stream, length, filename: basename(imageFile.path));

    request.files.add(multipartFile);

    var response = await request.send();

    if (response.statusCode == 200) {
      print("img upload");
    }else{
      print("upload failed");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text("Upload Image"),
        backgroundColor: Colors.grey[850],
      ),
      body: 
      Column(
        children: <Widget>[
          Center(
            // cek, if img null, maka tampilkan text 'no img selected'. else, inisiasi img file ke vafiable _image
            child: _image == null 
            ? new Text("No Img Selected") 
            : new Image.file( _image ), 
          ),
         
          Row(
            children: <Widget>[
              RaisedButton(
                child: Icon(Icons.image),
                onPressed: getImageGallery,
              ),
              Padding(padding: const EdgeInsets.all(10.0),),
              RaisedButton(
                child: Icon(Icons.camera_alt),
                onPressed: getImageCamera,
              ),
              Padding(padding: const EdgeInsets.all(10.0),),
              Expanded(child: Container() ),
              RaisedButton(
                child: Text("Upload"),
                onPressed: (){
                  upload( _image );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}