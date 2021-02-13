


import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mandubi_driver/colors/colors.dart';
import 'package:mandubi_driver/widgets/custom_marker_widget.dart';
import 'package:mandubi_driver/widgets/toolbar_widget.dart';

class TrackOrderScreen extends StatefulWidget
{
  TrackOrderState createState()=>TrackOrderState();
}
class TrackOrderState extends State<TrackOrderScreen>
{
  LatLngBounds bound;
  final Set<Polyline> _polylines = Set();
  Completer<GoogleMapController> _controller = Completer();
  GoogleMapController mapController;
  String _mapStyle;
  List<Marker> markersWidget = [];
  var _fromData;
  bool markerGenerated = false;
  String address = '';
  LatLng currentLocation = LatLng(28.5355,  77.3910);
  LatLng destLocation = LatLng(26.8467,80.9462);
  LatLng agraLocation = LatLng(27.1767,78.0081);
  LatLng mathuraLocation = LatLng(27.4924,77.6737);
  BitmapDescriptor pinLocationIcon;
  Set<Marker> markers = Set();
  bool CurrentLoc = false;
  BitmapDescriptor sourceIcon;
  BitmapDescriptor destinationIcon;

  static final CameraPosition _kGooglePlex = CameraPosition(
    target:LatLng(28.5355,  77.3910),
    zoom: 15,
  );

