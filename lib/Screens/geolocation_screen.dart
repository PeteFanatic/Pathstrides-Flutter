// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import 'package:pathstrides_mobile/Screens/task_desc.dart';
// import 'package:pathstrides_mobile/Screens/task_report.dart';
// import 'dart:async';
// import '../Screens/task_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:pathstrides_mobile/Services/constants.dart';
// import '../task_data.dart';

// class GeolocationScreen extends StatefulWidget {
//   const GeolocationScreen({Key? key}) : super(key: key);

//   @override
//   State<GeolocationScreen> createState() => _GeolocationScreenState();
// }

// class _GeolocationScreenState extends State<GeolocationScreen> {
//   Completer<GoogleMapController> _controller = Completer();

//   Set<Marker> _markers = Set<Marker>();

//   static const LatLng sourceLocation = LatLng(10.311687, 123.91837);
//   static const LatLng destination = LatLng(10.300562, 123.895404);
//   BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;

//   Set<Polyline> polylines = Set<Polyline>();
//   // ^ this will hold each of the polylines, when connected together, will form a route
//   List<LatLng> polylineCoordinates = [];
//   // ^ store each coordiante for polylines. bc each polyline is made up of multiple coordinates. so we need a list of latlong references
//   late PolylinePoints polylinePoints;
//   // ^ will fetch the route between

//   @override
//   void initState() {
//     addCustomIcon();
//     super.initState();

//     polylinePoints = PolylinePoints();

//     //set up initial locations
//   }

//   void addCustomIcon() {
//     BitmapDescriptor.fromAssetImage(
//             const ImageConfiguration(), "assets/images/usericon.png")
//         .then((icon) {
//       setState(() {
//         markerIcon = icon;
//       });
//     });
//   }
//   // void getPolyPoints() async {
//   //   PolylinePoints polylinePoints = PolylinePoints();

//   //   PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
//   //     google_api_key,
//   //     PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
//   //     PointLatlng(destination.latitude, destination.longitude),
//   //   );

//   //   if (result.points.isnotEmpty) {
//   //     result.points.forEatch(
//   //       (PointLatLng point)=>polylineCoordinates.add(
//   //         LatLng(point.latitude, point.longitude),
//   //       ),
//   //     );
//   //     setState(() {

