import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:async/async.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image/image.dart' as Img;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  File _image;
  TextEditingController cTitle = new TextEditingController();

  Future getImageGallery() async {
    var imageFile  = await ImagePicker.pickImage(source: ImageSource.gallery);

    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path; 

    String title = cTitle.text;
    Img.Image image = Img.decodeImage(imageFile.readAsBytesSync());
    Img.Image smallerImg = Img.copyResize(image, width: 224, height: 224);

    var compressImg = new File("$path/image_$title.jpg")
    ..writeAsBytesSync(Img.encodeJpg(smallerImg, quality: 85));

    setState(() {
      _image = compressImg;
    });
  }

  Future getImageCamera() async  {
    var imageFile = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = imageFile;
    });
  }

  Future upload(File imageFile) async {
    //  menangkap gambarnya
    var stream = new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    var length = await imageFile.length(); 
    var uri = Uri.parse("http://192.168.1.146/xdev/xlearn/flutter_img_camera_gallery/upload.php");

    var request = new http.MultipartRequest("POST", uri);

    var multipartFile = new http.MultipartFile("image", stream, length, filename: basename(imageFile.path));
    request.fields['title'] = cTitle.text;
    request.files.add(multipartFile);

    var response = await request.send();

    if (response.statusCode == 200) {
      print("IMG Uploaded");
    }else{
      print("Upload FAILED!");
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
          TextField(
            controller: cTitle,
            decoration: new InputDecoration(
              hintText: "name",
              labelText: "Name"
            ),
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