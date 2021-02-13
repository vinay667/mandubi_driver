

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mandubi_driver/colors/colors.dart';

class ButtonWidget extends StatelessWidget
{
  final String btnText;
  ButtonWidget(this.btnText);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
          color: MyColor.themeColor,
          borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Text(
          btnText,
          style: TextStyle(
              fontSize: 22,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w700,
              color: Colors.white),
        ),
      )
    );
  }

}