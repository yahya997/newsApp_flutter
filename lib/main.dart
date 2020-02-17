import 'package:flutter/material.dart';
import 'package:news_application/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/OnBoarding.dart';

main() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool seen = prefs.getBool( 'seen' );
  Widget _screen;
  if( seen == null || seen == false ){
    _screen = OnBoarding();
  }else{
    _screen = HomeScreen();
  }
  runApp( NewsApp(_screen));
}

class NewsApp extends StatelessWidget {

  Widget _screen;

  NewsApp(this._screen);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: this._screen,
    );
  }
}