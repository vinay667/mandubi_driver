

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mandubi_driver/colors/colors.dart';
import 'package:mandubi_driver/network/api_dialog.dart';
import 'package:mandubi_driver/network/api_helper.dart';
import 'package:mandubi_driver/screens/login_screen.dart';
import 'package:mandubi_driver/widgets/btn_widget.dart';
import 'package:mandubi_driver/widgets/input_field_password_widget.dart';
import 'package:toast/toast.dart';

class ChangePasswordFScreen extends StatefulWidget {
  final String passKEY;
  ChangePasswordFScreen(this.passKEY);
  ChangePasswordFState createState() => ChangePasswordFState(passKEY);
}

class ChangePasswordFState extends State<ChangePasswordFScreen>{
  final String passKEY;
  ChangePasswordFState(this.passKEY);
  FocusNode confirmPassFocusNode = new FocusNode();
  FocusNode newPassFocusNode = new FocusNode();
  var textControllerNewP = new TextEditingController();
  var textControllerConfirmP = new TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool showConfirmPassword=false;
  bool showNewPassword=true;
  var _fromData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.white,
   body: Form(
     key: _formKey,
     child: ListView(
       padding: EdgeInsets.symmetric(horizontal: 20),
       children: <Widget>[

         SizedBox(height: 40),



         Row(
           children: <Widget>[
             InkWell(
               onTap:(){
                 Navigator.pop(context);
               },
               child:  Image.asset('images/back_ic.png',width: 25,height: 25,),
             ),

           ],
         ),
         Text(
           'Change Password',
           style: TextStyle(
               fontSize: 26,
               fontFamily: 'Lato',
               fontWeight: FontWeight.w700,
               color: MyColor.defaultTextColor),
           textAlign: TextAlign.center,
         ),

         SizedBox(height: 5,),

         Text(
           'Please enter your new password',
           style: TextStyle(
               fontSize: 15,
               fontFamily: 'Lato',
               fontWeight: FontWeight.w400,
               color: MyColor.defaultTextColor),
           textAlign: TextAlign.center,
         ),

         SizedBox(height: 35),


         InputBoxPasswordWidget(
             labelText: 'New Password*',
             focusNode: newPassFocusNode,
             isObscureText: showNewPassword,
             controller: textControllerNewP,
             validator: passwordValidator,
             passwordIC: (){
               if(showNewPassword)
               {
                 setState(() {
                   showNewPassword=false;
                 });
               }
               else{
                 setState(() {
                   showNewPassword=true;
                 });

               }
             },
             onTapTrigger: _requestFocusNewPassword),


         SizedBox(height: 30),
         InputBoxPasswordWidget(
             labelText: 'Confirm New Password*',
             focusNode: confirmPassFocusNode,
             isObscureText: showConfirmPassword,
             validator: (val){
               if(val.isEmpty)
                 return 'Cannot be empty';
               if(val != textControllerNewP.text)
                 return 'Password and Confirm Password must be same';
               return null;
             },
             controller: textControllerConfirmP,
             passwordIC: (){
               if(showConfirmPassword)
               {
                 setState(() {
                   showConfirmPassword=false;
                 });
               }
               else{
                 setState(() {
                   showConfirmPassword=true;
                 });

               }
             },
             onTapTrigger: _requestFocusConfirmPass),

         SizedBox(height: 30),
         InkWell(
           onTap: () {

  _submitHandler(context);
           },
           child: ButtonWidget('Change Password'),
         ),


       ],
     ),
   )
    );

  }


  void _submitHandler(BuildContext context) async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    print(passKEY);
    changePassword(context);


    ///all set to login
  }
  void _requestFocusConfirmPass() {
    setState(() {
      FocusScope.of(context).requestFocus(confirmPassFocusNode);
    });
  }

  void _requestFocusNewPassword() {
    setState(() {
      FocusScope.of(context).requestFocus(newPassFocusNode);
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fromData = {
      'key': passKEY,
      'new_password': '',
      'confirm_password':'',
    };
  }

  changePassword(BuildContext context) async {

    _fromData["new_password"]=textControllerNewP.text;
    _fromData["confirm_password"]=textControllerConfirmP.text;
    FocusScope.of(context).unfocus();
    APIDialog.showAlertDialog(context, 'Changing Password...');
    ApiBaseHelper helper = new ApiBaseHelper();
    var response = await helper.postAPI(
        'reset/password',
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

      Route route = MaterialPageRoute(
          builder: (context) => LoginScreen());
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
  String passwordValidator(String value) {
    if (value.isEmpty) {
      return 'Cannot be empty';
    }
    return null;
  }

}

