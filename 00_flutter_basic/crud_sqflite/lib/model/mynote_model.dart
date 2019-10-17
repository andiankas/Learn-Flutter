class MyNote {
  int id;
  String _title;
  String _note;
  String _createdAt;
  String _updatedAt;
  String _sortDate;

  MyNote(this._title, this._note, this._createdAt, this._updatedAt,
      this._sortDate);

  MyNote.map(dynamic obj) {
    this._title = obj['title'];
    this._note = obj['note'];
    this._createdAt = obj['createdAt'];
    this._updatedAt = obj['updatedAt'];
    this._sortDate = obj['sortDate'];
  }

  String get title => _title;
  String get note => _note;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;
  String get sortDate => _sortDate;

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['title'] = _title;
    map['note'] = _note;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['sortDate'] = _sortDate;

    return map;
  }

  void setNoteId(int id) {
    this.id = id;
  }
}
