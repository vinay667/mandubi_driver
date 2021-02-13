import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mandubi_driver/colors/colors.dart';
import 'package:mandubi_driver/widgets/circle_pinter.dart';
import 'package:mandubi_driver/widgets/toolbar_widget.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';


class RealTrackingScreen extends StatefulWidget {
  RealTrackingState createState() => RealTrackingState();
}

class RealTrackingState extends State<RealTrackingScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  backgroundColor: Colors.white,
  body: Column(

    children: <Widget>[

      ToolbarWidget('Real Time Tracking'),

      SizedBox(height: 50,),
      Expanded(
        child: Center(
          child:  CircularPercentIndicator(
            radius: 180.0,
            lineWidth: 9.0,
            animation: true,
            percent: 0.75,
            progressColor: Color.fromRGBO(234,106,49,1),

            center: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Text(
                  '60',
                  style: TextStyle(
                    fontSize: 40,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(234,106,49,1),),
                ),

                Text(
                  'Kilometers',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Roboto',
                      height: 0.5,
                      fontWeight: FontWeight.w500,
                      color: MyColor.themeColor.withOpacity(0.5)),
                ),

                SizedBox(height: 7,),
                Image.asset('images/log3.png', height: 35,width: 40,),



              ],
            ),


          ),
        ),
      ),

      SizedBox(height: 100),

    Expanded(
      child:   Container(
        margin: EdgeInsets.symmetric(horizontal: 45),
        child:   Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: <Widget>[

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[

                Container(
                  width: 47,
                  height: 47,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 1,color: MyColor.defaultTextColor.withOpacity(0.2)),
                      shape: BoxShape.circle),
                  child: Image.asset(
                      'images/date_ic.png'),
                ),


                SizedBox(height: 15),



                Text(
                  '07 Dec 2020',
                  style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w700,
                      color: MyColor.defaultTextColor),
                ),


                SizedBox(height: 20),

              ],
            ),


            Column(
              children: <Widget>[

                Container(
                  width: 47,
                  height: 47,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 1,color: MyColor.defaultTextColor.withOpacity(0.2)),
                      shape: BoxShape.circle),
                  child: Image.asset(
                      'images/clock_ic.png'),
                ),


                SizedBox(height: 15),



                Text(
                  'Time Travelled:',
                  style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w700,
                      color: MyColor.defaultTextColor),
                ),


                SizedBox(height: 4,),

                Row(
                  children: <Widget>[
                    Text(
                      '5',
                      style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w700,
                          color: MyColor.defaultTextColor),
                    ),

                    Text(
                      ' hrs',
                      style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w500,
                          color: MyColor.defaultTextColor.withOpacity(0.4)),
                    ),

                  ],
                )

              ],
            )



          ],
        ),
      ),
    ),








    ],
  ),

    );
  }





}
