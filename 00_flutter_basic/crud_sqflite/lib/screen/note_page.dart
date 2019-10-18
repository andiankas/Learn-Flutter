import 'package:flutter/material.dart';
import '../db/dbhelper.dart';
import '../model/mynote_model.dart';

class NotePage extends StatefulWidget {
  final MyNote _mynote;
  final bool _isNew;

  NotePage(this._mynote, this._isNew);
  // NotePage({Key key}) : super(key: key);

  _NotePageState createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  
  String title;
  bool btnSave;
  bool btnEdit;
  bool btnDelete;
  MyNote myNote;
  final controllerTitle = TextEditingController();
  final controllerNote = TextEditingController();

  void _saveData(){
    if (widget._isNew) {
      addRecord();
    }else{
      updateRecord();
    }
    Navigator.of(context).pop();
  }

  var now = DateTime.now();
  bool _enabledTextField = true;

  Future addRecord() async {
    var db = DBHelper();
    String dateNow = "${now.day}-${now.month}-${now.year}, ${now.hour}:${now.minute}:${now.second}";
    var mynote = MyNote(controllerTitle.text, controllerNote.text, dateNow, dateNow, now.toString());
    await db.saveNote(mynote);
    print("saved");
  }

  Future updateRecord() async {
    
  }

  @override
  void initState() {
    super.initState();
    if (widget._mynote != null) {
      myNote = widget._mynote;
      controllerTitle.text = myNote.title;
      controllerNote.text = myNote.note;
      title = "My Note";

    }
  }
  
  @override
  Widget build(BuildContext context) {
    if (widget._isNew) {
      title = "New Note";
      btnSave = true;
      btnEdit = false;
      btnDelete = false;
    }else{
      btnSave = false;
      btnEdit = true;
      btnDelete = true;
      _enabledTextField = false;
    }

    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          title,
          style: TextStyle(color: Colors.white),
        )),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.close,
              color: Colors.white,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.grey[100],
      body: Column(
        
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 20),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CreateButton(
                icon: Icons.save,
                enable: btnSave,
                onpress: _saveData,
              ),
              CreateButton(
                icon: Icons.edit,
                enable: btnEdit,
                onpress: () {},
              ),
              CreateButton(
                icon: Icons.delete,
                enable: btnDelete,
                onpress: () {},
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
            child: TextFormField(
              enabled : _enabledTextField,
              controller: controllerTitle,
              decoration: InputDecoration(
                hintText: "Title",
                labelText: "Title",
                border: InputBorder.none
              ),
              style: TextStyle(fontSize: 20, color: Colors.grey[700]),
              maxLines: null,
              keyboardType: TextInputType.text
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: TextFormField(
              enabled : _enabledTextField,
              controller: controllerNote,
              decoration: InputDecoration(
                hintText: "...",
                labelText: "Note",
                border: InputBorder.none
              ),
              style: TextStyle(fontSize: 20, color: Colors.grey[700]),
              maxLines: null,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.newline,
            ),
          ),
        ],
      ),
    );
  }
}

class CreateButton extends StatelessWidget {
  // const CreateButton({Key key}) : super(key: key);
  final IconData icon;
  final bool enable;
  final onpress;
  CreateButton({this.icon, this.enable, this.onpress});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: enable ? Colors.blue : Colors.grey,
      ),
      child: IconButton(
        icon: Icon(icon),
        color: Colors.white,
        iconSize: 18,
        onPressed: () {
          if (enable) {
            onpress();
          }
        },
      ),
    );
  }
}
