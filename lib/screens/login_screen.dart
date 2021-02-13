import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mandubi_driver/colors/colors.dart';
import 'package:mandubi_driver/model/user_model.dart';
import 'package:mandubi_driver/network/Utils.dart';
import 'package:mandubi_driver/network/api_dialog.dart';
import 'package:mandubi_driver/network/api_helper.dart';
import 'package:mandubi_driver/screens/driver_dashboard_screen.dart';
import 'package:mandubi_driver/screens/forgot_password_screen.dart';
import 'package:mandubi_driver/screens/landing_screen.dart';
import 'package:mandubi_driver/screens/sign_up_screen1.dart';
import 'package:mandubi_driver/widgets/btn_widget.dart';
import 'package:mandubi_driver/widgets/input2.dart';
import 'package:mandubi_driver/widgets/input_field_password_widget.dart';
import 'package:mandubi_driver/widgets/input_field_widget.dart';
import 'package:mandubi_driver/widgets/language_widget.dart';
import 'package:toast/toast.dart';

class LoginScreen extends StatefulWidget {
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  FocusNode emailFocusNode = new FocusNode();
  FocusNode passwordFocusNode = new FocusNode();
  bool showPassword=true;
  var textControllerEmail = new TextEditingController();
  var textControllerPassword = new TextEditingController();
  var _fromData;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  //SizedBox(height: 70),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Container(),
                      ),

                      LanguageWidget(),



                    ],
                  ),

                  Text(
                    'Welcome \nSign In',
                    style: TextStyle(
                        fontSize: 35,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w700,
                        height: 1.1,
                        color: MyColor.defaultTextColor),
                  ),

                  SizedBox(height: 30),

                  Container(
                    // height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          transform: Matrix4.translationValues(-25, 0.0, 0.0),
                          child: Image.asset('images/log1.png', height: 55),
                        ),
                        Container(
                          transform: Matrix4.translationValues(-15.0, 0.0, 0.0),
                          margin: EdgeInsets.only(top: 6),
                          child: Image.asset('images/log3.png', height: 48),
                        ),
                        Container(
                          transform: Matrix4.translationValues(20.0, 0.0, 0.0),
                          margin: EdgeInsets.only(top: 32),
                          child: Image.asset('images/log2.png', height: 22),
                        ),
                      ],
                    ),
                  ),

                  Container(height: 1, color: Colors.black38.withOpacity(0.2)),

                  SizedBox(height: 60),


                  Container(
                    child: TextInput2(
                      keyboardType: TextInputType.number,
                        labelText: 'Phone Number',
                        focusNode: emailFocusNode,
                        validator: phoneValidator,
                        controller: textControllerEmail,
                        onTapTrigger: _requestFocusEmail,
                      prefixIcon: new Padding(
                          padding: EdgeInsets.only(left: 5,right: 5),
                        child:  Image.asset('images/flag_ic.png',width: 40,height: 40,),


                      )
                    ),
                  ),



                  SizedBox(height: 30),
                  InputBoxPasswordWidget(
                      labelText: 'Password',
                      focusNode: passwordFocusNode,
                      isObscureText: showPassword,
                      controller: textControllerPassword,
                      validator: passwordValidator,
                      onTapTrigger: _requestFocusPass,
                    passwordIC: (){
                        if(showPassword)
                          {
                            setState(() {
                              showPassword=false;
                            });
                          }
                        else{
                          setState(() {
                            showPassword=true;
                          });

                        }
                    },

                  ),

                  SizedBox(height: 45),
                  InkWell(
                    onTap: () {


                      _submitHandler(context);



                    },
                    child: ButtonWidget('Sign In'),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      InkWell(
                          onTap: () {
                             Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUp1Screen()));
                          },
                          child: Padding(
                            padding: EdgeInsets.only(top: 35),
                            child: Text(
                              ' Sign Up',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Lato',
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.w900,
                                  color: MyColor.defaultTextColor),
                            ),
                          )),

                      Padding(
                        padding: EdgeInsets.only(top: 35),
                        child:GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPasswordScreen()));
                          },
                          child:  Text(
                            'Forget password?',
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline,
                                color: MyColor.defaultTextColor),
                          ),
                        )
                      )
                    ],
                  ),




                  Center(
                    child:    Container(
                      margin: EdgeInsets.only(right: 20),
                      child: Image.asset('images/finger_icon.png',
                          width: 65, height: 100),
                    ),
                  ),
                  SizedBox(height: 10),






                ],
              ),
            )));
  }

  void _requestFocusEmail() {
    setState(() {
      FocusScope.of(context).requestFocus(emailFocusNode);
    });
  }

  void _requestFocusPass() {
    setState(() {
      FocusScope.of(context).requestFocus(passwordFocusNode);
    });
  }

  String phoneValidator(String value) {
    if (value.isEmpty || value.length<10) {
      return 'Phone is required and should be between 10-15 digits';
    }
    return null;
  }

  String passwordValidator(String value) {
    if (value.isEmpty || value.length < 5) {
      return 'Password is required.';
    }
    return null;
  }


  void _submitHandler(BuildContext context) async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();

   loginUser(context);

    ///all set to login
  }

  loginUser(BuildContext context) async {
    _fromData["mobile"]=textControllerEmail.text;
    _fromData["password"]=textControllerPassword.text;
    _fromData["device_token"]='This is dummy token';
    FocusScope.of(context).unfocus();
    APIDialog.showAlertDialog(context, 'Logging in...');
    ApiBaseHelper helper = new ApiBaseHelper();
    var response = await helper.postAPI(
        'login',
        _fromData,
        context);
    Navigator.pop(context);
    print(response);


    if(response['status'].toString()=='200')

      {

        _saveUserDetail(response);
        Toast.show('Logged in Successfully !!', context,
            duration: Toast.LENGTH_LONG,
            gravity: Toast.BOTTOM,
            backgroundColor: Colors.black);
        Route route = MaterialPageRoute(
            builder: (context) => LandingScreen());
        Navigator.pushAndRemoveUntil(
            context, route, (Route<dynamic> route) => false);
      }
    else{

      Toast.show(response['error'], context,
          duration: Toast.LENGTH_LONG,
          gravity: Toast.BOTTOM,
          backgroundColor: Colors.black);
    }




  }
  _saveUserDetail(var response) async {
    UserModel.setAccessToken(response['data']['token']);
    UserModel.setUserId(response['data']['id'].toString());
    MyUtils.saveSharedPreferences('access_token', response['data']['token']);
    MyUtils.saveSharedPreferences('id', response['data']['id'].toString());
    MyUtils.saveSharedPreferences('email', response['data']['email']);
    MyUtils.saveSharedPreferences('name', response['data']['name']);
    MyUtils.saveSharedPreferences('mobile', response['data']['mobile']);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fromData = {
      'mobile': '',
      'password': '',
      'device_type':'android',
      'device_token':'',
      'device_id':'ahdgfdgfef'
    };
  }


}
