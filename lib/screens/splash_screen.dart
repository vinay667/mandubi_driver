import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mandubi_driver/model/user_model.dart';
import 'package:mandubi_driver/screens/landing_screen.dart';

import 'login_screen.dart';


class SplashScreen extends StatefulWidget {
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.all(65),
          child: Center(
            child: Image.asset('images/splash_icon.png'),
          )
        ));
  }

  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => UserModel.accessToken==null?LoginScreen():LandingScreen())));

  }
}
