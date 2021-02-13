import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mandubi_driver/colors/colors.dart';

class NotificationScreen extends StatefulWidget {
  NotificationState createState() => NotificationState();
}

class NotificationState extends State<NotificationScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
       body:  ListView.builder(
           padding: EdgeInsets.zero,
           itemCount: 4,

           itemBuilder: (BuildContext context,int pos)
           {
             return Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: <Widget>[
                 SizedBox(height: 15),


                 Padding(
                   padding: EdgeInsets.only(left: 12),
                   child:    Text(
                     'Today',
                     style: TextStyle(
                         fontSize: 14,
                         fontFamily: 'Lato',
                         fontWeight: FontWeight.w600,
                         color: Color.fromRGBO(79,79,79,0.4)),
                   ),

                 ),

                 SizedBox(height: 5),
                 Divider(
                   color: Colors.grey.withOpacity(0.3),
                 ),

                 //SizedBox(height: 10),

                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: <Widget>[
                     Expanded(
                       child: Container(),
                     ),


                     Padding(
                       padding: EdgeInsets.only(right: 12),
                       child:   Text(
                         'Just Now',
                         style: TextStyle(
                             fontSize: 13,
                             fontFamily: 'Roboto',
                             fontWeight: FontWeight.w500,
                             color: Color.fromRGBO(54,54,54,0.5)),
                       ),
                     )


                   ],
                 ),

                 Padding(
                   padding: EdgeInsets.only(left: 12),
                   child:   Text(
                     'Hi, Lorem ipsum this is dummy text lorem',
                     style: TextStyle(
                         fontSize: 15,
                         fontFamily: 'Lato',
                         fontWeight: FontWeight.w700,
                         color: MyColor.defaultTextColor),
                     maxLines: 2,
                     overflow: TextOverflow.ellipsis,
                   ),
                 ),
                 SizedBox(height: 12),
                 Divider(
                   color: Colors.black.withOpacity(0.2),
                 ),

                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: <Widget>[
                     Expanded(
                       child: Container(),
                     ),


                     Padding(
                       padding: EdgeInsets.only(right: 12),
                       child:   Text(
                         'Just Now',
                         style: TextStyle(
                             fontSize: 13,
                             fontFamily: 'Roboto',
                             fontWeight: FontWeight.w500,
                             color: Color.fromRGBO(54,54,54,0.5)),
                       ),
                     )


                   ],
                 ),

                 Padding(
                   padding: EdgeInsets.only(left: 12),
                   child:   Text(
                     'Hi, When do you expect to reach destination?',
                     style: TextStyle(
                         fontSize: 15,
                         fontFamily: 'Lato',
                         fontWeight: FontWeight.w700,
                         color: MyColor.defaultTextColor),
                     maxLines: 2,
                     overflow: TextOverflow.ellipsis,
                   ),
                 ),
                 SizedBox(height: 12),
                 Divider(
                   color: Colors.black.withOpacity(0.2),
                 ),

                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: <Widget>[
                     Expanded(
                       child: Container(),
                     ),


                     Padding(
                       padding: EdgeInsets.only(right: 12),
                       child:   Text(
                         'Just Now',
                         style: TextStyle(
                             fontSize: 13,
                             fontFamily: 'Roboto',
                             fontWeight: FontWeight.w500,
                             color: Color.fromRGBO(54,54,54,0.5)),
                       ),
                     )


                   ],
                 ),

                 Padding(
                   padding: EdgeInsets.only(left: 12),
                   child:   Text(
                     'Hi, When do you expect to reach destination?',
                     style: TextStyle(
                         fontSize: 15,
                         fontFamily: 'Lato',
                         fontWeight: FontWeight.w700,
                         color: MyColor.defaultTextColor),
                     maxLines: 2,
                     overflow: TextOverflow.ellipsis,
                   ),
                 ),
                 SizedBox(height: 12),
                 Divider(
                   color: Colors.black.withOpacity(0.2),
                 ),
               ],
             );
           }

       ));

  }





}
