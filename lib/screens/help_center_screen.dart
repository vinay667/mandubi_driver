import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mandubi_driver/colors/colors.dart';
import 'package:mandubi_driver/widgets/btn_widget.dart';
import 'package:mandubi_driver/widgets/input_field_widget.dart';
import 'package:mandubi_driver/widgets/input_field_widget_multi.dart';
import 'package:mandubi_driver/widgets/toolbar_widget.dart';

class HelpCenterScreen extends StatefulWidget {
  HelpCenterState createState() => HelpCenterState();
}

class HelpCenterState extends State<HelpCenterScreen>{
  FocusNode commentFocusNode = new FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[

          ToolbarWidget('Help Center'),

          Stack(
            children: <Widget>[
              Container(
                 height: 53,
                margin: EdgeInsets.symmetric(horizontal: 18),
                child: TextFormField(
                  //controller: textControllerSearch,
                  maxLines: 1,
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                      color: Color.fromRGBO(40, 40, 40, 1),
                      fontSize: 15,
                      decoration: TextDecoration.none,
                      fontFamily: 'Roboto'),
                  decoration: InputDecoration(
                    hintText: 'Search',
                    border: InputBorder.none,
                    contentPadding:
                    EdgeInsets.only(left: 15, right: 50,top: 5),
                    hintStyle: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(128,128,128, 0.5),
                        fontSize: 18),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(244,244,244,1),
                    borderRadius: BorderRadius.circular(8),
                    ),
              ),
              GestureDetector(
                onTap: () {},
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: EdgeInsets.only(right: 35, top: 18),
                        child: Image.asset('images/search_ic.png',
                            width: 18, height: 18),
                      ),
                    )),
              )
            ],
          ),
          
          SizedBox(height: 30),
          
          Center(
            child: Image.asset('images/help_image.png',width: 231,height: 167,),
          ),
          SizedBox(height: 30),


          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child:   Text(
              'We’re here to help you with anything and everything on Kussbus',
              style: TextStyle(
                  fontSize: 26,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w800,
                  height: 1.2,
                  color: MyColor.defaultTextColor),
            ),
          ),


          SizedBox(height: 10),



          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child:   Text(
              'Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.',
              style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w400,
                  height: 1.2,
                  color: Color.fromRGBO(79,79,79,1).withOpacity(0.5)),
            ),
          ),

          SizedBox(height: 25),


          Row(
            children: <Widget>[


              Container(
                height: 70,
                margin: EdgeInsets.only(left: 18),
                decoration: BoxDecoration(
                    color: MyColor.dashBoardBgColor,
                    borderRadius: BorderRadius.circular(15)
                ),

                child: Row(
                  children: <Widget>[

                    SizedBox(width: 20),

                    Image.asset('images/customer_support.png',width: 30,height: 30),

                    SizedBox(width: 15),
                    Text(
                      '+88 016 736 76534',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          color: MyColor.defaultTextColor),
                    ),
                    SizedBox(width: 25),





                  ],
                ),
              )
            ],
          ),



          SizedBox(height: 25),


          Row(
            children: <Widget>[

              SizedBox(width: 20),

              Image.asset('images/loc_pink.png',width: 15,height: 20),

              SizedBox(width: 5),
              Text(
                '2664 Southem Street, New York, 10036',
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w600,
                    color: MyColor.defaultTextColor),
              ),






            ],
          ),

          SizedBox(height: 15),


          Divider(
            color: Color.fromRGBO(253,247,243,1),
          ),

          SizedBox(height: 20),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 18),
            child:   InputBoxWidgetMulti(
              labelText: 'Comment',
              focusNode: commentFocusNode,
            ),
          ),


          SizedBox(height: 25),


      Container(
        margin: EdgeInsets.symmetric(horizontal: 18),
        child:  InkWell(
          onTap: () {

          },
          child: ButtonWidget('Send Message'),
        ),



      ),





          SizedBox(height: 25),


        ],
      ),
    );
    //   Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationScreen()));
  }





}
