import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pathstrides_mobile/Screens/task_desc.dart';
import 'package:pathstrides_mobile/Screens/task_report.dart';
import 'dart:async';
import '../Screens/task_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pathstrides_mobile/Services/constants.dart';
import '../task_data.dart';

class GeolocationScreen extends StatefulWidget {
  const GeolocationScreen({Key? key}) : super(key: key);

  @override
  State<GeolocationScreen> createState() => _GeolocationScreenState();
}

class _GeolocationScreenState extends State<GeolocationScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  static const LatLng sourceLocation = LatLng(10.311687, 123.91837);
  static const LatLng destination = LatLng(10.300562, 123.895404);
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;
  @override
  void initState() {
    addCustomIcon();
    super.initState();
  }

  void addCustomIcon() {
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(), "assets/images/usericon.png")
        .then((icon) {
      setState(() {
        markerIcon = icon;
      });
    });
  }
  // void getPolyPoints() async {
  //   PolylinePoints polylinePoints = PolylinePoints();

  //   PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
  //     google_api_key,
  //     PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
  //     PointLatlng(destination.latitude, destination.longitude),
  //   );

  //   if (result.points.isnotEmpty) {
  //     result.points.forEatch(
  //       (PointLatLng point)=>polylineCoordinates.add(
  //         LatLng(point.latitude, point.longitude),
  //       ),
  //     );
  //     setState(() {

  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const TaskReport()));
          },
        ),
        title: Text(
          "Task Title",
          style: TextStyle(
            fontFamily: 'Inter-bold',
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 126, 45),
        elevation: 0,
        // iconTheme: IconThemeData(
        //   color: const Color.fromARGB(255, 255, 126, 45),
        // ),
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.person),
        //     onPressed: () {
        //       Navigator.of(context).pushReplacement(MaterialPageRoute(
        //           builder: (context) => const TaskScreen()));
        //     },
        //   )
        // ],
      ),
      body: GoogleMap(
        initialCameraPosition:
            CameraPosition(target: sourceLocation, zoom: 16.5),
        // polylines: Polyline(
        //     polylineId: PolylineId("route"), points: polylineCoordinates),
        markers: {
          Marker(
            markerId: const MarkerId("destination"),
            position: destination,
            icon: markerIcon,
          ),
          const Marker(
            markerId: MarkerId("source"),
            position: sourceLocation,
          ),
        },
        circles: {
          Circle(
              circleId: CircleId("1"),
              center: destination,
              radius: 200,
              strokeWidth: 1,
              strokeColor: Color.fromARGB(255, 255, 102, 0),
              fillColor: Color.fromARGB(255, 255, 102, 0).withOpacity(0.1)),
          //radius:430,
        },
        // const AddressInfo(isIntheDeliverArea: true,)
      ),
    );
  }
}