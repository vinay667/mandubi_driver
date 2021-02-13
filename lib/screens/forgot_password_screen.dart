import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mandubi_driver/colors/colors.dart';
import 'package:mandubi_driver/network/api_dialog.dart';
import 'package:mandubi_driver/network/api_helper.dart';
import 'package:mandubi_driver/screens/otp_screen.dart';
import 'package:mandubi_driver/widgets/btn_widget.dart';
import 'package:mandubi_driver/widgets/input2.dart';
import 'package:mandubi_driver/widgets/language_widget.dart';
import 'package:toast/toast.dart';

class ForgotPasswordScreen extends StatefulWidget {
  ForgotPasswordState createState() => ForgotPasswordState();
}

class ForgotPasswordState extends State<ForgotPasswordScreen>{
  FocusNode emailFocusNode = new FocusNode();
  var textControllerPhone = new TextEditingController();

  var _fromData;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.white,
      body: Container(
        color: Colors.white,
        margin: EdgeInsets.symmetric(horizontal: 20),
        child:Form(
          key: _formKey,
          child:  ListView(
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
                    padding: EdgeInsets.only(left: 10,right: 10,bottom: 30),
                    transform: Matrix4.translationValues(0.0, 20.0, 0.0),
                    child: Image.asset('images/forgot_ic.png',),
                  )
              ),

              SizedBox(height: 25),

              Text(
                'Forgot Password',
                style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w800,
                    color: MyColor.defaultTextColor),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 10),


              Text(
                'We will send you an One time Password \non this mobile number ',
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w400,
                    color: MyColor.defaultTextColor),
                textAlign: TextAlign.center,
              ),



              SizedBox(height: 40),



              Container(
                child: TextInput2(
                    keyboardType: TextInputType.number,
                    labelText: 'Phone Number',
                    controller: textControllerPhone,
                    focusNode: emailFocusNode,
                    validator: phoneValidator,
                    onTapTrigger: _requestFocusEmail,
                    prefixIcon: new Padding(
                      padding: EdgeInsets.only(left: 5,right: 5),
                      child:  Image.asset('images/flag_ic.png',width: 40,height: 40,),


                    )
                ),
              ),
              SizedBox(height: 30),

              InkWell(
                onTap: (){
                  _submitHandler(context);
                 // Navigator.push(context, MaterialPageRoute(builder: (context)=>OTPScreen()));
                },
                child:   ButtonWidget('Reset Password'),
              )

            ],



          ),
        )
      )




    );

  }



  void _requestFocusEmail() {
    setState(() {
      FocusScope.of(context).requestFocus(emailFocusNode);
    });
  }
  String phoneValidator(String value) {
    if (value.isEmpty || value.length<10) {
      return 'Phone is required and should be between 10-15 digits';
    }
    return null;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fromData = {
      'mobile': '',
    };
  }
  void _submitHandler(BuildContext context) async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
   forgotPassword(context);

    ///all set to login
  }
  forgotPassword(BuildContext context) async {
    FocusScope.of(context).unfocus();
    _fromData["mobile"]=textControllerPhone.text;

    APIDialog.showAlertDialog(context, 'Please wait...');
    ApiBaseHelper helper = new ApiBaseHelper();
    var response = await helper.postAPI(
        'forgot/password',
        _fromData,
        context);
    Navigator.pop(context);
    print(response);

    if(response['status'].toString()=='200')

    {
      Toast.show(response['message'], context,
          duration: Toast.LENGTH_LONG,
          gravity: Toast.BOTTOM,
          backgroundColor: Colors.black);
      Navigator.push(context, MaterialPageRoute(builder: (context)=>OTPScreen(textControllerPhone.text)));

    }
    else{

      Toast.show(response['error'], context,
          duration: Toast.LENGTH_LONG,
          gravity: Toast.BOTTOM,
          backgroundColor: Colors.black);
    }




  }

}
