import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:intl/intl.dart';
import 'package:mandubi_driver/colors/colors.dart';
import 'package:mandubi_driver/widgets/toolbar_widget.dart';

class DistanceTravelledScreen extends StatefulWidget {
  DistanceTravelledState createState() => DistanceTravelledState();
}

class DistanceTravelledState extends State<DistanceTravelledScreen> {
  DateTime _currentDate = DateTime(2019, 2, 3);
  DateTime _currentDate2 = DateTime(2019, 2, 3);
  String _currentMonth = DateFormat.yMMM().format(DateTime(2019, 2, 3));
  DateTime _targetDateTime = DateTime(2019, 2, 3);


  CalendarCarousel _calendarCarousel, _calendarCarouselNoHeader;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 15,right: 10),
        child: FloatingActionButton(
          onPressed: () {
             showCalender();
          },
          child: Image.asset('images/flot.png',width: 28,height: 25,),
          backgroundColor: Color.fromRGBO( 234,98,43,1),
        ),
      ),
      backgroundColor: MyColor.dashBoardBgColor,
      body:


      Column(
        children: <Widget>[
          ToolbarWidget('Distance Travelled'),
          Container(
            width: double.infinity,
            height: 1,
            color: Color.fromRGBO(0, 0, 0, 0.07),
          ),



          SizedBox(height: 20,),



        Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          padding: EdgeInsets.only(bottom: 15),
          child:   Row(
           // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[

             Expanded(
               child:  Container(
                 padding: EdgeInsets.only(left: 15,top: 10,right: 10),
                 height: 114,
                 //   width: MediaQuery.of(context).size.width * 0.30,
                 decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(25),
                     color: Color.fromRGBO(255,220,205,1),
                     boxShadow: <BoxShadow>[
                       BoxShadow(
                           color: Colors.grey.withOpacity(0.3),
                           blurRadius: 5,
                           spreadRadius: 1),
                     ],
                    // border: Border.all(color: Colors.white,width: 1)
                 ),

                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: <Widget>[

                     //  SizedBox(height: 5),
                     Text(
                       '100',
                       style: TextStyle(
                           fontSize: 33,
                           fontFamily: 'Roboto',
                           fontWeight: FontWeight.w900,
                           color: Color.fromRGBO(
                               242,112,54, 1)),
                     ),
                     Text(
                       'Kilometers',
                       style: TextStyle(
                           fontSize: 13,
                           fontFamily: 'Roboto',
                           fontWeight: FontWeight.w500,
                           color: Color.fromRGBO(
                               242,112,54,0.8)),
                     ),


                     SizedBox(height: 8,),

                     Text(
                       'Yesterday',
                       style: TextStyle(
                           fontSize: 15.5,
                           fontFamily: 'Lato',
                           fontWeight: FontWeight.w700,
                           color:MyColor.defaultTextColor),
                     ),
                   ],
                 ),
               ),
               flex: 1,
             ),

              SizedBox(width: 15,),



              Expanded(
                child: Container(

                  padding: EdgeInsets.only(left: 15,top: 10,right: 10),
                  height: 114,
                  //  width: MediaQuery.of(context).size.width * 0.30,

                  decoration: BoxDecoration(
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 5,
                            spreadRadius: 1),
                      ],
                      borderRadius: BorderRadius.circular(25),
                      color: Color.fromRGBO(222,219,255,1),
                      ///border: Border.all(color: Colors.white,width: 1)
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      //  SizedBox(height: 5),
                      Text(
                        '500',
                        style: TextStyle(
                            fontSize: 33,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w900,
                            color: Color.fromRGBO(
                                52,46,173, 1)),
                      ),
                      Text(
                        'Kilometers',
                        style: TextStyle(
                            fontSize: 13,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(
                                52,46,173,0.8)),
                      ),


                      SizedBox(height: 8,),

                      Text(
                        'Yesterday',
                        style: TextStyle(
                            fontSize: 15.5,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w700,
                            color:MyColor.defaultTextColor),
                      ),
                    ],
                  ),
                ),
                flex: 1,
              ),
              SizedBox(width: 15,),


             Expanded(
               child:  Container(

                 padding: EdgeInsets.only(left: 15,top: 10,right: 10),
                // margin: EdgeInsets.only(right: 10),
                 height: 114,
                 // width: MediaQuery.of(context).size.width * 0.30,
                 decoration: BoxDecoration(
                     boxShadow: <BoxShadow>[
                       BoxShadow(
                           color: Colors.grey.withOpacity(0.3),
                           blurRadius: 5,
                           spreadRadius: 1),
                     ],
                     borderRadius: BorderRadius.circular(25),
                     color: Color.fromRGBO(251,237,213,1),
                    // border: Border.all(color: Colors.white,width: 1)
                 ),

                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: <Widget>[

                     //  SizedBox(height: 5),
                     Text(
                       '100',
                       style: TextStyle(
                           fontSize: 33,
                           fontFamily: 'Roboto',
                           fontWeight: FontWeight.w900,
                           color: Color.fromRGBO(
                               216,160,61, 1)),
                     ),
                     Text(
                       'Kilometers',
                       style: TextStyle(
                           fontSize: 13,
                           fontFamily: 'Roboto',
                           fontWeight: FontWeight.w500,
                           color: Color.fromRGBO(
                               216,160,61,0.8)),
                     ),


                     SizedBox(height: 8,),

                     Text(
                       'Tomorrow',
                       style: TextStyle(
                           fontSize: 15.5,
                           fontFamily: 'Lato',
                           fontWeight: FontWeight.w700,
                           color:MyColor.defaultTextColor),
                     ),
                   ],
                 ),
               ),
               flex: 1,
             ),

            ],
          ),
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
                    Image.asset('images/calender_ic.png', width: 20, height: 20),
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
                Row(
                  children: <Widget>[
                    Image.asset('images/loc_or.png',
                        width: 20, height: 20),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Location',
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
                    Image.asset('images/distance.png',
                        width: 20, height: 20),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Dist',
                      style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w700,
                          color: MyColor.defaultTextColor),
                    ),
                    Text(
                      '(KM)',
                      style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
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
                  color: MyColor.dashBoardBgColor,
                  child:Column(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: 1,
                        color: Color.fromRGBO(0, 0, 0, 0.07),
                      ),
                      SizedBox(height: 17),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            '01 Dec 2020',
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w500,
                                color: MyColor.defaultTextColor),
                          ),

                         Container(
                           transform: Matrix4.translationValues(-22.0, 0, 0.0),
                           child:    Text(
                             '01 Dec 2020    ',
                             style: TextStyle(
                                 fontSize: 16,
                                 fontFamily: 'Lato',
                                 fontWeight: FontWeight.w600,
                                 color: MyColor.defaultTextColor),
                           ),
                         ),
                          Text(
                            '\$10',
                            style: TextStyle(
                                fontSize: 17,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w900,
                                color: MyColor.defaultTextColor),
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






  showCalender() {
    showGeneralDialog(
      barrierLabel: "Label",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 300),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(35),
                                topRight: Radius.circular(35))),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(35),
                                  topRight: Radius.circular(35))),
                          margin: EdgeInsets.zero,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(

                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(left: 20,top: 25),
                                    child: Text(
                                      'Select Specific Date',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Lato',
                                          fontWeight: FontWeight.w700,
                                          color:MyColor.defaultTextColor),
                                    ),
                                  ),
                                  Spacer(),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Padding(
                                      padding:
                                      EdgeInsets.only(top: 18, right: 18),
                                      child: Image.asset(
                                          'images/cross_rect.png',
                                          width: 20,
                                          height: 20),
                                    ),
                                  ),

                                ],
                              ),

                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 16.0),
                                child: CalendarCarousel<Event>(
                                  onDayPressed: (DateTime date, List<Event> events) {
                                  setState(() => _currentDate = date);
                                  },
                                  weekendTextStyle: TextStyle(
                                    color: Colors.red,
                                  ),

                                  selectedDayButtonColor: Color.fromRGBO( 234,98,43,1),
                                  thisMonthDayBorderColor: Colors.grey,
                                  leftButtonIcon: Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(width: 1,color: Color.fromRGBO( 234,98,43,1),)
                                    ),
                                    child: Icon(Icons.arrow_back_ios,color: Color.fromRGBO( 234,98,43,1),size: 14,),
                                  ),
                                  rightButtonIcon: Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(width: 1,color: Color.fromRGBO( 234,98,43,1),)
                                    ),
                                    child: Icon(Icons.arrow_forward_ios,color: Color.fromRGBO( 234,98,43,1),size: 14,),
                                  ),

                                  weekdayTextStyle: TextStyle(color: MyColor.defaultTextColor,fontFamily: 'Lato',fontWeight: FontWeight.w600,fontSize: 16),
                                  selectedDayTextStyle:TextStyle(color: Colors.white,fontFamily: 'Lato',fontWeight: FontWeight.w600,fontSize: 16),
                                  daysTextStyle: TextStyle(color: MyColor.defaultTextColor,fontFamily: 'Lato',fontWeight: FontWeight.w600,fontSize: 16),
                                  headerTextStyle: TextStyle(color: MyColor.defaultTextColor,fontFamily: 'Lato',fontWeight: FontWeight.w600,fontSize: 16),
                                  customDayBuilder: (   /// you can provide your own build function to make custom day containers
                                      bool isSelectable,
                                      int index,
                                      bool isSelectedDay,
                                      bool isToday,
                                      bool isPrevMonthDay,
                                      TextStyle textStyle,
                                      bool isNextMonthDay,
                                      bool isThisMonthDay,
                                      DateTime day,
                                      ) {
                                  },
                                  weekFormat: false,
                                  height: 390.0,
                                  selectedDateTime: _currentDate,
                                  /// null for not rendering any border, true for circular border, false for rectangular border
                                ),
                              ),








                            ],
                          ),
                        )),
                  ],
                ));
          },
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position:
          Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim1),
          child: child,
        );
      },
    );
  }

}
