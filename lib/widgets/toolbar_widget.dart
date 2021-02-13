

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mandubi_driver/colors/colors.dart';

import 'language_widget.dart';

class ToolbarWidget extends StatelessWidget
{
  final String title;
  ToolbarWidget(this.title);
  @override
  Widget build(BuildContext context) {
   return Container(
     padding: EdgeInsets.only(left: 20,right: 20,top: 25),
     color: Colors.white,
     height: 90,

     child: Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: <Widget>[


         InkWell(
           onTap:(){
            Navigator.pop(context);
           },
           child:  Image.asset('images/back_ic.png',width: 25,height: 25,),
         ),





         Text(
           title,

           style: TextStyle(
               fontSize: 20,
               fontFamily: 'Lato',
               fontWeight: FontWeight.w700,
               color: MyColor.defaultTextColor),
         ),

         Padding(
           padding: EdgeInsets.only(bottom: 15),
           child: LanguageWidget(),
         )





       ],
     ),


   );
  }

}