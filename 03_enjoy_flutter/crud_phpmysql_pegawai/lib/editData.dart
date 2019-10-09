import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'detail.dart';
import 'main.dart';
import 'package:crud_phpmysql_pegawai/editData.dart';

class EditData extends StatefulWidget {
  
  final List list;
  final int index;
  EditData({this.list,this.index});

  @override
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}