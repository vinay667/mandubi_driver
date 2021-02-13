import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mandubi_driver/colors/colors.dart';
import 'package:mandubi_driver/widgets/input_field_widget.dart';

class FilterScreen extends StatefulWidget {
  FilterState createState() => FilterState();
}

class FilterState extends State<FilterScreen>{
  int valueHolder = 20;
  FocusNode fromFocusNode = new FocusNode();
  FocusNode toNoFocusNode = new FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(height: 20),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: InputBoxWidget(
              labelText: 'To',
              focusNode: fromFocusNode,
              onTapTrigger:_requestFocusSource,
            ),
          ),
          SizedBox(height: 12),




          Container(
             // color: Colors.purple,
            child:   Stack(
              children: <Widget>[

               SliderTheme(
                   data: SliderThemeData(

                       thumbShape: RoundSliderThumbShape(enabledThumbRadius: 6.5),

                   ),

                 child: Slider(
                     value: valueHolder.toDouble(),
                     min: 1,
                     max: 40,
                     //divisions: 40,
                     activeColor:MyColor.themeColor,
                     inactiveColor: MyColor.themeColor.withOpacity(0.3),
                     label: '${valueHolder.round()}',
                     onChanged: (double newValue) {
                       setState(() {
                         valueHolder = newValue.round();
                       });
                     },
                     //Color.fromRGBO(255,243,230,1),
                     semanticFormatterCallback: (double newValue) {
                       return '${newValue.round()}';
                     }
                 ),



               ),
                Container(

                  transform: Matrix4.translationValues(14.5, 19.0, 0.0),
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(width: 1.5,color: MyColor.themeColor)
                  ),
                ),

              Padding(
                padding: EdgeInsets.only(left: 15,right: 15,top: 33),
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '0KM',
                      style: TextStyle(
                          fontSize: 13,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w500,
                          color: MyColor.defaultTextColor.withOpacity(0.8)),
                    ),



                    Text(
                      '10KM',
                      style: TextStyle(
                          fontSize: 13,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w500,
                          color: MyColor.defaultTextColor.withOpacity(0.8)),
                    ),

                    Text(
                      '20KM',
                      style: TextStyle(
                          fontSize: 13,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w500,
                          color: MyColor.defaultTextColor.withOpacity(0.8)),
                    ),

                    Text(
                      '30KM',
                      style: TextStyle(
                          fontSize: 13,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w500,
                          color: MyColor.defaultTextColor.withOpacity(0.8)),
                    ),

                    Text(
                      '40KM',
                      style: TextStyle(
                          fontSize: 13,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w500,
                          color: MyColor.defaultTextColor.withOpacity(0.8)),
                    ),




                  ],
                )
                ,
              )

              ],
            )
          ),


          SizedBox(height: 33),


          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: InputBoxWidget(
              labelText: 'From',
              focusNode: toNoFocusNode,
              onTapTrigger:_requestFocusDesti,
            ),
          ),


          SizedBox(
            height: 40,
          ),


         Container(
           margin: EdgeInsets.symmetric(horizontal: 15),
           child:  ClipRRect(
             borderRadius: BorderRadius.circular(8),
             child: Image.asset('images/map_dum.jpg',
                 height: 230,

                 width: MediaQuery.of(context).size.width - 20,
                 fit: BoxFit.fill),
           ),

         ),
          SizedBox(
            height: 25,
          ),








        ],


      ),

      
    );

  }




  void _requestFocusSource() {
    setState(() {
      FocusScope.of(context).requestFocus(fromFocusNode);
    });
  }

  void _requestFocusDesti() {
    setState(() {
      FocusScope.of(context).requestFocus(toNoFocusNode);
    });
  }

}
