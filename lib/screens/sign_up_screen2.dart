import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mandubi_driver/colors/colors.dart';
import 'package:mandubi_driver/network/api_dialog.dart';
import 'package:mandubi_driver/network/constants.dart';
import 'package:mandubi_driver/screens/login_screen.dart';
import 'package:mandubi_driver/screens/sign_up_screen1.dart';
import 'package:mandubi_driver/widgets/btn_widget.dart';
import 'package:mandubi_driver/widgets/input_field_password_widget.dart';
import 'package:mandubi_driver/widgets/input_field_widget.dart';
import 'package:toast/toast.dart';

class SignUp2Screen extends StatefulWidget {
  String userName,lName,phone, email;

  SignUp2Screen(this.userName,this.lName, this.phone, this.email);

  SignUp2State createState() => SignUp2State(userName,lName, phone, email);
}

class SignUp2State extends State<SignUp2Screen> {
  String userName, phone, email,lName;

  SignUp2State(this.userName,this.lName, this.phone, this.email);

  FocusNode emailFocusNode = new FocusNode();
  FocusNode passwordFocusNode = new FocusNode();
  bool showPassword = false;
  bool showConfirmPassword = false;
  var textControllerPassword = new TextEditingController();
  var textControllerCnfmPassword = new TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  File _image1;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  //SizedBox(height: 70),

                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(),
                      ),
                      Container(
                          transform: Matrix4.translationValues(10.0, 0.0, 0.0),
                          width: 42,
                          height: 42,
                          margin: EdgeInsets.only(top: 10, right: 10),
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(242, 242, 242, 1),
                              shape: BoxShape.circle),
                          child: Center(
                            child: Text(
                              'En',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w600,
                                  color: MyColor.defaultTextColor),
                            ),
                          ))
                    ],
                  ),

                  Text(
                    'Create \nAn account',
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
                          transform: Matrix4.translationValues(-25.0, 0.0, 0.0),
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

                  SizedBox(height: 45),
                  InputBoxPasswordWidget(
                    labelText: 'Password*',
                    focusNode: emailFocusNode,
                    validator: passwordValidator,
                    controller: textControllerPassword,
                    isObscureText: showPassword,
                    onTapTrigger: _requestFocusEmail,
                    passwordIC: () {
                      if (showPassword) {
                        setState(() {
                          showPassword = false;
                        });
                      } else {
                        setState(() {
                          showPassword = true;
                        });
                      }
                    },
                  ),
                  SizedBox(height: 30),
                  InputBoxPasswordWidget(
                    labelText: 'Confirm Password*',
                    focusNode: passwordFocusNode,
                    controller: textControllerCnfmPassword,
                    isObscureText: showConfirmPassword,
                    validator: confirmPValidator,
                    onTapTrigger: _requestFocusPass,
                    passwordIC: () {
                      if (showConfirmPassword) {
                        setState(() {
                          showConfirmPassword = false;
                        });
                      } else {
                        setState(() {
                          showConfirmPassword = true;
                        });
                      }
                    },
                  ),

                  SizedBox(height: 25),

                  Text(
                    'Upload Driver License',
                    style: TextStyle(
                        fontSize: 17,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        color: MyColor.defaultTextColor),
                  ),

                  SizedBox(height: 15),

                  Row(
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          getLicenseImage();
                        },
                        child: Container(
                          width: 70,
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: MyColor.borderColor)),
                          child: Padding(
                            padding: EdgeInsets.all(15),
                            child: _image1 == null
                                ? Image.asset('images/gallery_ic.png')
                                : Image.file(_image1),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),

                      /*  Container(
                     width: 70,
                     height: 60,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(15),
                         border: Border.all(color: MyColor.borderColor)
                   ),
                   child: Padding(
                     padding: EdgeInsets.all(15),
                     child: Image.asset('images/gallery_ic.png'),
                   ),
                 ),*/
                    ],
                  ),

                  SizedBox(height: 45),
                  InkWell(
                    onTap: () {
                      _submitHandler(context);
                    },
                    child: ButtonWidget('Sign Up'),
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
                                    builder: (context) => LoginScreen()));
                          },
                          child: Padding(
                            padding: EdgeInsets.only(top: 35),
                            child: Text(
                              ' Sign in',
                              style: TextStyle(
                                  fontSize: 19,
                                  fontFamily: 'Lato',
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.w900,
                                  color: MyColor.defaultTextColor),
                            ),
                          )),
                    ],
                  ),
                  SizedBox(height: 25),
                ],
              ),
            )));
  }

  void _requestFocusEmail() {
    setState(() {
      FocusScope.of(context).requestFocus(emailFocusNode);
    });
  }

  void _submitHandler(BuildContext context) async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    _checkImageStatus();

    ///all set to login
  }

  void _requestFocusPass() {
    setState(() {
      FocusScope.of(context).requestFocus(passwordFocusNode);
    });
  }

  _checkImageStatus() {
    if (_image1 == null) {
      Toast.show('Please upload driving license to continue !!', context,
          duration: Toast.LENGTH_LONG,
          gravity: Toast.BOTTOM,
          backgroundColor: Colors.black);
    } else {
      print('all set');
      createDriver();
      //api call
    }
  }

  String emailValidator(String value) {
    if (value.isEmpty ||
        !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
      return 'Email is required and should be valid Email address.';
    }
    return null;
  }

  String passwordValidator(String value) {
    if (value.isEmpty || value.length < 6) {
      return 'Password is required and must be atleast 5 disgits';
    }
    return null;
  }

  String confirmPValidator(String value) {
    if (value != textControllerPassword.text) {
      return 'Password and confirm Password should match';
    }
    return null;
  }

  Future getLicenseImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image1 = File(pickedFile.path);
    });
  }

  createDriver() async {
    APIDialog.showAlertDialog(context, 'Creating Account...');
    try {
      var formData = FormData.fromMap({
        'fname': userName,
        'device_id': 'gvccxdg',
        'device_type': Platform.isAndroid ? 'android' : 'ios',
        'email': email,
        'mobile': phone,
        'password': textControllerPassword.text,
        'confirm_password': textControllerCnfmPassword.text,
        'proof_of_insurance': await MultipartFile.fromFile(_image1.path,
            filename: "insurance_pic.jpg"),
        'driver_license': await MultipartFile.fromFile(_image1.path,
            filename: "driving_license_pic.jpg"),
        'device_token': 'XjdAggfAhgAff',
        'lname': lName
      });
      print(formData.fields);
      Dio dio = new Dio();
      print('Api Called');
      final responseDio =
          await dio.post(AppConstant.appBaseURL + 'signup', data: formData);
      Navigator.of(context, rootNavigator: true).pop();

      var response = responseDio.data;
      print(response);

      if (response['status'].toString() == '200') {
        Toast.show('Account created successfully !!', context,
            duration: Toast.LENGTH_LONG,
            gravity: Toast.BOTTOM,
            backgroundColor: Colors.black);

        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
            (Route<dynamic> route) => false);
      } else {
        Toast.show(response['error'], context,
            duration: Toast.LENGTH_LONG,
            gravity: Toast.BOTTOM,
            backgroundColor: Colors.black);
      }
    } on DioError catch (errorMessage) {
      Navigator.pop(context);
      String message = errorMessage.response.toString();
      print(message);
    }
  }
}
