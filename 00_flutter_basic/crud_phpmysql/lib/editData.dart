import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'home.dart';

class EditData extends StatefulWidget {

  final List list;
  final int index;
  EditData({this.list,this.index});

  @override
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {

  

  // controller
  TextEditingController controllerCode;
  TextEditingController controllerName;
  TextEditingController controllerPrice;
  TextEditingController controllerStock;

  void editData(){
    var url = "http://192.168.1.146/xdev/xlearn/flutter_mystore/editData.php";
    http.post(url,body: {
      "id" : widget.list[widget.index]['id'],
      "itemcode" : controllerCode.text,
      "itemname" : controllerName.text,
      "price" : controllerPrice.text,
      "stock" : controllerStock.text
    });

  }

  @override
  void initState() {
    controllerCode = new TextEditingController(text: widget.list[widget.index]['item_code']);
    controllerName = new TextEditingController(text: widget.list[widget.index]['item_name']);
    controllerPrice = new TextEditingController(text: widget.list[widget.index]['price']);
    controllerStock = new TextEditingController(text: widget.list[widget.index]['stock']);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Edit Data "),
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
                  child: Text("Update", style: TextStyle(color: Colors.white),),
                  color: Colors.blue,
                  onPressed: (){
                    editData();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => Home()
                      )
                    );
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