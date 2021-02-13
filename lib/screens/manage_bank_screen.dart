import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mandubi_driver/colors/colors.dart';
import 'package:mandubi_driver/widgets/btn_widget.dart';
import 'package:mandubi_driver/widgets/input_field_bank_widget.dart';
import 'package:mandubi_driver/widgets/input_field_profile_widget.dart';
import 'package:mandubi_driver/widgets/input_field_widget.dart';
import 'package:mandubi_driver/widgets/toolbar_widget.dart';

class ManageBankScreen extends StatefulWidget {
  ManageBankState createState() => ManageBankState();
}

class ManageBankState extends State<ManageBankScreen>{
  FocusNode nameFocusNode = new FocusNode();
  FocusNode accountNoFocusNode = new FocusNode();
  FocusNode IFSCFocusNode = new FocusNode();
  FocusNode bankNameFocusNode = new FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.white,
      body:Column(
       // padding: EdgeInsets.zero,
        children: <Widget>[
          ToolbarWidget('Manage Bank Details'),


         Expanded(
           child:  ListView(
             padding: EdgeInsets.symmetric(horizontal: 18),
             children: <Widget>[

               SizedBox(height: 20),


               InputBoxWidget(
                 labelText: 'A/C Holder Name*',
                 focusNode: nameFocusNode,
                 onTapTrigger: _requestFocusACName,
               ),




               SizedBox(height: 30),




               InputBoxBankWidget(
                   labelText: 'A/C Number*',
                   focusNode: accountNoFocusNode,
                   iconURI: 'images/calc_ic.png',
                   onTapTrigger: _requestFocusACNo),
               SizedBox(height: 30),
               InputBoxWidget(
                 labelText: 'IFSC Code*',
                 focusNode: IFSCFocusNode,
                 onTapTrigger: _requestFocusIFSC,
               ),
               SizedBox(height: 30),





               InputBoxBankWidget(
                   labelText: 'Bank Name*',
                   focusNode: bankNameFocusNode,
                   iconURI: 'images/bank_ic.png',
                   onTapTrigger: _requestFocusBankName),

               SizedBox(height: 45),
               InkWell(
                 onTap: () {

                 },
                 child: ButtonWidget('Add Account'),
               ),
               SizedBox(height: 35),


               Text(
                 'Add Another Account',
                 style: TextStyle(
                     fontSize: 18,
                     fontFamily: 'Lato',
                     decoration: TextDecoration.underline,
                     fontWeight: FontWeight.w900,
                     color: MyColor.defaultTextColor),
               ),

             ],
           ),
         )

        ],
      ),
    );

  }



  void _requestFocusACName() {
    setState(() {
      FocusScope.of(context).requestFocus(nameFocusNode);
    });
  }

  void _requestFocusACNo() {
    setState(() {
      FocusScope.of(context).requestFocus(accountNoFocusNode);
    });
  }
  void _requestFocusIFSC() {
    setState(() {
      FocusScope.of(context).requestFocus(IFSCFocusNode);
    });
  }

  void _requestFocusBankName() {
    setState(() {
      FocusScope.of(context).requestFocus(bankNameFocusNode);
    });
  }


}
