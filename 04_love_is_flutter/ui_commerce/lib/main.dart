import 'package:flutter/material.dart';
import 'productCard.dart';
import 'package:carousel_pro/carousel_pro.dart';

void main() => runApp(
  MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  )
);

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  
  List<Widget> bottomNavIconList = [
    Image.asset(
      "assets/img/toko.png",
      width: 25,
      height: 25,
    ),
    Icon(
      Icons.search,
      size: 25,
    ),
    Icon(
      Icons.favorite,
      size: 25,
    ),
    Icon(Icons.table_chart,size: 32,),
    Image.asset(
      "assets/img/putra.png",
      height: 25,
      width: 25,
    ),
  ];
  
  @override
  Widget build(BuildContext context) {
    
    Widget imageSlider = Container(
      height: 300,
      child: Card(
        child: Carousel(
          boxFit: BoxFit.cover,
          images: [
            AssetImage("assets/img/baju-batik-1.jpg"),
            AssetImage("assets/img/baju-batik-pria.jpg"),
            AssetImage("assets/img/baju-koko.jpg"),
            AssetImage("assets/img/baju-muslim-wanita.jpg"),
            AssetImage("assets/img/sepatu-01.jpg"),
          ],
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          // image slider merupakan method untuk menampilkan slider image
          imageSlider,
          Divider(),
          // SingleChildScrollView merupakan atribute untuk memberikan scroll pada body
          SingleChildScrollView(
            scrollDirection: Axis.horizontal, // horizontal = kiri-kanan, vertical = atas-bawah
            // row atribute untuk menampilkan data atau widget horizontal atau kiri kanan
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(padding: EdgeInsets.all(8),
                  child: Card(
                    shape: RoundedRectangleBorder( // berfungsi memberi radius border
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: Colors.transparent,
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            "assets/img/baju-pria.jpg",
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          Divider(),
                          Text(
                            "Jaket D & F",
                            style: TextStyle(
                              color: Colors.purple,
                              fontSize: 16
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: Colors.transparent,
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            "assets/img/baju-muslim-wanita-1.jpg",
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          Divider(),
                          Text(
                            "Muslim Wanita",
                            style: TextStyle(
                              color: Colors.purple,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    color: Colors.transparent,
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            "assets/img/sepatu-01.jpg",
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          Divider(),
                          Text(
                            "Sepatu",
                            style: TextStyle(
                              color: Colors.purple,
                              fontSize: 16
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    color: Colors.transparent,
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            "assets/img/sepatu-01.jpg",
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          Divider(),
                          Text(
                            "Sepatu",
                            style: TextStyle(
                              color: Colors.purple,
                              fontSize: 16
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    color: Colors.transparent,
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            "assets/img/sepatu-01.jpg",
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          Divider(),
                          Text(
                            "Sepatu",
                            style: TextStyle(
                              color: Colors.purple,
                              fontSize: 16
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 50,vertical: 50),
              child: Column(
                children: <Widget>[
                  ProductCard(
                    0xFFfaecfb,
                    "assets/img/bajukoko.jpg",
                    "Baju Koko",
                    "Rp. 110.000",
                    "Rp. 200.000",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.065),
              offset: Offset(0.0, -3.0),
              blurRadius: 10
            ),
          ]
        ),
        child: Row(
          children: bottomNavIconList.map((item){
            var index = bottomNavIconList.indexOf(item);
            return Expanded(
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    _currentIndex = index;
                  });
                },
                child: bottomNavItem(item,index == _currentIndex),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

bottomNavItem(Widget item,bool isSelected) => Container(
  decoration: BoxDecoration(
    boxShadow: isSelected ? [
      BoxShadow(
        color: Colors.black12.withOpacity(0.02),
        offset: Offset(0.0, 5.0),
        blurRadius: 10
      )
    ]
    : []
  ),
  child: item,
);