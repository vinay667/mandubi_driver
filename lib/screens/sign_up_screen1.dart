import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mandubi_driver/colors/colors.dart';
import 'package:mandubi_driver/screens/login_screen.dart';
import 'package:mandubi_driver/screens/sign_up_screen2.dart';
import 'package:mandubi_driver/widgets/btn_widget.dart';
import 'package:mandubi_driver/widgets/input2.dart';
import 'package:mandubi_driver/widgets/input_field_widget.dart';

class SignUp1Screen extends StatefulWidget {
  SignUp1ScreenState createState() => SignUp1ScreenState();
}

class SignUp1ScreenState extends State<SignUp1Screen> {
  FocusNode emailFocusNode = new FocusNode();
  FocusNode passwordFocusNode = new FocusNode();
  FocusNode phoneFocusNode = new FocusNode();
  FocusNode lNameFocusNode = new FocusNode();
  var textControllerUsername = new TextEditingController();
  var textControllerEmail = new TextEditingController();
  var textControllerPhone = new TextEditingController();
  var textControllerLastName = new TextEditingController();
  var _fromData;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
                          margin: EdgeInsets.only(top: 10,right: 10),
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

                  SizedBox(height: 50),
                  InputBoxWidget(
                      labelText: 'First Name',
                      focusNode: emailFocusNode,
                      validator: userNameValidator,
                      controller: textControllerUsername,
                      onTapTrigger: _requestFocusEmail),
                  SizedBox(height: 30),
                  InputBoxWidget(
                      labelText: 'Last Name',
                      focusNode: lNameFocusNode,
                      validator: userNameValidator,
                      controller: textControllerLastName,
                      onTapTrigger: _requestFocusLastName),
                  SizedBox(height: 30),
                  Container(
                    child: TextInput2(
                        keyboardType: TextInputType.number,
                        labelText: 'Phone Number',
                        focusNode: phoneFocusNode,
                        validator: phoneValidator,
                        controller: textControllerPhone,
                        onTapTrigger: _requestFocusPhone,
                        prefixIcon: new Padding(
                          padding: EdgeInsets.only(left: 5,right: 5),
                          child:  Image.asset('images/flag_ic.png',width: 40,height: 40,),


                        )
                    ),
                  ),



                  SizedBox(height: 30),
                  InputBoxWidget(
                      labelText: 'Email',
                      focusNode: passwordFocusNode,
                      controller: textControllerEmail,
                      validator: emailValidator,
                      onTapTrigger: _requestFocusPass),

                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      _submitHandler(context);
                    },
                    child: ButtonWidget('Next'),
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
                            padding: EdgeInsets.only(top: 45),
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

                  SizedBox(height: 20),
                ],
              ),
            )));
  }

  void _requestFocusEmail() {
    setState(() {
      FocusScope.of(context).requestFocus(emailFocusNode);
    });
  }


  void _requestFocusLastName() {
    setState(() {
      FocusScope.of(context).requestFocus(lNameFocusNode);
    });
  }
  void _requestFocusPhone() {
    setState(() {
      FocusScope.of(context).requestFocus(phoneFocusNode);
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
  String emailValidator(String value) {
    if (value.isEmpty ||
        !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
      return 'Email is required and should be valid Email address.';
    }
    return null;
  }

  String passwordValidator(String value) {
    if (value.isEmpty || value.length < 5) {
      return 'Password is required.';
    }
    return null;
  }



  String userNameValidator(String value) {
    if (value.isEmpty) {
      return 'Name cannot be empty';
    }
    return null;
  }



  void _submitHandler(BuildContext context) async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => SignUp2Screen(textControllerUsername.text,textControllerLastName.text,textControllerPhone.text,textControllerEmail.text)));

    ///all set to login
  }

}
