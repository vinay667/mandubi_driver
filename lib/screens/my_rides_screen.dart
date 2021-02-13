
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mandubi_driver/colors/colors.dart';
import 'package:mandubi_driver/screens/my_ride_tab2.dart';
import 'package:mandubi_driver/screens/my_ride_tab3.dart';
import 'package:mandubi_driver/widgets/toolbar_widget.dart';

import 'my_ride_tab1.dart';

class MyRidesScreen extends StatefulWidget {
  MyRidesScreenState createState() => MyRidesScreenState();
}

class MyRidesScreenState extends State<MyRidesScreen> {


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(254, 247, 242, 1),
        body: Column(

          children: <Widget>[
           ToolbarWidget('My Rides'),
            Container(
              color: Colors.white,
             // padding: EdgeInsets.only(left: 10),
              height: 45,
              child: TabBar(
                  isScrollable: true,
                unselectedLabelColor: Color.fromRGBO(192,192,192,1),
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(width: 4, color: MyColor.themeColor),
                  insets: EdgeInsets.symmetric(horizontal: 28.0),
                ),
                tabs: [
                  Tab(
                      child:Row(
                        children: <Widget>[
                         Image.asset('images/black_bike.png',width: 28,height: 28,),
                          SizedBox(width: 7),

                          Text(
                            'Ongoing',
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w600,
                                color: MyColor.defaultTextColor),
                            overflow: TextOverflow.ellipsis,
                          ),

                        ],
                      )

                    //icon: Icon(Icons.directions_bike),
                  ),
                  Tab(
                      child:Row(
                        children: <Widget>[
                          Image.asset('images/black_check.png',width: 20,height: 20,),
                          SizedBox(width: 7),

                          Text(
                            'Completed 70%',
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w600,
                                color: MyColor.defaultTextColor),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      )

                    //icon: Icon(Icons.directions_bike),
                  ),

                  Tab(
                      child:Row(
                        children: <Widget>[
                          Icon(Icons.do_not_disturb,size: 25,color: MyColor.defaultTextColor,),
                          SizedBox(width: 7),
                          Text(
                            'Cancelled 30%',
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w600,
                                color: MyColor.defaultTextColor),
                            overflow: TextOverflow.ellipsis,
                          ),

                        ],
                      )

                    //icon: Icon(Icons.directions_bike),
                  ),
                ],
              ),
            ),
            Expanded(
              //  height: 600,
              child: TabBarView(
                children: [
                  MyRidesTab1(),
                 MyRidesTab2(),
                  MyRidesTab3(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
