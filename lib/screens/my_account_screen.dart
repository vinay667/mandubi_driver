import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mandubi_driver/colors/colors.dart';
import 'package:mandubi_driver/model/user_model.dart';
import 'package:mandubi_driver/network/api_dialog.dart';
import 'package:mandubi_driver/network/api_helper.dart';
import 'package:mandubi_driver/network/constants.dart';
import 'package:mandubi_driver/network/no_internet_check.dart';
import 'package:mandubi_driver/widgets/input2.dart';
import 'package:mandubi_driver/widgets/input3.dart';
import 'package:mandubi_driver/widgets/input_field_email.dart';
import 'package:mandubi_driver/widgets/input_field_profile_widget.dart';
import 'package:mandubi_driver/widgets/input_field_widget.dart';
import 'package:toast/toast.dart';

class MyAccountScreen extends StatefulWidget {
  MyAccountState createState() => MyAccountState();
}

class MyAccountState extends State<MyAccountScreen> {
  FocusNode nameFocusNode = new FocusNode();
  String licenseImage='';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FocusNode phoneFocusNode = new FocusNode();
  FocusNode emailFocusNode = new FocusNode();
  FocusNode lNameFocusNode = new FocusNode();
  FocusNode addressFocusNode = new FocusNode();
  var nameController = new TextEditingController();
  var phoneController = new TextEditingController();
  var emailController = new TextEditingController();
  var addressController = new TextEditingController();
  var lnameController = new TextEditingController();

