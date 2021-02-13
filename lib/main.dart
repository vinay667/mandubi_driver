import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mandubi_driver/screens/splash_screen.dart';

import 'colors/colors.dart';
import 'model/user_model.dart';
import 'network/Utils.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  String token = await MyUtils.getSharedPreferences('access_token') ?? null;
  print(token);
  if(token!=null)
  {
    String userID = await MyUtils.getSharedPreferences('id');
    UserModel.setAccessToken(token);
    UserModel.setUserId(userID);
    print(userID);
  }
  else{
    UserModel.setAccessToken(null);
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
 /*   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: MyColor.themeColor
    ));*/
    return MaterialApp(
      title: 'Mandubi Driver',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:SplashScreen()
    );
  }
}

