import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mandubi_driver/colors/colors.dart';
import 'package:mandubi_driver/network/api_dialog.dart';
import 'package:mandubi_driver/network/api_helper.dart';
import 'package:mandubi_driver/screens/change_password_forgot_screen.dart';
import 'package:mandubi_driver/widgets/btn_widget.dart';
import 'package:mandubi_driver/widgets/input2.dart';
import 'package:mandubi_driver/widgets/language_widget.dart';
import 'package:mandubi_driver/widgets/pin.dart';
import 'package:toast/toast.dart';
class OTPScreen extends StatefulWidget {
  final String userPhone;
  OTPScreen(this.userPhone);
  OTPState createState() => OTPState();
}

class OTPState extends State<OTPScreen>{
  FocusNode emailFocusNode = new FocusNode();
  var _fromData;
  String userOtp='';
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Colors.deepPurpleAccent),
      borderRadius: BorderRadius.circular(15.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.white,
      body: Container(
        color: Colors.white,
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[

            SizedBox(height: 30),

            Row(
              children: <Widget>[

                Spacer(),
                LanguageWidget(),


              ],
            ),
            SizedBox(height: 10),

            Container(
              width: 140,
             height: 140,
             decoration: BoxDecoration(
               color: Color.fromRGBO(245,243,243,1),
               shape: BoxShape.circle,


             ),
              child: Container(
                width: 50,
                height: 50,
                padding: EdgeInsets.only(bottom: 13),
             //   transform: Matrix4.translationValues(0.0, 20.0, 0.0),
                child: Image.asset('images/otp_imag.png',height: 30,width: 40,),
              )
            ),

            SizedBox(height: 25),

            Text(
              'OTP Verification',
              style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w800,
                  color: MyColor.defaultTextColor),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 20),


            Text(
              'Enter The OTP',
              style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w400,
                  color: MyColor.defaultTextColor),
              textAlign: TextAlign.center,
            ),






            Container(
              height: 90,
              color: Colors.white,
             // margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.all(20.0),
              child: PinPut(

                fieldsCount: 6,
                onSubmit: (String pin) => _showSnackBar(pin, context),
                focusNode: _pinPutFocusNode,
                onChanged: (value){
                  //print(value);
                  userOtp=value.toString();
                  print(userOtp);
                },
                controller: _pinPutController,
                submittedFieldDecoration:  _pinPutDecoration.copyWith(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                      color: Color.fromRGBO(234,234,234,1)
                  ),
                ),
                selectedFieldDecoration: _pinPutDecoration.copyWith(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: MyColor.themeColor,
                    width: 1.5
                  ),
                ),
                followingFieldDecoration: _pinPutDecoration.copyWith(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: Color.fromRGBO(234,234,234,1)
                  ),
                ),
              ),
            ),






            SizedBox(height: 18),

            InkWell(
              onTap: (){
              if(userOtp.length!=6)
                {
                  Toast.show('OTP length must be 6', context,
                      duration: Toast.LENGTH_LONG,
                      gravity: Toast.BOTTOM,
                      backgroundColor: Colors.black);
                }
              else{
  verifyOTP(context);
              }


                //Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangePasswordFScreen()));
              },
              child:  ButtonWidget('Verify'),
            )

          ],



        ),
      )




    );

  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fromData = {
      'mobile': '',
      'otp':''
    };
  }

  verifyOTP(BuildContext context) async {
    FocusScope.of(context).unfocus();
    _fromData["mobile"]=widget.userPhone;
    _fromData["otp"]=userOtp;

    APIDialog.showAlertDialog(context, 'Verifying OTP...');
    ApiBaseHelper helper = new ApiBaseHelper();
    var response = await helper.postAPI(
        'verify/otp',
        _fromData,
        context);
    Navigator.pop(context);
    print(response);

    if(response['status'].toString()=='200')

    {
      String key=response['key'].toString();
      print(key);
      Toast.show(response['message'], context,
          duration: Toast.LENGTH_LONG,
          gravity: Toast.BOTTOM,
          backgroundColor: Colors.black);


    //  Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangePasswordFScreen(key)));


       Route route = MaterialPageRoute(
          builder: (context) => ChangePasswordFScreen(key));
      Navigator.pushAndRemoveUntil(
          context, route, (Route<dynamic> route) => false);
    }
    else{

      Toast.show(response['message'], context,
          duration: Toast.LENGTH_LONG,
          gravity: Toast.BOTTOM,
          backgroundColor: Colors.black);
    }




  }
}
void _showSnackBar(String pin, BuildContext context) {
  final snackBar = SnackBar(
    duration: const Duration(seconds: 3),
    content: Container(
      height: 80.0,
      child: Center(
        child: Text(
          'Pin Submitted. Value: $pin',
          style: const TextStyle(fontSize: 25.0),
        ),
      ),
    ),
    backgroundColor: Colors.deepPurpleAccent,
  );
  Scaffold.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}
