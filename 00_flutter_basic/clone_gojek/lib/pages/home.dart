import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            Container(
              height: 35,
              decoration: BoxDecoration(
                color: Colors.blue[900],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Image.asset("img/gopay.png", scale: 2.5),
                    Text("Rp. 117.000", style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
            Container(
              height: 90,
              decoration: BoxDecoration(
                color: Colors.blue[800],
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
              ),
              child: Container(
                padding: EdgeInsets.only(top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    HeaderItem(
                      images: "img/pay.png",
                      title: "Pay",
                    ),
                    HeaderItem(
                      images: "img/promo.png",
                      title: "Promo",
                    ),
                    HeaderItem(
                      images: "img/topup.png",
                      title: "Top Up",
                    ),
                    HeaderItem(
                      images: "img/more.png",
                      title: "More",
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                InkWell(
                  onTap: () {},
                  child: HeaderItem(
                    images: "img/goride.png",
                    title: "Go Ride",
                    textColor: Colors.black54,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: HeaderItem(
                    images: "img/gocar.png",
                    title: "Go Car",
                    textColor: Colors.black54,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: HeaderItem(
                    images: "img/gofood.png",
                    title: "Go Food",
                    textColor: Colors.black54,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: HeaderItem(
                    images: "img/gobluebird.png",
                    title: "Go BlueBird",
                    textColor: Colors.black54,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                InkWell(
                  onTap: () {},
                  child: HeaderItem(
                    images: "img/gosend.png",
                    title: "Go Send",
                    textColor: Colors.black54,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: HeaderItem(
                    images: "img/godeals.png",
                    title: "Go Deals",
                    textColor: Colors.black54,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: HeaderItem(
                    images: "img/gopulsa.png",
                    title: "Go Pulsa",
                    textColor: Colors.black54,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: HeaderItem(
                    images: "img/more-1.png",
                    title: "More",
                    textColor: Colors.black54,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30,),
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("img/banner01.png"),
                  fit: BoxFit.cover,
                ),
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text("Be worry-free on Pay Day!", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            ),
            Text("Because GoPay Pay Day is back with up to 60% CASHBACK in hundreds of participating merchants!"),
            Row(
              children: <Widget>[
                Spacer(),
                FlatButton(
                  child: Text("I'm in", style: TextStyle(color: Colors.white),),
                  color: Colors.green,
                  onPressed: (){},
                ),
              ],
            ),
            SizedBox(height: 20,),
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("img/banner01.png"),
                  fit: BoxFit.cover,
                ),
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text("Be worry-free on Pay Day!", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            ),
            Text("Because GoPay Pay Day is back with up to 60% CASHBACK in hundreds of participating merchants!"),
            Row(
              children: <Widget>[
                Spacer(),
                FlatButton(
                  child: Text("I'm in", style: TextStyle(color: Colors.white),),
                  color: Colors.green,
                  onPressed: (){},
                ),
              ],
            ),
            SizedBox(height: 20,),
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("img/banner01.png"),
                  fit: BoxFit.cover,
                ),
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text("Be worry-free on Pay Day!", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            ),
            Text("Because GoPay Pay Day is back with up to 60% CASHBACK in hundreds of participating merchants!"),
            Row(
              children: <Widget>[
                Spacer(),
                FlatButton(
                  child: Text("I'm in", style: TextStyle(color: Colors.white),),
                  color: Colors.green,
                  onPressed: (){},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HeaderItem extends StatelessWidget {
  const HeaderItem({Key key, this.images, this.title, this.textColor})
      : super(key: key);
  final String images;
  final String title;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      child: Column(
        children: <Widget>[
          Image.asset(
            images,
            scale: 2.5,
          ),
          SizedBox(
            height: 10,
          ),
          Text(title, style: TextStyle(color: textColor ?? Colors.white)),
        ],
      ),
    );
  }
}
