import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mandubi_driver/colors/colors.dart';
import 'package:mandubi_driver/screens/distance_travveled_screen.dart';
import 'package:mandubi_driver/screens/driver_earnings_screen.dart';
import 'package:mandubi_driver/screens/manage_bank_screen.dart';
import 'package:mandubi_driver/screens/my_orders_screen.dart';
import 'package:mandubi_driver/screens/real_time_tracking_screen.dart';
import 'package:mandubi_driver/screens/track_order_screen.dart';
import 'package:mandubi_driver/screens/wallet_screen.dart';
import 'package:mandubi_driver/widgets/dashboard_widget.dart';
import 'package:mandubi_driver/widgets/language_widget.dart';
import 'package:mandubi_driver/widgets/menu_page.dart';
import 'package:mandubi_driver/widgets/zoom_scaffold.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class DriverDashboardScreen extends StatefulWidget {
  DriverDashboardState createState() => DriverDashboardState();
}

class DriverDashboardState extends State<DriverDashboardScreen>
    with TickerProviderStateMixin {
  MenuController menuController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: MyColor.dashBoardBgColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: <Widget>[
                DashboardWidget(
                    bgColor: Color.fromRGBO(255, 227, 214, 1),
                    curveColor: Color.fromRGBO(255, 219, 204, 1),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyOrdersScreen()));
                      },
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(left: 20, top: 30),
                                  child: Image.asset(
                                    'images/orders_ic.png',
                                    width: 47,
                                    height: 53,
                                  ),
                                ),
                                Padding(
                                    padding:
                                        EdgeInsets.only(right: 15, top: 25),
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          '18',
                                          style: TextStyle(
                                              fontSize: 32,
                                              fontFamily: 'Lato',
                                              fontWeight: FontWeight.w900,
                                              color: Color.fromRGBO(
                                                  239, 122, 70, 1)),
                                        ),
                                        Text(
                                          'New Order',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w500,
                                              color: Color.fromRGBO(
                                                  239, 122, 70, 0.8)),
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                            SizedBox(height: 27),
                            Text(
                              'Manage Orders',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w700,
                                  color: MyColor.defaultTextColor),
                            ),
                          ],
                        ),
                      ),
                    )),
                SizedBox(width: 18),
                DashboardWidget(
                    bgColor: Color.fromRGBO(231, 227, 255, 1),
                    curveColor: Color.fromRGBO(224, 220, 255, 1),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TrackOrderScreen()));
                      },
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(left: 20, top: 30),
                                  child: Image.asset(
                                    'images/status_ic.png',
                                    width: 47,
                                    height: 53,
                                  ),
                                ),
                                Padding(
                                    padding:
                                        EdgeInsets.only(right: 15, top: 15),
                                    child: Container(
                                      width: 68,
                                      height: 68,

                                      child:
                                      CircularPercentIndicator(
                                        radius: 45.0,
                                        lineWidth: 6.4,
                                        animation: true,
                                        percent: 0.70,
                                        backgroundColor: Color.fromRGBO(184,177,250,1),
                                        progressColor: Color.fromRGBO(107,101,221,1),

                                        center: Text(
                                          '30%',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: 'Lato',
                                              fontWeight: FontWeight.w800,
                                              color: Color.fromRGBO(107,101,221,1)),

                                        )


                                      ),


                                      /* Stack(

                                        children: <Widget>[

                                          Padding(
                                            padding: EdgeInsets.all(7),
                                            child:  Image.asset('images/pie_ic.png'),



                                          ),

                                          Center(

                                              child:Text(
                                            '30%',
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontFamily: 'Lato',
                                                fontWeight: FontWeight.w800,
                                                color: Color.fromRGBO(52,46,173,1)),

                                          ))


                                        ],



                                      ),*/

                                    )

                                    /*   Text(
                                     '30',
                                     style: TextStyle(
                                         fontSize: 15,
                                         fontFamily: 'Lato',
                                         fontWeight: FontWeight.w500,
                                         color: Color.fromRGBO(52,46,173,1)),
                                   ),*/

                                    ),
                              ],
                            ),
                            SizedBox(height: 23),
                            Text(
                              'Manage Orders\nStatus',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w700,
                                  color: MyColor.defaultTextColor),
                            ),
                          ],
                        ),
                      ),
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: <Widget>[
                DashboardWidget(
                    bgColor: Color.fromRGBO(224, 234, 255, 1),
                    curveColor: Color.fromRGBO(215, 229, 255, 1),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DistanceTravelledScreen()));
                      },
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(left: 20, top: 30),
                                  child: Image.asset(
                                    'images/map_path_ic.png',
                                    width: 47,
                                    height: 53,
                                  ),
                                ),
                                Padding(
                                    padding:
                                        EdgeInsets.only(right: 15, top: 25),
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          '07',
                                          style: TextStyle(
                                              fontSize: 32,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w900,
                                              color: Color.fromRGBO(
                                                  152, 179, 248, 1)),
                                        ),
                                        Text(
                                          'Kilometres',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w500,
                                              color: Color.fromRGBO(
                                                  68, 110, 214, 0.7)),
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                            SizedBox(height: 24),
                            Text(
                              'Track Distance\nTravelled',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w700,
                                  color: MyColor.defaultTextColor),
                            ),
                          ],
                        ),
                      ),
                    )),
                SizedBox(width: 18),
                DashboardWidget(
                    bgColor: Color.fromRGBO(254, 241, 220, 1),
                    curveColor: Color.fromRGBO(254, 237, 211, 1),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DriverEarningsScreen()));
                      },
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(left: 20, top: 30),
                                  child: Image.asset(
                                    'images/earnings_ic.png',
                                    width: 47,
                                    height: 53,
                                  ),
                                ),
                                Padding(
                                    padding:
                                        EdgeInsets.only(right: 15, top: 25),
                                    child: Column(
                                      children: <Widget>[
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          '\$110',
                                          style: TextStyle(
                                              fontSize: 30,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w900,
                                              color: Color.fromRGBO(
                                                  226, 184, 111, 1)),
                                        ),
                                        Text(
                                          'Earnings',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w500,
                                              color: Color.fromRGBO(
                                                  226, 184, 111, 0.9)),
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                            SizedBox(height: 27),
                            Text(
                              'Manage Earnings',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w700,
                                  color: MyColor.defaultTextColor),
                            ),
                          ],
                        ),
                      ),
                    )),
              ],
            ),
          ),
       /*   SizedBox(
            height: 25,
          ),*/
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 25),
            child: Row(
              children: <Widget>[
                DashboardWidget(
                    bgColor: Color.fromRGBO(255, 225, 212, 1),
                    curveColor: Color.fromRGBO(255, 216, 202, 1),
                    child: InkWell(

                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RealTrackingScreen()));
                      },
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(left: 20, top: 30),
                                  child: Image.asset(
                                    'images/van_ic.png',
                                    width: 47,
                                    height: 53,
                                  ),
                                ),
                                Padding(
                                    padding:
                                        EdgeInsets.only(right: 15, top: 25),
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          '250',
                                          style: TextStyle(
                                              fontSize: 32,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w900,
                                              color: Color.fromRGBO(
                                                  255, 130, 83, 0.9)),
                                        ),
                                        Text(
                                          'Traveling',
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w500,
                                              color: Color.fromRGBO(
                                                  255, 130, 83, 0.9)),
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                            SizedBox(height: 30),
                            Text(
                              'Real Time Tracking',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w700,
                                  color: MyColor.defaultTextColor),
                            ),
                          ],
                        ),
                      ),
                    )),
                SizedBox(width: 18),
                DashboardWidget(
                    bgColor: Color.fromRGBO(205, 253, 255, 1),
                    curveColor: Color.fromRGBO(192, 253, 255, 1),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyOrdersScreen()));
                      },
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(left: 20, top: 30),
                                  child: Image.asset(
                                    'images/history.png',
                                    width: 47,
                                    height: 53,
                                  ),
                                ),
                                Padding(
                                    padding:
                                        EdgeInsets.only(right: 15, top: 25),
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          '04',
                                          style: TextStyle(
                                              fontSize: 32,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w900,
                                              color: Color.fromRGBO(
                                                  87, 218, 228, 1)),
                                        ),
                                        Text(
                                          'Deleivered',
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w500,
                                              color: Color.fromRGBO(
                                                  18, 187, 200, 0.7)),
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                            SizedBox(height: 30),
                            Text(
                              'Order History',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w700,
                                  color: MyColor.defaultTextColor),
                            ),
                          ],
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
