// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/material.dart';
// import 'package:device_preview/device_preview.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_vector_icons/flutter_vector_icons.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
// //import 'package:pathstrides_mobile/widgets/ItemsWidget.dart';

// import '../widgets/HomeAppBar.dart';
// import 'home_screen.dart';

// class PointsShopScreen extends StatefulWidget {
//   const PointsShopScreen({super.key});

//   @override
//   State<PointsShopScreen> createState() => _PointsShopScreenState();
// }

// class PointShopData {
//   int points;
//   String points_name = "";

//   PointShopData(this.points_name, this.points);
// }

// class _PointsShopScreenState extends State<PointsShopScreen> {
//   Future<List<PointShopData>> _getRedeemShop() async {
//     var data3 =
//         await http.get(Uri.parse('http://10.0.2.2:8000/api/employeePointShop'));
//     var jsonData = json.decode(data3.body);

//     List<PointShopData> pointShops = [];
//     for (var p in jsonData) {
//       PointShopData pointShop = PointShopData(
//         p["points_name"],
//         p["points"],
//       );
//       pointShops.add(pointShop);
//     }
//     print(pointShops.length);
//     return pointShops;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final double height = MediaQuery.of(context).size.height;
//     final double width = MediaQuery.of(context).size.width;

//     return Scaffold(
//         backgroundColor: Color.fromARGB(255, 240, 240, 240),
//         appBar: AppBar(
//           leading: IconButton(
//             icon: Icon(
//               Icons.arrow_back,
//               color: const Color.fromARGB(255, 255, 126, 45),
//             ),
//             onPressed: () {
//               Navigator.of(context).pushReplacement(
//                   MaterialPageRoute(builder: (context) => const HomeScreen()));
//             },
//           ),
//           title: new Text(
//             "Points Shop",
//             style: const TextStyle(
//               fontFamily: 'Inter-bold',
//               color: Colors.black,
//             ),
//           ),
//           backgroundColor: Color.fromARGB(255, 240, 240, 240),
//           elevation: 0,
//         ),
//         body: Container(
//             child: FutureBuilder(
//           future: _getRedeemShop(),
//           builder: (BuildContext context, AsyncSnapshot snapshot3) {
//             if (snapshot3.data == null) {
//               return Container(
//                   child: Center(child: CircularProgressIndicator()));
//             } else {
//               return ListView.builder(
//                 itemCount: snapshot3.data.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   PointShopData data = snapshot3.data[index];
//                   return Card(
//                     color: Colors.white,
//                     margin: EdgeInsets.symmetric(
//                       horizontal: 10,
//                       vertical: 5,
//                     ),
//                     child: ListTile(
//                       title: Text(
//                         snapshot3.data[index].points_name,
//                         style:
//                             TextStyle(fontFamily: 'Inter-black', fontSize: 18),
//                       ),
//                       subtitle: Text(
//                         snapshot3.data[index].points.toString(),
//                         style: TextStyle(
//                             fontFamily: 'Inter-semibold', fontSize: 12),
//                       ),
//                     ),
//                   );
//                 },
//               );
//             }
//           },
//         )));
//   }
// }

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:pathstrides_mobile/Screens/pointshop_info.dart';
//import 'package:pathstrides_mobile/widgets/ItemsWidget.dart';

import '../widgets/HomeAppBar.dart';
import 'home_screen.dart';

class PointsShopScreen extends StatefulWidget {
  const PointsShopScreen({super.key});

  @override
  State<PointsShopScreen> createState() => _PointsShopScreenState();
}

class PointShopData {
  int points;
  String points_name = "";

  PointShopData(this.points_name, this.points);
}

class _PointsShopScreenState extends State<PointsShopScreen> {
  Future<List<PointShopData>> _getRedeemShop() async {
    var data3 =
        await http.get(Uri.parse('http://10.0.2.2:8000/api/employeePointShop'));
    var jsonData = json.decode(data3.body);

    List<PointShopData> pointShops = [];
    for (var p in jsonData) {
      PointShopData pointShop = PointShopData(
        p["points_name"],
        p["points"],
      );
      pointShops.add(pointShop);
    }
    print(pointShops.length);
    return pointShops;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 255, 140, 52),
      appBar: AppBar(
        toolbarHeight: 120.10, //set your height
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.all(10),
            color: Colors.white, // set your color
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ),
                            );
                          },
                          child: Icon(
                            Icons.arrow_back,
                            size: 30,
                            color: Color.fromARGB(255, 255, 153, 0),
                          ),
                        ),
                        Text(
                          "Point Shop",
                          style: TextStyle(
                            fontFamily: 'Inter-Black',
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 45,
                      height: 45,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                          );
                        },
                        child: Icon(
                          Icons.shopping_bag_rounded,
                          size: 30,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: const Color.fromARGB(255, 255, 126, 45),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 15,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.card_giftcard),
                      onPressed: () {},
                      iconSize: 23,
                    ),
                    Text(
                      "420",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Inter-bold',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 255, 192, 110),
                Color.fromARGB(255, 255, 156, 76),
              ],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        padding: EdgeInsets.only(top: 15),
        child: FutureBuilder(
          future: _getRedeemShop(),
          builder: (BuildContext context, AsyncSnapshot snapshot3) {
            if (snapshot3.data == null) {
              return Container(
                  child: Center(child: CircularProgressIndicator()));
            } else {
              return ListView.builder(
                itemCount: snapshot3.data.length,
                itemBuilder: (BuildContext context, int index) {
                  PointShopData data = snapshot3.data[index];
                  return Card(
                    color: Colors.white,
                    margin: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    child: ListTile(
                      title: Text(
                        snapshot3.data[index].points_name,
                        style:
                            TextStyle(fontFamily: 'Inter-black', fontSize: 18),
                      ),
                      subtitle: Text(
                        snapshot3.data[index].points.toString(),
                        style: TextStyle(
                          fontFamily: 'Inter-semibold',
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color.fromARGB(255, 106, 106, 106),
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
