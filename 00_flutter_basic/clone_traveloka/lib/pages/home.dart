import 'package:flutter/foundation.dart';
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
      appBar: AppBar(
        title: Text("Traveloka"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Profile(),
          Divider(), // Divider like hr on html - membuat garis pembatas
          MenuUtama(),
          MenuTambahan(),
          Promo(),
        ],
      ),
    );
  }
}

class Profile extends StatelessWidget {
  const Profile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage("images/joker.jpg")),
          ),
        ),
        title: Text(
          "John Doe Ferguso",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Row(
          children: <Widget>[
            RaisedButton.icon(
              icon: Icon(Icons.album),
              label: Text("0 poin"),
              color: Colors.grey[200],
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              onPressed: () {},
            ),
            Padding(padding: EdgeInsets.all(8)),
            RaisedButton(
              child: Text("Traveloka Pay"),
              color: Colors.grey[200],
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class MenuUtama extends StatelessWidget {
  const MenuUtama({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 4,
      children: menuUtamaItem,
    );
  }
}

List<MenuUtamaItem> menuUtamaItem = [
  MenuUtamaItem(
    title: "Tiket Pesawat",
    icon: Icons.flag,
    colorBox: Colors.blue,
    iconColor: Colors.white,
  ),
  MenuUtamaItem(
    title: "Hotel",
    icon: Icons.hotel,
    colorBox: Colors.blue,
    iconColor: Colors.white,
  ),
  MenuUtamaItem(
    title: "Pesawat + Hotel",
    icon: Icons.flight_land,
    colorBox: Colors.blue,
    iconColor: Colors.white,
  ),
  MenuUtamaItem(
    title: "Aktifitas & Rekreasi",
    icon: Icons.local_play,
    colorBox: Colors.blue,
    iconColor: Colors.white,
  ),
  MenuUtamaItem(
    title: "Tiket Kereta Api",
    icon: Icons.train,
    colorBox: Colors.blue,
    iconColor: Colors.white,
  ),
  MenuUtamaItem(
    title: "Kuliner",
    icon: Icons.local_dining,
    colorBox: Colors.blue,
    iconColor: Colors.white,
  ),
  MenuUtamaItem(
    title: "Transportasi & Bandara",
    icon: Icons.local_taxi,
    colorBox: Colors.blue,
    iconColor: Colors.white,
  ),
  MenuUtamaItem(
    title: "Produk Lainnya",
    icon: Icons.blur_on,
    colorBox: Colors.blue,
    iconColor: Colors.white,
  ),
];

class MenuUtamaItem extends StatelessWidget {
  const MenuUtamaItem(
      {Key key, this.title, this.icon, this.colorBox, this.iconColor})
      : super(key: key);
  final String title;
  final IconData icon;
  final Color colorBox, iconColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(bottom: 2),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: colorBox,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8),
          ),
          Text(
            title,
            style: TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class MenuTambahan extends StatelessWidget {
  const MenuTambahan({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: menuTambahan,
      ),
    );
  }
}

List<MenuTambahanItem> menuTambahan = [
  MenuTambahanItem(
    title: "Tagihan & Isi Ulang",
    icon: Icons.receipt,
  ),
  MenuTambahanItem(
    title: "Bioskop",
    icon: Icons.movie,
  ),
  MenuTambahanItem(
    title: "Pay Later",
    icon: Icons.payment,
  ),
  MenuTambahanItem(
    title: "Status Penerbangan",
    icon: Icons.airplanemode_active,
  ),
  MenuTambahanItem(
    title: "Pulsa & Internet",
    icon: Icons.signal_cellular_connected_no_internet_4_bar,
  ),
  MenuTambahanItem(
    title: "Online Check-in",
    icon: Icons.airplanemode_inactive,
  ),
  MenuTambahanItem(title: "Notifikasi Harga", icon: Icons.notifications),
];

class MenuTambahanItem extends StatelessWidget {
  const MenuTambahanItem({Key key, this.title, this.icon}) : super(key: key);
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: <Widget>[
          Icon(icon),
          Text(title, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

class Promo extends StatelessWidget {
  const Promo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text("Promo Saat Ini",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22)),
          trailing: IconButton(
            icon: Icon(Icons.keyboard_arrow_right),
            onPressed: () {},
          ),
        ),
        Container(
          width: double.infinity,
          height: 150,
          padding: EdgeInsets.only(left: 8),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.blue,
                      Colors.blue[800],
                    ],
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Text("%",
                        style: TextStyle(color: Colors.white, fontSize: 24)),
                    Text("Lihat Semua \nPromo",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
