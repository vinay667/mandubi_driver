

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardWidget extends StatelessWidget
{
  final Color bgColor,curveColor;
  final InkWell child;

  DashboardWidget({this.bgColor,this.curveColor,this.child});
  @override
  Widget build(BuildContext context) {
   return   Expanded(
     child:    Stack(
       children: <Widget>[

         Card(
           color: bgColor,
           elevation: 4,
           margin: EdgeInsets.zero,
           shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(30)
           ),
           child:  Container(
             // margin: EdgeInsets.only(left: 20),
             height: 170,
           ),





         ),



         Container(
           height: 115,
           margin: EdgeInsets.only(right: 25),
           decoration: BoxDecoration(
             borderRadius: BorderRadius.only(topLeft: Radius.circular(30),bottomRight: Radius.elliptical(250, 200)),
             color: curveColor,
           ),



         ),

         Container(
           height: 170,

           child:child ,


         )




       ],
     ),
     flex: 1,
   );
  }

}