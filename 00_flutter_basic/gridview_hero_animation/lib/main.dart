import 'package:flutter/material.dart';

void main() => runApp(
  new MaterialApp(
    title: "GridView Hero",
    home: new MyApp(),
  )
);

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  List<Container> daftarSuperHero = new List();

  var karakter = [
    {
      "nama"    : "Ironman",
      "gambar"  : "ironman.jpg"
    },
    {
      "nama"    : "Spiderman",
      "gambar"  : "spiderman.jpg"
    },
    {
      "nama"    : "Deadpool",
      "gambar"  : "deadpool.jpg"
    },
    {
      "nama"    : "Black Panther",
      "gambar"  : "blackpanther.jpg"
    },
    {
      "nama"    : "Black Widow",
      "gambar"  : "blackwidow.jpg"
    },
    {
      "nama"    : "Captain America",
      "gambar"  : "captain_america.jpg"
    },
    {
      "nama"    : "Daredevil",
      "gambar"  : "daredevil.jpg"
    },
    {
      "nama"    : "Dr Strange",
      "gambar"  : "drstrange.jpg"
    },
    {
      "nama"    : "Hawkeye",
      "gambar"  : "hawkeye.jpg"
    },
    {
      "nama"    : "Hulk",
      "gambar"  : "hulk.jpg"
    },
    {
      "nama"    : "Thor",
      "gambar"  : "thor.jpg"
    },
    {
      "nama"    : "Wolverine",
      "gambar"  : "wolverine.jpg"
    },
  ];

  _createList()async{
    for (var i = 0; i < karakter.length; i++) {
      final heroKarakter = karakter[i];
      final String imgHero = heroKarakter["gambar"];
      daftarSuperHero.add(
        new Container(
          padding: new EdgeInsets.all(10.0),
          child: new Card(
            child: new Column(
              children: <Widget>[

                new Hero(
                  tag: heroKarakter["nama"],
                  child: new Material(
                    child: new InkWell(
                      onTap: ()=> Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context)=> new Detail(nama: heroKarakter["nama"],gambar: imgHero),
                      )),
                      child: new Image.asset("img/$imgHero", fit: BoxFit.cover),
                    ),
                  ),
                ),

                
                new Padding(padding: new EdgeInsets.all(10.0)),
                new Text(heroKarakter["nama"], style: new TextStyle(fontSize: 20.0))
              ],
            ),
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    _createList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Super Hero",style: new TextStyle(color: Colors.white)),
      ),
      body: new GridView.count(
        crossAxisCount: 2,
        children: daftarSuperHero,
      ),
    );
  }
}

class Detail extends StatelessWidget {

  Detail({this.nama,this.gambar});
  final String nama;
  final String gambar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 240.0,
            child: new Hero(
              tag: nama,
              child: new Material(
                child: new InkWell(
                  child: new Image.asset("img/$gambar",fit: BoxFit.cover,),
                ),
              ),
            ),
          ),
          new BagianNama(nama: nama,),
          new BagianIcon(),
          new Keterangan(),

        ],
      ),
    );
  }
}

class BagianNama extends StatelessWidget {
  
  BagianNama({this.nama});
  final String nama;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(nama,style: new TextStyle(fontSize: 22.0,color: Colors.blue),),
                new Text("$nama\@gmail.com",style: new TextStyle(fontSize: 15.0,color: Colors.grey[600]),),
              ],
            ),
          ),
          new Row(
            children: <Widget>[
              new Icon(Icons.star,size: 50.0,color: Colors.yellow,),
              new Text("9,1", style: new TextStyle(fontSize: 18.0))
            ],
          )
        ],
      ),
    );
  }
}

class BagianIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.all(10.0),
      child: new Row(
        children: <Widget>[
          new Icontext(icon: Icons.call,text: "Call",),
          new Icontext(icon: Icons.message,text: "Message",),
          new Icontext(icon: Icons.photo,text: "Photo",),
        ],
      ),
    );
  }
}

class Icontext extends StatelessWidget {

  Icontext({this.icon,this.text});
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          new Icon(icon, size: 50.0, color: Colors.blue,),
          new Text(text,style: new TextStyle(fontSize: 18.0,color:Colors.blue))
        ],
      ),
    );
  }
}

class Keterangan extends StatelessWidget {

  final String text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.all(10.0),
      child: new Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: new Text(text, style: new TextStyle(fontSize: 18.0),textAlign: TextAlign.justify,),
        ),
      ),
    );
  }
}