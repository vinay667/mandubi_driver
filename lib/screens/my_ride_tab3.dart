import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:mandubi_driver/colors/colors.dart';

class MyRidesTab3 extends StatefulWidget {
  MyRidesTab3State createState() => MyRidesTab3State();
}

class MyRidesTab3State extends State<MyRidesTab3>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(254, 247, 242, 1),
      body:ListView.builder(
          itemCount: 4,
          itemBuilder: (BuildContext context, int pos) {
            return Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Color.fromRGBO(253,181,84,1).withOpacity(0.4),width: 1)
                  ),
                  margin: EdgeInsets.only(left: 15, right: 15),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 15,top: 5),
                              child: Icon(Icons.do_not_disturb,color: MyColor.defaultTextColor,size: 35,)
                            ),



                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 12, top: 12),
                                    child: Text(
                                      '#ORD0001',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontFamily: 'Lato',
                                          fontWeight: FontWeight.w500,
                                          color: MyColor
                                              .defaultTextColor),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 12, top: 3),
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
                              // height: 40,
                              margin:
                              EdgeInsets.only(top: 10, right: 15),
                              child:  Container(
                                width: 45,
                                height: 45,
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(
                                        253, 247, 243, 1),
                                    shape: BoxShape.circle),
                                child: Image.asset(
                                  'images/back_right.png',color: Color.fromRGBO(234,98,43,1),),
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
                      SizedBox(
                        height: 7,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15),
                        child:    Text(
                          'Delivery Reason',
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              color: MyColor
                                  .defaultTextColor),
                        ),

                      ),


                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15,right: 15),
                        child:    Text(
                          'Who is thought to have scrambled parts of Cicero De Finibus Bonorum et Malorum for use in a type specimen book.',
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w500,
                              color: MyColor
                                  .defaultTextColor),
                          maxLines: 3,
                        ),

                      ),




                    ],
                  ),
                ),

                SizedBox(height: 18,)

              ],
            );
          }),
    );
    //   Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationScreen()));
  }





}
