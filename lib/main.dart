import 'package:flutter/material.dart';
import 'package:news_app_api/views/homepage.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: AnimatedSplashScreen(
        splash: Container(
          height: 400,
          width: 400,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "NEUZ",
                style:
                TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
              ),
              Text(
                "APP",
                style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
        nextScreen: HomePage(),
        splashTransition: SplashTransition.slideTransition,
      ),
    );
  }
}
