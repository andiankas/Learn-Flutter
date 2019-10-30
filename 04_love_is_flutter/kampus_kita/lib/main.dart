import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kampus_kita/ui/screen/intro_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './ui/screen/splash_screen.dart';
import './constant/constans.dart';

import './ui/screen/sign_in.dart';
import './ui/screen/sign_up.dart';
import './ui/screen/root_screen.dart';
import './ui/screen/home_page.dart';
import './ui/screen/detail_kategori.dart';
import './ui/screen/detail_kampus.dart';

void main() {

  SharedPreferences.getInstance().then((prefs) {
    runApp(MyApp(prefs: prefs));
  });
}

class MyApp extends StatelessWidget {
  final SharedPreferences prefs;
  
  MyApp({this.prefs});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Kampus Kita",
      theme: ThemeData(primaryColor: Colors.pinkAccent),
      routes: <String, WidgetBuilder>{
        SPLASH_SCREEN: (BuildContext context) =>  SplashScreen(),
        SIGN_IN: (BuildContext context) =>  SignInPage(),
        SIGN_UP: (BuildContext context) =>  SignUpScreen(),
        INTRO: (BuildContext context) =>  IntroScreen(),

      },
      home: _handleCurrentScreen(),
    );
  }

  Widget _handleCurrentScreen() {
    bool seen = (prefs.getBool('seen') ?? false);
    if (seen) {
      return new SignInPage();
    } else {
      return new SplashScreen(prefs: prefs);
    }
  }
}
