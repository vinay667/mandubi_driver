import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mandubi_driver/colors/colors.dart';

class TextInput3 extends StatefulWidget {
  final String labelText;
  final Function onSaved;
  final Function validator;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget prefixIcon;
  String text;
  FocusNode focusNode;
  Function onTapTrigger;
  var controller;




  TextInput3({
    this.labelText,
    this.onSaved,
    this.validator,
    this.keyboardType,
    this.obscureText: false,
    this.prefixIcon,
    this.text,
    this.focusNode, this.onTapTrigger,this.controller,

  });

  @override
  _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<TextInput3> {



  @override
  Widget build(BuildContext context) {

    return Container(

      child:Stack(
        children: <Widget>[




          TextFormField(
            onTap: widget.onTapTrigger,
            focusNode: widget.focusNode,
            controller: widget.controller,
            validator: widget.validator,

            style: TextStyle(
                fontSize: 17.0,
                color: MyColor.defaultTextColor,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500),
            decoration: new InputDecoration(
              labelText: widget.labelText,
              prefixIcon: widget.prefixIcon,
              labelStyle: TextStyle(
                color: widget.focusNode.hasFocus
                    ? MyColor.defaultTextColor
                    : Color.fromRGBO(128,128,128,1),
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
                fontSize: widget.focusNode.hasFocus?22:17,
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
            child: GestureDetector(
              onTap: (){
                widget.onSaved();
              },
              child: Container(

                  height: 22,
                  margin: EdgeInsets.only(right: 15,top: 18),
                  child: Text(widget.focusNode.hasFocus?'Save':'Edit',style: TextStyle(
                      fontSize: 17.0,
                      decoration: TextDecoration.underline,
                      color: widget.focusNode.hasFocus?MyColor.themeColor:Color.fromRGBO(218,218,218,1),
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
