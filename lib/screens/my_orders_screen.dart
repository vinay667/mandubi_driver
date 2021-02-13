import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:mandubi_driver/colors/colors.dart';
import 'package:mandubi_driver/widgets/toolbar_widget.dart';

class MyOrdersScreen extends StatefulWidget {
  MyOrdersState createState() => MyOrdersState();
}

class MyOrdersState extends State<MyOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(254, 247, 242, 1),
      body: Column(
        children: <Widget>[
          ToolbarWidget('Manage Orders'),
          Container(
            width: double.infinity,
            height: 1,
            color: Color.fromRGBO(0, 0, 0, 0.07),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: 4,
                  padding: EdgeInsets.zero,
                  itemBuilder: (BuildContext context, int pos) {
                    return Column(
                      children: <Widget>[
                        Card(
                          margin: EdgeInsets.only(left: 15, right: 15),
                          color: Colors.white,
                          // elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Container(
                            // margin: EdgeInsets.only(left: 10, right: 10),
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 15, top: 12),
                                              child: Text(
                                                '#ORD0001',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontFamily: 'Lato',
                                                    fontWeight: FontWeight.w500,
                                                    color: MyColor
                                                        .defaultTextColor),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 15, top: 3),
                                              child: Text(
                                                '\$10',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontFamily: 'Lato',
                                                    fontWeight: FontWeight.w800,
                                                    color: Color.fromRGBO(
                                                        247, 85, 4, 1)),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: 40,
                                        margin:
                                            EdgeInsets.only(top: 10, right: 15),
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                              width: 50,
                                              height: 50,
                                              padding: EdgeInsets.all(9),
                                              decoration: BoxDecoration(
                                                  color: Color.fromRGBO(
                                                      253, 247, 243, 1),
                                                  shape: BoxShape.circle),
                                              child: Image.asset(
                                                  'images/thumbs_up.png'),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Container(
                                              width: 50,
                                              height: 50,
                                              padding: EdgeInsets.all(9),
                                              decoration: BoxDecoration(
                                                  color: Color.fromRGBO(
                                                      253, 247, 243, 1),
                                                  shape: BoxShape.circle),
                                              child: Image.asset(
                                                  'images/thumbs_down.png'),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Divider(
                                  color: Color.fromRGBO(253, 181, 84, 1),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(top: 12),
                                        child: Column(
                                          children: <Widget>[
                                            Container(
                                              width: 17,
                                              height: 17,
                                              padding: EdgeInsets.all(4),
                                              decoration: BoxDecoration(
                                                  color: Color.fromRGBO(
                                                      244, 171, 57, 1),
                                                  shape: BoxShape.circle),
                                              child: Image.asset(
                                                  'images/loc_wh.png'),
                                            ),
                                            Dash(
                                                direction: Axis.vertical,
                                                length: 65,
                                                dashLength: 6,
                                                dashColor: MyColor.themeColor),
                                            Container(
                                              width: 26,
                                              height: 26,
                                              padding: EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                  color: Color.fromRGBO(
                                                      255, 238, 211, 1),
                                                  shape: BoxShape.circle),
                                              child: Container(
                                                width: 15,
                                                height: 15,
                                                decoration: BoxDecoration(
                                                    color: Color.fromRGBO(
                                                        254, 172, 44, 1),
                                                    shape: BoxShape.circle),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              'To: July 8th 2020',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontFamily: 'Lato',
                                                  fontWeight: FontWeight.w500,
                                                  color: Color.fromRGBO(
                                                      54, 54, 54, 0.4)),
                                            ),
                                            SizedBox(height: 5),
                                            Text(
                                              'Michael',
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontFamily: 'Roboto',
                                                  fontWeight: FontWeight.w500,
                                                  color: Color.fromRGBO(
                                                      54, 54, 54, 1)),
                                            ),
                                            SizedBox(height: 5),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.50,
                                              child: Text(
                                                '64 Momingview Lane, New York, 10036',
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontFamily: 'Lato',
                                                    fontWeight: FontWeight.w600,
                                                    color: MyColor
                                                        .defaultTextColor),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            SizedBox(height: 25),
                                            Text(
                                              'From: July 10th 2020',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontFamily: 'Lato',
                                                  fontWeight: FontWeight.w500,
                                                  color: Color.fromRGBO(
                                                      54, 54, 54, 0.4)),
                                            ),
                                            SizedBox(height: 5),
                                            Text(
                                              'Jessica',
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontFamily: 'Roboto',
                                                  fontWeight: FontWeight.w500,
                                                  color: Color.fromRGBO(
                                                      54, 54, 54, 1)),
                                            ),
                                            SizedBox(height: 5),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.50,
                                              child: Text(
                                                '2664 Southem Street, New York, 10036',
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontFamily: 'Lato',
                                                    fontWeight: FontWeight.w600,
                                                    color: MyColor
                                                        .defaultTextColor),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 14)
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    );
                  }))
        ],
      ),
    );
  }
}