  File _image;
  final picker = ImagePicker();
  var _fromData;
  String profileImage = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                transform: Matrix4.translationValues(0.0, -5, 0.0),
                height: 140,
                color: Color.fromRGBO(231, 109, 44, 1),
                child: Center(
                    child: Container(
                  margin: EdgeInsets.only(bottom: 22),
                  width: 90,
                  height: 90,
                  child: Stack(
                    children: <Widget>[
                      _image == null
                          ? Container(
                              decoration: new BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: new DecorationImage(
                                      fit: BoxFit.fill,
                                      image: profileImage != null
                                          ? NetworkImage(
                                              AppConstant.imageBaseURL +
                                                  profileImage)
                                          : AssetImage(
                                              'images/dum_profile.jpg'))))
                          : Container(
                              decoration: new BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: new DecorationImage(
                                      fit: BoxFit.fill,
                                      image: new FileImage(_image))),
                            ),
                      /*  Container(

              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  image: new DecorationImage(
                      fit: BoxFit.fill,
                      image:AssetImage(
                          'images/dum_men.jpg'))
              ),



            ),*/

                      Align(
                          alignment: Alignment.bottomRight,
                          child: InkWell(
                            onTap: () {
                              getImage();
                            },
                            child: Container(
                              transform:
                                  Matrix4.translationValues(7.0, 0.0, 0.0),
                              margin: EdgeInsets.only(bottom: 10),
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromRGBO(230, 108, 43, 1),
                                  border: Border.all(
                                      color: Colors.deepOrange, width: 1)),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ))
                    ],
                  ),
                )),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: InputBoxProfileWidget(
                    labelText: 'First Name*',
                    focusNode: nameFocusNode,
                    validator: userNameValidator,
                    controller: nameController,
                    onSaved: (){

                      _submitHandler(context);

                    },
                    onTapTrigger: _requestFocusName),
              ),
              SizedBox(height: 30),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: InputBoxProfileWidget(
                    labelText: 'Last Name*',
                    focusNode: lNameFocusNode,
                    onSaved: (){

                      _submitHandler(context);

                    },
                    controller: lnameController,
                    validator: userNameValidator,
                    onTapTrigger: _requestlName),
              ),
              SizedBox(height: 30),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: TextInput3(
                    keyboardType: TextInputType.number,
                    labelText: 'Phone Number',
                    focusNode: phoneFocusNode,
                    controller: phoneController,
                    onSaved: (){

                      _submitHandler(context);

                    },
                    validator: phoneValidator,
                    onTapTrigger: _requestFocusPhone,
                    prefixIcon: new Padding(
                      padding: EdgeInsets.only(left: 5, right: 5),
                      child: Image.asset(
                        'images/flag_ic.png',
                        width: 40,
                        height: 40,
                      ),
                    )),
              ),
              SizedBox(height: 30),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child:
                InputBoxWidgetEmail(
                    labelText: 'Email',
                    focusNode: emailFocusNode,
                    controller: emailController,
                  isEnabled: false,
                    ),

                /*InputBoxProfileWidget(
                    labelText: 'Email*',
                    focusNode: emailFocusNode,
                    controller: emailController,
                    validator: emailValidator,
                    onTapTrigger: _requestFocusEmail),*/
              ),
              SizedBox(height: 24),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Driver License',
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          color: MyColor.defaultTextColor.withOpacity(0.5)),
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: <Widget>[
                        Container(
                          width: 70,
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                  color: MyColor.defaultTextColor
                                      .withOpacity(0.5))),
                          child: Padding(
                            padding: EdgeInsets.all(4),
                            child: Image.network(AppConstant.imageBaseURL+licenseImage),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                /*        Container(
                          width: 70,
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                  color: MyColor.defaultTextColor
                                      .withOpacity(0.5))),
                          child: Padding(
                            padding: EdgeInsets.all(0),
                            child: Image.asset('images/dl_ic.jpg'),
                          ),
                        ),*/
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ));
  }

  void _requestFocusName() {
    setState(() {
      FocusScope.of(context).requestFocus(nameFocusNode);
    });
  }

  void _requestlName() {
    setState(() {
      FocusScope.of(context).requestFocus(lNameFocusNode);
    });
  }

  void _requestFocusPhone() {
    setState(() {
      FocusScope.of(context).requestFocus(phoneFocusNode);
    });
  }

  void _requestFocusEmail() {
    setState(() {
      FocusScope.of(context).requestFocus(emailFocusNode);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkInternetAPIcall();
  }

  getDriverProfile() async {
    FocusScope.of(context).unfocus();
    APIDialog.showAlertDialog(context, 'Please wait...');
    ApiBaseHelper helper = new ApiBaseHelper();
    var response =
        await helper.postAPIWithHeader('viewprofile', _fromData, context);
    Navigator.pop(context);
    print(response);
    setState(() {
      nameController.text = response['data']['fname'];
      lnameController.text = response['data']['lname'];
      emailController.text = response['data']['email'];
      phoneController.text = response['data']['mobile'].toString();
      profileImage = response['data']['pimage'];
      licenseImage = response['data']['driver_license'];
    });
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedFile.path);
    });


    updateProfileData();
  }

  String phoneValidator(String value) {
    if (value.isEmpty || value.length < 10) {
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

    updateProfileData();
    ///all set to login
  }

  void checkInternetAPIcall() async {
    if (await InternetCheck.check() == true) {
      getDriverProfile();
    }
  }


  updateProfileData() async {
    FocusScope.of(context).unfocus();
    APIDialog.showAlertDialog(context, 'Updating Profile...');
    try {
      var formData;
      if(_image==null)
      {
        formData = FormData.fromMap({
          'fname': nameController.text,
          'lname': lnameController.text,
          'mobile': phoneController.text,
        });
      }

      else{

        formData = FormData.fromMap({
          'fname': nameController.text,
          'lname': lnameController.text,
          'mobile': phoneController.text,
          'pimage': _image == null
              ? null
              : await MultipartFile.fromFile(_image.path,
              filename: "profile_pic.jpg"),
        });
      }
      Dio dio = new Dio();
      print('https://projects.thesst.com/SIS897/api/user/updateprofile');
      dio.options.headers["Authorization"] = 'Bearer ' + UserModel.accessToken;
      final response = await dio.post('https://projects.thesst.com/SIS897/api/user/updateprofile',
          data: formData);


      var res = response.data;
      print(res);
      Navigator.of(context, rootNavigator: true).pop();

      if (res['message'] == 'Profile Updated') {
        Toast.show('Profile Updated Successfully !!', context,
            duration: Toast.LENGTH_SHORT,
            gravity: Toast.BOTTOM,
            backgroundColor: Colors.black);
      } else {
        Toast.show(res['message'], context,
            duration: Toast.LENGTH_SHORT,
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

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width / 2, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(TriangleClipper oldClipper) => false;
}
