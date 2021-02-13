import 'package:flutter/material.dart';
import 'package:mandubi_driver/colors/colors.dart';

class InputBoxProfileWidget extends StatelessWidget {
  FocusNode focusNode;
  Function onTapTrigger;
  String labelText;
  bool isObscureText;
  final controller;
   Function validator;
   final isEnabled;
   Function onSaved;


  InputBoxProfileWidget({this.focusNode, this.onTapTrigger, this.labelText,this.isObscureText,this.controller,this.validator,this.isEnabled,this.onSaved});

  @override
  Widget build(BuildContext context) {
    return Container(
    //  height: 58,
      child: Stack(
        children: <Widget>[

          TextFormField(
            validator: validator,
            obscureText: isObscureText==null?false:isObscureText,
            onTap: onTapTrigger,
            focusNode: focusNode,
            controller: controller,
            style: TextStyle(
                fontSize: 17.0,
                color: MyColor.defaultTextColor,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500),
            decoration: new InputDecoration(
              labelText: labelText,
              labelStyle: TextStyle(
                color: focusNode.hasFocus
                    ? MyColor.defaultTextColor
                    : Color.fromRGBO(128,128,128,1),
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
                fontSize: focusNode.hasFocus?22:17,
              ),
              fillColor: Colors.white,
              //  contentPadding: EdgeInsets.only(top: 10,bottom: 10,right: 10,left: 20),
              contentPadding: EdgeInsets.only(left: 20,right: 50,top: 27,bottom: 10),
              enabledBorder: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(10.0),
                borderSide: new BorderSide(
                    color: MyColor.borderColor, width: 1.5),
              ),
              focusedBorder: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(10.0),
                borderSide:
                new BorderSide(color: MyColor.borderColor, width: 1.5),
              ),

              focusedErrorBorder: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(10.0),
                borderSide:
                new BorderSide(color: Colors.red, width: 1),
              ),
              errorBorder: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(10.0),
                borderSide:
                new BorderSide(color: Colors.red, width: 1),
              ),
              disabledBorder: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(10.0),
                borderSide:
                new BorderSide(color: MyColor.textFiledInActiveColor, width: 1),
              ),
              //fillColor: Colors.green
            ),
            keyboardType: TextInputType.emailAddress,
          ),

          Align(
            alignment: Alignment.centerRight,
            child:GestureDetector(
              onTap: (){
                onSaved();
              },
              child:  Container(

                  height: 22,
                  margin: EdgeInsets.only(right: 15,top: 18),
                  child: Text(focusNode.hasFocus?'Save':'Edit',style: TextStyle(
                      fontSize: 17.0,
                      decoration: TextDecoration.underline,
                      color: focusNode.hasFocus?MyColor.themeColor:Color.fromRGBO(218,218,218,1),
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500))
              ),
            )
          )



        ],
      )
    );
  }
}
