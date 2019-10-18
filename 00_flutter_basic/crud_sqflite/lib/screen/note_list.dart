import 'package:flutter/material.dart';
import '../model/mynote_model.dart';

class NoteList extends StatefulWidget {
  final List<MyNote> notedata;

  NoteList(this.notedata, {Key key}) : super(key: key);

  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:
                MediaQuery.of(context).orientation == Orientation.portrait
                    ? 2
                    : 3),
        itemCount: widget.notedata.length == null ? 0 : widget.notedata.length,
        itemBuilder: (BuildContext context, int i) {
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    padding: EdgeInsets.all(8),
                    width: double.infinity,
                    child: Text(
                      widget.notedata[i].title,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      width: double.infinity,
                      child: Text(widget.notedata[i].note,
                          style: TextStyle(fontSize: 14)),
                    ),
                  ),
                ),
                Divider(
                  color: Colors.grey,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text("Created : ${widget.notedata[i].createdAt}"),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text("Updated : ${widget.notedata[i].updatedAt}"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
