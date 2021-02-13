import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mandubi_driver/colors/colors.dart';
import 'package:mandubi_driver/network/api_dialog.dart';
import 'package:mandubi_driver/network/api_helper.dart';
import 'package:mandubi_driver/network/no_internet_check.dart';
import 'package:mandubi_driver/screens/driver_dashboard_screen.dart';
import 'package:mandubi_driver/screens/filter_screen.dart';
import 'package:mandubi_driver/screens/login_screen.dart';
import 'package:mandubi_driver/screens/my_account_screen.dart';
import 'package:mandubi_driver/screens/notification_screen.dart';
import 'package:mandubi_driver/screens/settings_screen.dart';
import 'package:mandubi_driver/widgets/menu_page.dart';
import 'package:mandubi_driver/widgets/zoom_scaffold.dart';
import 'package:provider/provider.dart';

class LandingScreen extends StatefulWidget {
  LandingState createState() => LandingState();
}

class LandingState extends State<LandingScreen> with TickerProviderStateMixin {
  MenuController menuController;
  int _selectedIndex = 0;
  bool orangeTheme=false;
  var _fromData;
  String name='',email='',phone='',profileImage='';

  List<String> listPageTitle = ['Home', 'Account Setting','Notifications','Select Miles Range','My Profile'];

  List<Widget> _widgetOptions = <Widget>[
    DriverDashboardScreen(),
    SettingsScreen(false),
    NotificationScreen(),
    FilterScreen(),
    MyAccountScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => menuController,
      child: ZoomScaffold(
        menuScreen: MenuScreen(name,email,profileImage),
        orangeTheme: orangeTheme,
        pageTitle: listPageTitle[_selectedIndex],
        contentScreen: Layout(
            contentBuilder: (cc) => Expanded(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                            child: _widgetOptions.elementAt(_selectedIndex)),
                      ),
                      // common for all

                      Container(
                        decoration: BoxDecoration(
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: Colors.orangeAccent.withOpacity(0.3),
                                blurRadius: 20,
                                spreadRadius: 2),
                          ],
                        ),
                        child: BottomNavigationBar(
                          currentIndex: _selectedIndex,
                          type: BottomNavigationBarType.fixed,
                          selectedItemColor: Color.fromRGBO(231,109,44,1),
                          unselectedItemColor: Color.fromRGBO(155, 153, 152, 1),
                          items: [
                            BottomNavigationBarItem(
                              icon: Padding(
                                padding: EdgeInsets.only(bottom: 5, top: 6),
                                child:
                                    ImageIcon(
                                        AssetImage("images/home_bt.png")),
                              ),
                              title: Text(
                                'Home',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w500,
                                    color: _selectedIndex==0?Color.fromRGBO(231,109,44,1):Color.fromRGBO(79, 79, 79, 0.5)),
                              ),
                            ),
                            BottomNavigationBarItem(
                              icon: Padding(
                                padding: EdgeInsets.only(bottom: 5, top: 6),
                                child: ImageIcon(
                                    AssetImage("images/settings_bt.png")),
                              ),
                              title: Text(
                                'Setting',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w500,
                                    color: _selectedIndex==1?Color.fromRGBO(231,109,44,1):Color.fromRGBO(79, 79, 79, 0.5)),
                              ),
                            ),
                            BottomNavigationBarItem(
                              icon: Padding(
                                padding: EdgeInsets.only(bottom: 5, top: 6),
                                child: ImageIcon(
                                    AssetImage("images/notification_bt.png")),
                              ),
                              title: Text(
                                'Notifications',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w500,
                                    color: _selectedIndex==2?Color.fromRGBO(231,109,44,1):Color.fromRGBO(79, 79, 79, 0.5)),
                              ),
                            ),
                            BottomNavigationBarItem(
                              icon: Padding(
                                padding: EdgeInsets.only(bottom: 5, top: 6),
                                child: ImageIcon(
                                    AssetImage("images/filter_bt.png")),
                              ),
                              title: Text(
                                'Filter',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w500,
                                    color: _selectedIndex==3?Color.fromRGBO(231,109,44,1):Color.fromRGBO(79, 79, 79, 0.5)),
                              ),
                            ),
                            BottomNavigationBarItem(
                              icon: Padding(
                                padding: EdgeInsets.only(bottom: 5, top: 6),
                                child: ImageIcon(
                                    AssetImage("images/profile_bt.png")),
                              ),
                              title: Text(
                                'My Account',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w500,
                                    color: _selectedIndex==4?Color.fromRGBO(231,109,44,1):Color.fromRGBO(79, 79, 79, 0.5)),
                              ),
                            ),
                          ],
                          onTap: (index) {

                            if(index==4)
                              {
                                orangeTheme=true;
                              }
                            else{
                              orangeTheme=false;
                            }

                            setState(() {
                              _selectedIndex = index;

                            });
                          },
                        ),
                      )
                    ],
                  ),
                )),

      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    menuController = new MenuController(
      vsync: this,
    )..addListener(() => setState(() {}));
    checkInternetAPIcall();
  }

  @override
  void dispose() {
    menuController.dispose();
    super.dispose();
  }


  getDriverProfile() async {
    FocusScope.of(context).unfocus();
    APIDialog.showAlertDialog(context, 'Please wait...');
    ApiBaseHelper helper = new ApiBaseHelper();
    var response = await helper.postAPIWithHeader('viewprofile', _fromData,context);
    Navigator.pop(context);
    print(response);
    setState(() {
      name=response['data']['name'];
      email=response['data']['email'];
      phone=response['data']['mobile'].toString();
      profileImage=response['data']['pimage'];

    });
  }




  void checkInternetAPIcall() async {
    if (await InternetCheck.check() == true) {
      getDriverProfile();
    }
  }

}