//   //     });
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(
//             Icons.arrow_back,
//             color: Color.fromARGB(255, 255, 255, 255),
//           ),
//           onPressed: () {
//             Navigator.of(context).pushReplacement(
//                 MaterialPageRoute(builder: (context) => const TaskReport()));
//           },
//         ),
//         title: Text(
//           "Task Title",
//           style: TextStyle(
//             fontFamily: 'Inter-bold',
//             color: Color.fromARGB(255, 255, 255, 255),
//           ),
//         ),
//         backgroundColor: const Color.fromARGB(255, 255, 126, 45),
//         elevation: 0,
//         // iconTheme: IconThemeData(
//         //   color: const Color.fromARGB(255, 255, 126, 45),
//         // ),
//         // actions: [
//         //   IconButton(
//         //     icon: Icon(Icons.person),
//         //     onPressed: () {
//         //       Navigator.of(context).pushReplacement(MaterialPageRoute(
//         //           builder: (context) => const TaskScreen()));
//         //     },
//         //   )
//         // ],
//       ),
//       body: GoogleMap(
//           polylines: _polylines,
//           initialCameraPosition:
//               CameraPosition(target: sourceLocation, zoom: 16.5),
//           // polylines: Polyline(
//           //     polylineId: PolylineId("route"), points: polylineCoordinates),
//           markers: {
//             Marker(
//               markerId: const MarkerId("destination"),
//               position: destination,
//               icon: markerIcon,
//             ),
//             const Marker(
//               markerId: MarkerId("source"),
//               position: sourceLocation,
//             ),
//           },
//           circles: {
//             Circle(
//                 circleId: CircleId("1"),
//                 center: destination,
//                 radius: 200,
//                 strokeWidth: 1,
//                 strokeColor: Color.fromARGB(255, 255, 102, 0),
//                 fillColor: Color.fromARGB(255, 255, 102, 0).withOpacity(0.1)),
//             //radius:430,
//           },
//           onMapCreated: (GoogleMapController controller) {
//             _controller.complete(controller);

//             setPolylines();
//           }
//           // const AddressInfo(isIntheDeliverArea: true,)
//           ),
//     );
//   }

//   void setPolylines() async {
//     PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
//         "AIzaSyCXRiiMpCWRSo4oxseHQ9cwgo98bCdOjyc",
//         PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
//         PointLatLng(destination.latitude, destination.longitude));

//     if (result.status == 'OK') {
//       result.points.forEach((PointLatLng point) {
//         polylineCoordinates.add(LatLng(point.latitude, point.longitude));
//       });

//       setState(() {
//         _polylines.add(Polyline(
//             width: 10,
//             polylineId: PolylineId('polyLine'),
//             color: Color(0xFF08A5CB),
//             points: polylineCoordinates));
//       });
//     }
//   }
// }

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

const LatLng SOURCE_LOCATION =
    LatLng(10.332693082806154, 123.904893794083); //sugbo mercado it park
const LatLng DEST_LOCATION =
    LatLng(10.290322648885569, 123.87043543404714); //shopwise
const double CAMERA_ZOOM = 16;
const double CAMERA_TILT = 80;
const double CAMERA_BEARING = 30;
const double PIN_VISIBLE_POSITION = 20;
const double PIN_INVISIBLE_POSITION = -220;

class GeolocationScreen extends StatefulWidget {
  @override
  _GeolocationScreenState createState() => _GeolocationScreenState();
}

class _GeolocationScreenState extends State<GeolocationScreen> {
  Completer<GoogleMapController> _controller = Completer();
  late BitmapDescriptor sourceIcon;
  late BitmapDescriptor destinationIcon;
  Set<Marker> _markers = Set<Marker>();
  double pinPillPosition = PIN_VISIBLE_POSITION;
  late LatLng currentLocation;
  late LatLng destinationLocation;
  bool userBadgeSelected = false;

  Set<Polyline> _polylines = Set<Polyline>();
  List<LatLng> polylineCoordinates = [];
  late PolylinePoints polylinePoints;

  @override
  void initState() {
    super.initState();

    polylinePoints = PolylinePoints();

    // set up initial locations
    this.setInitialLocation();
  }

  void setInitialLocation() {
    currentLocation =
        LatLng(SOURCE_LOCATION.latitude, SOURCE_LOCATION.longitude);

    destinationLocation =
        LatLng(DEST_LOCATION.latitude, DEST_LOCATION.longitude);
  }

  @override
  Widget build(BuildContext context) {
    CameraPosition initialCameraPosition = CameraPosition(
        zoom: CAMERA_ZOOM,
        tilt: CAMERA_TILT,
        bearing: CAMERA_BEARING,
        target: SOURCE_LOCATION);

    return Scaffold(
        body: Stack(
      children: [
        Positioned.fill(
          child: GoogleMap(
            myLocationEnabled: true,
            compassEnabled: false,
            tiltGesturesEnabled: false,
            polylines: _polylines,
            markers: _markers,
            mapType: MapType.normal,
            initialCameraPosition: initialCameraPosition,
            onTap: (LatLng loc) {
              setState(() {
                this.pinPillPosition = PIN_INVISIBLE_POSITION;
                this.userBadgeSelected = false;
              });
            },
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);

              showPinsOnMap();
              setPolylines();
            },
          ),
        ),
      ],
    ));
  }

  void showPinsOnMap() {
    setState(() {
      _markers.add(Marker(
          markerId: MarkerId('sourcePin'),
          position: currentLocation,
          icon: sourceIcon,
          onTap: () {
            setState(() {
              this.userBadgeSelected = true;
            });
          }));

      _markers.add(Marker(
          markerId: MarkerId('destinationPin'),
          position: destinationLocation,
          icon: destinationIcon,
          onTap: () {
            setState(() {
              this.pinPillPosition = PIN_VISIBLE_POSITION;
            });
          }));
    });
  }

  void setPolylines() async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        "AIzaSyCXRiiMpCWRSo4oxseHQ9cwgo98bCdOjyc",
        PointLatLng(currentLocation.latitude, currentLocation.longitude),
        PointLatLng(
            destinationLocation.latitude, destinationLocation.longitude));

    if (result.status == 'OK') {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });

      setState(() {
        _polylines.add(Polyline(
            width: 10,
            polylineId: PolylineId('polyLine'),
            color: Color(0xFF08A5CB),
            points: polylineCoordinates));
      });
    }
  }
}