  @override
  Widget build(BuildContext context) {

   /* if (markerGenerated == false) {
      markerGenerated = true;
      BitmapDescriptor.fromAssetImage(
          ImageConfiguration(devicePixelRatio: 2.5), 'images/car_icon.png')
          .then((onValue) {
        pinLocationIcon = onValue;
      });
    }
*/


    return Scaffold(
      body: Stack(
        children: <Widget>[
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: _onMapCreated,
            markers: markers,
            polylines: _polylines,
          ),
          Column(
            children: <Widget>[
              ToolbarWidget('Track Order'),

              SizedBox(height: 15,),

              Stack(
                children: <Widget>[
                  Container(
                    height: 53,
                    margin: EdgeInsets.symmetric(horizontal: 18),
                    child: TextFormField(
                      //controller: textControllerSearch,
                      maxLines: 1,
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                          color: Color.fromRGBO(40, 40, 40, 1),
                          fontSize: 15,
                          decoration: TextDecoration.none,
                          fontFamily: 'Roboto'),
                      decoration: InputDecoration(
                        hintText: 'Search',
                        border: InputBorder.none,
                        contentPadding:
                        EdgeInsets.only(left: 15, right: 50,top: 5),
                        hintStyle: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(128,128,128, 0.5),
                            fontSize: 18),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Align(
                        alignment: Alignment.bottomRight,
                        child: GestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding: EdgeInsets.only(right: 35, top: 18),
                            child: Image.asset('images/search_ic.png',
                                width: 18, height: 18),
                          ),
                        )),
                  )
                ],
              ),



              Expanded(
                child: Container(),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(),
                  ),
                  InkWell(
                    onTap: () {
                      mapController.animateCamera(
                        CameraUpdate.newCameraPosition(
                          CameraPosition(
                              target: LatLng(currentLocation.latitude,
                                  currentLocation.longitude),
                              zoom: 10.4746),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 15, bottom: 25),
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black87.withOpacity(0.4),
                        border: Border.all(color: Colors.white,width: 1),

                      ),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.all(7),
                          child: Image.asset('images/loc_white.png',color: MyColor.themeColor,),
                        ),
                      ),
                    ),
                  ),
                ],
              ),


              Container(
                
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                  
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[

                      Row(
                        children: <Widget>[
                          Container(
                              width: 45,
                              height: 45,
                              margin: EdgeInsets.only(right: 15),
                              decoration:  BoxDecoration(
                                  shape: BoxShape.circle,

                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image:  AssetImage('images/dum_men.jpg')
                                  )
                              )
                          ),



                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[

                              Text(
                                'Andrew Tait',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w700,
                                    color: MyColor.defaultTextColor),
                              ),
                              SizedBox(height: 2),


                              Text(
                                'Customer',
                                style: TextStyle(
                                    fontSize: 11,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromRGBO(177,176,176,1)),
                              ),


                            ],
                          )
                        ],
                      ),


                      Container(
                        width: 45,
                        height: 45,
                        padding: EdgeInsets.all(12),
                        margin: EdgeInsets.only(right: 5),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(
                                255,82,1, 1),
                            shape: BoxShape.circle),
                        child: Image.asset(
                            'images/call_ic.png',color: Colors.white,),
                      ),









                    ],
                  )
              ),


            ],
          )
        ],
      ),
    );
  }
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    mapController.setMapStyle(_mapStyle);

    setState(() {
      _controller.complete(controller);
    });

    _drawMarker();

    _calculateBound(currentLocation.latitude.toString(), currentLocation.longitude.toString(), destLocation.latitude.toString(), destLocation.longitude.toString(), currentLocation);

  }



  _drawMarker(){
    MarkerGenerator(_getMarkerWidget(), (bitmaps) {
      setState(() {
        markersWidget = mapBitmapsToMarkers(bitmaps);
      });
    }).generate(context);


    MarkerGenerator(_getMarkerWidget(), (bitmaps) {
      setState(() {
        markersWidget = mapBitmapsToMarkers2(bitmaps);


      });
    }).generate(context);


    MarkerGenerator(_getCarWidget(), (bitmaps) {
      setState(() {
        markersWidget = mapBitmapsToMarkersForCar(bitmaps);
      });
    }).generate(context);


    MarkerGenerator(_getContainer(), (bitmaps) {
      setState(() {
        markersWidget = mapContainerToMarkers(bitmaps);
      });
    }).generate(context);


  }
  List<Marker> mapBitmapsToMarkers(List<Uint8List> bitmaps) {
    List<Marker> markersList = [];
    bitmaps.asMap().forEach((i, bmp) {
      markers.add(Marker(
          markerId: MarkerId('source'),
          position: currentLocation,
          icon: BitmapDescriptor.fromBytes(bmp)));
    });
    return markersList;
  }
  List<Marker> mapBitmapsToMarkers2(List<Uint8List> bitmaps) {
    List<Marker> markersList = [];
    bitmaps.asMap().forEach((i, bmp) {
      markers.add(Marker(
          markerId: MarkerId('dest'),
          position: destLocation,
          icon: BitmapDescriptor.fromBytes(bmp)));
    });
    return markersList;
  }

  List<Marker> mapContainerToMarkers(List<Uint8List> bitmaps) {
    List<Marker> markersList = [];
    bitmaps.asMap().forEach((i, bmp) {
      markers.add(Marker(
          markerId: MarkerId('conta'),
          position: mathuraLocation,
          icon: BitmapDescriptor.fromBytes(bmp)));
    });
    return markersList;
  }
  List<Marker> mapBitmapsToMarkersForCar(List<Uint8List> bitmaps) {
    List<Marker> markersList = [];
    bitmaps.asMap().forEach((i, bmp) {
      markers.add(Marker(
          markerId: MarkerId('car'),
          position: agraLocation,
          icon: BitmapDescriptor.fromBytes(bmp)));
    });
    return markersList;
  }
  Widget _getMarkerWidget() {
    return   Container(
      width: 26,
      height: 26,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Color.fromRGBO(
              255, 238, 211, 1),
          shape: BoxShape.circle),
      child: Container(
        width: 15,
        height: 15,
        decoration: BoxDecoration(
            color: Color.fromRGBO(
                254, 172, 44, 1),
            shape: BoxShape.circle),
      ),
    );
  }



  Widget _getContainer(){
    return  Container(
        width: 110,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Text(
              '8',
              style: TextStyle(
                  fontSize: 32,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w800,
                  color: Color.fromRGBO(
                      254, 172, 44, 1)),
            ),

            SizedBox(width: 5,),


            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[


                SizedBox(height: 12,),
                Text(
                  'AWAY',
                  style: TextStyle(
                      fontSize: 11,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w500,
                      color: MyColor.defaultTextColor),
                ),

                Text(
                  'mins',
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Lato',
                      height: 1,
                      fontWeight: FontWeight.w800,
                      color: Color.fromRGBO(
                          254, 172, 44, 1)
                  ),





                ),

              /* Container(
                 transform: Matrix4.translationValues(-10.0, 6.0, 0.0),
                 child:  ClipPath(
                   clipper: TriangleClipper(),
                   child: Container(
                     color: Colors.red,
                     height: 10,
                     width: 20,
                   ),
                 ),
               )*/
              ],
            )






          ],
        )
    )


    /* Container(
       child:  Column(
         *//* mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,*//*
         children: <Widget>[
           Container(
               width: 110,
               height: 50,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(30),
                 color: Colors.greenAccent,
               ),

               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[

                   Text(
                     '8',
                     style: TextStyle(
                         fontSize: 32,
                         fontFamily: 'Lato',
                         fontWeight: FontWeight.w800,
                         color: Color.fromRGBO(
                             254, 172, 44, 1)),
                   ),

                   SizedBox(width: 5,),


                   Column(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: <Widget>[


                       SizedBox(height: 12,),
                       Text(
                         'AWAY',
                         style: TextStyle(
                             fontSize: 11,
                             fontFamily: 'Lato',
                             fontWeight: FontWeight.w500,
                             color: MyColor.defaultTextColor),
                       ),

                       Text(
                         'mins',
                         style: TextStyle(
                             fontSize: 15,
                             fontFamily: 'Lato',
                             height: 1,
                             fontWeight: FontWeight.w800,
                             color: Color.fromRGBO(
                                 254, 172, 44, 1)
                         ),


                       )
                     ],
                   )






                 ],
               )
           ),
           ClipPath(
             clipper: TriangleClipper(),
             child: Container(
               color: Colors.white,
               height: 10,
               width: 20,
             ),
           )
         ],
       ),
     )*/;
  }


  Widget _getCarWidget() {
    return   Container(
      width: 26,
      height: 26,
     child: Image.asset('images/car_icon.png'),

    );
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    rootBundle.loadString('assets/map_style.txt').then((string) {
      _mapStyle = string;
    });
    setCustomMapPin();
  }

  _calculateBound(String sourceLat1, String sourceLong1, String destLat,
      String destLong, LatLng point) {
    Future.delayed(const Duration(milliseconds: 100), () {
      final LatLng offerLatLng =
      LatLng(double.parse(destLat), double.parse(destLong));
      if (offerLatLng.latitude > double.parse(sourceLat1) &&
          offerLatLng.longitude > double.parse(sourceLong1)) {
        bound = LatLngBounds(southwest: point, northeast: offerLatLng);
      } else if (offerLatLng.longitude > double.parse(sourceLong1)) {
        bound = LatLngBounds(
            southwest: LatLng(offerLatLng.latitude, double.parse(sourceLong1)),
            northeast: LatLng(double.parse(sourceLat1), offerLatLng.longitude));
      } else if (offerLatLng.latitude > double.parse(sourceLat1)) {
        bound = LatLngBounds(
            southwest: LatLng(double.parse(sourceLat1), offerLatLng.longitude),
            northeast: LatLng(offerLatLng.latitude, double.parse(sourceLong1)));
      } else {
        bound = LatLngBounds(southwest: offerLatLng, northeast: currentLocation);
      }
      CameraUpdate u2 = CameraUpdate.newLatLngBounds(bound, 50);
      this.mapController.animateCamera(u2).then((void v) {
        check(u2, this.mapController);
      });
    });

    _drawPathonMap();

  }

  void check(CameraUpdate u, GoogleMapController c) async {
    c.animateCamera(u);
    mapController.animateCamera(u);
    LatLngBounds l1 = await c.getVisibleRegion();
    LatLngBounds l2 = await c.getVisibleRegion();
    print(l1.toString());
    print(l2.toString());
    if (l1.southwest.latitude == -90 || l2.southwest.latitude == -90)
      check(u, c);
  }

  _drawPathonMap() async {
    List<LatLng> polylineCoordinates = [];
    PolylinePoints polylinePoints = PolylinePoints();

    List<PointLatLng> result = await polylinePoints?.getRouteBetweenCoordinates(
        'AIzaSyCyMQNjWRHZLsf2Y_gsIAmGJl9T7K9-Vec',
        currentLocation.latitude,
        currentLocation.longitude,
        destLocation.latitude,
        destLocation.longitude);
    if (result.isNotEmpty) {
      result.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }
    setState(() {
      Polyline polyline = Polyline(
          polylineId: PolylineId('polyty'),
          color: Color.fromRGBO(
              254, 172, 44, 1),
          width: 2,
          points: polylineCoordinates);
      _polylines.add(polyline);
    });
  }
  void setCustomMapPin() async {
    pinLocationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5),
        'images/car_icon.png');
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