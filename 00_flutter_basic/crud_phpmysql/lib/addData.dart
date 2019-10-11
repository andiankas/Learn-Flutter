import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {

  TextEditingController controllerCode = new TextEditingController();
  TextEditingController controllerName = new TextEditingController();
  TextEditingController controllerPrice = new TextEditingController();
  TextEditingController controllerStock = new TextEditingController();

  // send data to api
  void addData(){
    var url="http://192.168.43.35/xdev/xlearn/flutter_mystore/addData.php";
    http.post(url,body:{
      "itemcode" : controllerCode.text,
      "itemname" : controllerName.text,
      "price" : controllerPrice.text,
      "stock" : controllerStock.text
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Add Data"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                TextField(
                  controller: controllerCode,
                  decoration: InputDecoration(
                    hintText: "Item Kode",
                    labelText: "Item Kode",
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                Padding(padding: const EdgeInsets.only(top: 15.0),),
                TextField(
                  controller: controllerName,
                  decoration: InputDecoration(
                    hintText: "Item Name",
                    labelText: "Item Name",
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                Padding(padding: const EdgeInsets.only(top: 15.0),),
                TextField(
                  controller: controllerPrice,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Harga",
                    labelText: "Harga",
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                Padding(padding: const EdgeInsets.only(top: 15.0),),
                TextField(
                  controller: controllerStock,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Stok",
                    labelText: "Stok",
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                Padding(padding: const EdgeInsets.only(top: 15.0),),
                RaisedButton(
                  child: Text("Save", style: TextStyle(color: Colors.white),),
                  color: Colors.blue,
                  onPressed: (){
                    addData();
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}