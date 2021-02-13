import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mandubi_driver/colors/colors.dart';
import 'package:mandubi_driver/widgets/btn_widget.dart';
import 'package:mandubi_driver/widgets/input_field_widget.dart';
import 'package:mandubi_driver/widgets/toolbar_widget.dart';

class WalletScreen extends StatefulWidget {
  WalletState createState() => WalletState();
}

class WalletState extends State<WalletScreen> {
  FocusNode emailFocusNode = new FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(254, 247, 242, 1),
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          ToolbarWidget('Wallet'),
          SizedBox(height: 25),
          Container(
              height: 120,
              margin: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(254, 226, 215, 1),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      color: Colors.grey,
                    )
                  ]),
              child: Container(
                child: ClipPath(
                  //upper clippath with less height
                  clipper: WaveClipper(), //set our custom wave clipper.
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(253, 216, 202, 1),
                        borderRadius: BorderRadius.circular(15)),
                    height: 120,
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 25),
                        Container(
                          width: 55,
                          height: 55,
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: Image.asset('images/radio_wal.png'),
                        ),
                        SizedBox(width: 22),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(left: 0, top: 30),
                                child: Text(
                                  'Total Ride’s Amount',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w500,
                                      color: MyColor.defaultTextColor),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 0, top: 3),
                                child: Text(
                                  '\$250.00',
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w700,
                                      color: Color.fromRGBO(247, 85, 4, 1)),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          transform:
                              Matrix4.translationValues(-15.0, -5.0, 0.0),
                          child: Image.asset(
                            'images/back_right.png',
                            width: 30,
                            height: 30,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )),
          SizedBox(height: 25),
          Container(
              height: 120,
              margin: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(232, 228, 255, 1),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      color: Colors.grey,
                    )
                  ]),
              child: Container(
                child: ClipPath(
                  //upper clippath with less height
                  clipper: WaveClipper(), //set our custom wave clipper.
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(223, 218, 255, 1),
                        borderRadius: BorderRadius.circular(15)),
                    height: 120,
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 25),
                        Container(
                          width: 55,
                          height: 55,
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: Image.asset('images/wallet_blue.png'),
                        ),
                        SizedBox(width: 22),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(left: 0, top: 30),
                                child: Text(
                                  'Driver’s Earnings',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w500,
                                      color: MyColor.defaultTextColor),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 0, top: 3),
                                child: Text(
                                  '\$225.00',
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w700,
                                      color: Color.fromRGBO(52, 46, 173, 1)),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          transform:
                              Matrix4.translationValues(-15.0, -5.0, 0.0),
                          child: Image.asset(
                            'images/back_blue.png',
                            width: 30,
                            height: 30,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )),
          SizedBox(height: 25),
          Container(
              height: 120,
              margin: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 240, 216, 1),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      color: Colors.grey,
                    )
                  ]),
              child: Container(
                child: ClipPath(
                  //upper clippath with less height
                  clipper: WaveClipper(), //set our custom wave clipper.
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(254, 233, 199, 1),
                        borderRadius: BorderRadius.circular(15)),
                    height: 120,
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 25),
                        Container(
                          width: 55,
                          height: 55,
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: Image.asset('images/wallet_yellow.png'),
                        ),
                        SizedBox(width: 22),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(left: 0, top: 30),
                                child: Text(
                                  'Admin’s Earnings',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w500,
                                      color: MyColor.defaultTextColor),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 0, top: 3),
                                child: Text(
                                  '\$25.00',
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w700,
                                      color: Color.fromRGBO(255, 164, 0, 1)),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
          SizedBox(height: 25),
          Container(
              height: 120,
              margin: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(238, 242, 255, 1),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      color: Colors.grey,
                    )
                  ]),
              child: Container(
                child: ClipPath(
                  //upper clippath with less height
                  clipper: WaveClipper(), //set our custom wave clipper.
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(231, 238, 255, 1),
                        borderRadius: BorderRadius.circular(15)),
                    height: 120,
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 25),
                        Container(
                          width: 55,
                          height: 55,
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: Image.asset('images/phone_wl.png'),
                        ),
                        SizedBox(width: 22),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(left: 0, top: 30),
                                child: Text(
                                  'Withdrawal',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w500,
                                      color: MyColor.defaultTextColor),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 0, top: 3),
                                child: Text(
                                  '\$200.00',
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w700,
                                      color: Color.fromRGBO(61, 117, 251, 1)),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          ),
                        ),

                        InkWell(
                          onTap: (){

                            showPackageTypeDialog();
                          },
                          child:  Container(
                              width: 120,
                              height: 49,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                      width: 2,
                                      color: Color.fromRGBO(61, 117, 251, 1))),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Request',
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w600,
                                        color: Color.fromRGBO(61, 117, 251, 1)),
                                  ),
                                ],
                              )),
                        ),


                        SizedBox(
                          width: 5,
                        )
                      ],
                    ),
                  ),
                ),
              )),

          SizedBox(height: 25),
        ],
      ),
    );
  }

  showPackageTypeDialog() {
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
                              Align(
                                  alignment: Alignment.topRight,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Padding(
                                      padding:
                                      EdgeInsets.only(top: 22, right: 18),
                                      child: Image.asset(
                                          'images/cross_rect.png',
                                          width: 22,
                                          height: 22),
                                    ),
                                  )),
                              Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Text(
                                  'Withdrawal Request',
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w800,
                                      color:MyColor.defaultTextColor),
                                ),
                              ),
                              SizedBox(height: 45),

                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 25),
                                child:  InputBoxWidget(
                                    labelText: 'Enter Amount For Withdrawal',
                                    focusNode: emailFocusNode,
                                    ),
                              ),

                              SizedBox(height: 20),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 25),
                              child:ButtonWidget('Send'),),

                              SizedBox(height: 30),

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
  void _requestFocusPass() {
    setState(() {
      FocusScope.of(context).requestFocus(emailFocusNode);
    });
  }

}

class WaveClipper extends CustomClipper<Path> {
  var value = 10;

  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);

    var firstControlPoint = Offset(size.width / 6, size.height - 40 - value);
    var firstEndPoint = Offset(size.width / 2, size.height - 20);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint =
        Offset(size.width - size.width / 6, size.height + value);
    var secondEndPoint = Offset(size.width, size.height - 30);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;

    /*var path = new Path();
    path.lineTo(0, size.height); //start path with this if you are making at bottom

    var firstStart = Offset(size.width / 5, size.height);
    //fist point of quadratic bezier curve
    var firstEnd = Offset(size.width / 2.25, size.height - 50.0);
    //second point of quadratic bezier curve
    path.quadraticBezierTo(firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    var secondStart = Offset(size.width - (size.width / 3.24), size.height - 105);
    //third point of quadratic bezier curve
    var secondEnd = Offset(size.width, size.height - 10);
    //fourth point of quadratic bezier curve
    path.quadraticBezierTo(secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);

    path.lineTo(size.width, 0); //end with this path if you are making wave at bottom
    path.close();
    return path;*/
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false; //if new instance have different instance than old instance
    //then you must return true;
  }


}
