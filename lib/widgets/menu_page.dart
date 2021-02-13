
import 'package:flutter/material.dart';
import 'package:mandubi_driver/colors/colors.dart';
import 'package:mandubi_driver/model/user_model.dart';
import 'package:mandubi_driver/network/api_helper.dart';
import 'package:mandubi_driver/network/constants.dart';
import 'package:mandubi_driver/screens/about_us_screen.dart';
import 'package:mandubi_driver/screens/help_center_screen.dart';
import 'package:mandubi_driver/screens/login_screen.dart';
import 'package:mandubi_driver/screens/my_rides_screen.dart';
import 'package:mandubi_driver/screens/settings_screen.dart';
import 'package:mandubi_driver/screens/wallet_screen.dart';
import 'package:mandubi_driver/widgets/zoom_scaffold.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

import 'circular_image.dart';

class MenuScreen extends StatelessWidget {
  final String name,email,pImage;
  MenuScreen(this.name,this.email,this.pImage);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        //on swiping left
        if (details.delta.dx < -6) {
          Provider.of<MenuController>(context, listen: true).toggle();
        }
      },
      child: Container(
        padding: EdgeInsets.only(
          left: 15,
          bottom: 8,
          right: 20,),
        color: Color(0xff000204),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            SizedBox(height: 36),
            Row(
              children: <Widget>[

                Container(
                    width: 68,
                    height: 68,
                    margin: EdgeInsets.only(top: 2),
                    child:Stack(
                      children: <Widget>[





                        Container(

                            decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                image: new DecorationImage(
                                    fit: BoxFit.fill,
                                    image:pImage==null?AssetImage(
                                        'images/dum_profile.jpg'):NetworkImage(AppConstant.imageBaseURL+pImage)))),


                        Align(
                          alignment: Alignment.bottomRight,
                          child:  Container(
                            width: 22,
                            height: 22,
                            // margin: EdgeInsets.only(right: 20, left: 5),
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xff000204),
                            ),
                            child: Image.asset(
                              'images/edit_profile.png',
                            ),
                          ),
                        )



                      ],
                    )
                ),

                Spacer(),

                Container(
                    transform: Matrix4.translationValues(
                        5.0, -20, 0.0),
                    width: 40,
                    height: 40,
                    padding: EdgeInsets.all(9),
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: (){
                        print('triggered');
                        Provider.of<MenuController>(context, listen: true).toggle();
                      },
                      child: Image.asset('images/close_ic.png'),
                    )
                ),

              ],
            ),

            SizedBox(height: 12),

            Padding(
              padding: EdgeInsets.only(left: 5),
              child:     Text(
                name,
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: EdgeInsets.only(left: 5),
              child:     Text(
                email,
                style: TextStyle(
                    fontSize: 15.5,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(138,138,140,1)),
              ),
            ),

            SizedBox(height: 70),



            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MyRidesScreen()));
              },
              child:   NavigationItems('images/del_nav.png','My Rides',true),
            ),



            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>WalletScreen()));
              },
              child:    NavigationItems('images/acc_nav.png','Account Settlement',false),
            ),




            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingsScreen(true)));
              },
              child:    NavigationItems('images/settings_nav.png','Account Settings',false),
            ),









            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HelpCenterScreen()));
              },
              child:  NavigationItems('images/help_nav.png','Help Center',false),
            ),

            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutUsScreen()));
              },
              child:  NavigationItems('images/ques_nav.png','About & Legal',false),
            ),




            Spacer(),


             InkWell(
               onTap: (){
                 showLogOutDialog(context);
               },
               child:   Container(

                   width: 150,
                   height: 47,
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(25),
                       border: Border.all(width: 2,color: Color.fromRGBO(255,255,255,0.1))
                   ),


                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: <Widget>[

                       Image.asset('images/power_nav.png',width: 20,height: 20,),

                       SizedBox(width: 10),


                       Text(
                         'Logout',
                         style: TextStyle(
                             fontSize: 19,
                             fontFamily: 'Lato',
                             fontWeight: FontWeight.w700,
                             color: Color.fromRGBO(239,122,70,1)),
                       ),



                     ],
                   )
               ),
             ),
            SizedBox(height: 50,)




            /*    NavigationItems(),
            NavigationItems()*/

            /*   ListTile(
              onTap: () {},
              leading: Icon(
                Icons.settings,
                color: Colors.white,
                size: 20,
              ),
              title: Text('Settings',
                  style: TextStyle(fontSize: 14, color: Colors.white)),
            ),*/

            /*  ListTile(
              onTap: () {},
              leading: Icon(
                Icons.headset_mic,
                color: Colors.white,
                size: 20,
              ),
              title: Text('Support',
                  style: TextStyle(fontSize: 14, color: Colors.white)),
            ),*/



          ],
        ),
      ),
    );
  }
  showLogOutDialog(BuildContext context) {
    Widget cancelButton = FlatButton(
      child: Text("No"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Yes"),
      onPressed: () async {
        Navigator.pop(context);
        driverLOGOut(context);

      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Log Out"),
      content: Text("Are you sure you want to Log out ?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  driverLOGOut(BuildContext context) async {
   /* var _fromData;
    ApiBaseHelper helper = new ApiBaseHelper();
    var response = await helper.postAPIWithHeader('logout',_fromData,context);
    print(response);*/
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
    UserModel.setAccessToken(null);
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
            (Route<dynamic> route) => false);
    Toast.show('Logged out Successfully !!', context,
        duration: Toast.LENGTH_SHORT,
        gravity: Toast.BOTTOM,
        backgroundColor: Colors.black);


  }
}

class MenuItem {
  String title;
  IconData icon;

  MenuItem(this.icon, this.title);
}
class NavigationItems extends StatelessWidget
{
  final String iconURI,title;
  bool textColorOrange;
  NavigationItems(this.iconURI,this.title,this.textColorOrange);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      child: Row(
        children: <Widget>[
          Image.asset(iconURI,width: 25,height: 25,),

          SizedBox(width: 15),


          Text(
            title,
            style: TextStyle(
                fontSize: 16,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w600,
                color: textColorOrange==true?Color.fromRGBO(239,122,70,1):Color.fromRGBO(185,185,186,1)),
          ),




        ],
      ),
    );
  }

}

