import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mandubi_driver/colors/colors.dart';
import 'package:mandubi_driver/widgets/toolbar_widget.dart';

class DriverEarningsScreen extends StatefulWidget {
  DriverEarningsState createState() => DriverEarningsState();
}

class DriverEarningsState extends State<DriverEarningsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          ToolbarWidget('Driver Earnings'),
          Container(
            width: double.infinity,
            height: 1,
            color: Color.fromRGBO(0, 0, 0, 0.07),
          ),
          Container(
            width: double.infinity,
            height: 70,
            color: MyColor.dashBoardBgColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Image.asset('images/cap_ic.png', width: 20, height: 20),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Ride ID',
                      style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w700,
                          color: MyColor.defaultTextColor),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Image.asset('images/calender_ic.png',
                        width: 20, height: 20),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Date',
                      style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w700,
                          color: MyColor.defaultTextColor),
                    ),
                  ],
                ),
               // / SizedBox(width: 5),
                Row(
                  children: <Widget>[
                    Image.asset('images/amount_ic.png',
                        width: 20, height: 20),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Amount',
                      style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w700,
                          color: MyColor.defaultTextColor),
                    ),
                  ],
                ),

              ],
            ),
          ),


          Expanded(
            child: ListView.builder(
                itemCount: 8,
                padding: EdgeInsets.zero,
                itemBuilder: (BuildContext context,int pos)
            {
              return  Container(
                  width: double.infinity,
                  color: Colors.white,
                  child:Column(
                    children: <Widget>[

                      SizedBox(height: 25,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            '#ORD001',
                            style: TextStyle(
                                fontSize: 17,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(247, 85, 4, 1)),
                          ),


                          Text(
                            '01 Dec 2020    ',
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w600,
                                color: MyColor.defaultTextColor),
                          ),
                          Center(
                            child: Text(
                              '\$10',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w900,
                                  color: MyColor.defaultTextColor),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 23,),
                      Container(
                        width: double.infinity,
                        height: 1,
                        color: Color.fromRGBO(0, 0, 0, 0.07),
                      ),


                    ],
                  )
              );
            }

            ),
          )




        ],
      ),
    );
  }
}
