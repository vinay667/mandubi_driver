

import 'package:flutter/cupertino.dart';
import 'package:mandubi_driver/colors/colors.dart';

class LanguageWidget extends StatelessWidget
{

  @override
  Widget build(BuildContext context) {
   return Container(
       transform: Matrix4.translationValues(10.0, 0.0, 0.0),
       width: 42,
       height: 42,
       margin: EdgeInsets.only(top: 10,right: 10),
       decoration: BoxDecoration(
           color: Color.fromRGBO(242, 242, 242, 1),
           shape: BoxShape.circle),
       child: Center(
         child: Text(
           'En',
           style: TextStyle(
               fontSize: 15,
               fontFamily: 'Lato',
               fontWeight: FontWeight.w600,
               color: MyColor.defaultTextColor),
         ),
       ));
  }

}