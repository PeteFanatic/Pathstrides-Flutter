import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
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
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Color.fromARGB(255, 240, 240, 240),
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: const Color.fromARGB(255, 255, 126, 45),
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
          ),
          title: new Text(
            "Points Shop",
            style: const TextStyle(
              fontFamily: 'Inter-bold',
              color: Colors.black,
            ),
          ),
          backgroundColor: Color.fromARGB(255, 240, 240, 240),
          elevation: 0,
        ),
        body: Container(
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
                            fontFamily: 'Inter-semibold', fontSize: 12),
                      ),
                    ),
                  );
                },
              );
            }
          },
        )));
  }
}

// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/material.dart';
// import 'package:device_preview/device_preview.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_vector_icons/flutter_vector_icons.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:pathstrides_mobile/widgets/ItemsWidget.dart';
// //import 'package:pathstrides_mobile/widgets/ItemsWidget.dart';

// import '../widgets/HomeAppBar.dart';
// // import '../widgets/ItemsWidget.dart';
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
//     return Scaffold(
//       body: ListView(
//         children: [
//           HomeAppBar(),
//           Container(
//             //temporary height
//             height: 500,
//             padding: EdgeInsets.only(top: 15),
//             decoration: BoxDecoration(
//               color: Color(0xFFEDECF2),
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(35),
//                 topRight: Radius.circular(35),
//               ),
//             ),
//             child: Column(
//               children: [
//                 Container(
//                   margin: EdgeInsets.symmetric(horizontal: 15),
//                   padding: EdgeInsets.symmetric(horizontal: 15),
//                   height: 50,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   child: Row(
//                     children: [
//                       Container(
//                         margin: EdgeInsets.only(left: 5),
//                         height: 50,
//                         width: 300,
//                         child: TextFormField(
//                           decoration: InputDecoration(
//                             border: InputBorder.none,
//                             hintText: "Search",
//                           ),
//                         ),
//                       ),
//                       Spacer(),
//                       Icon(
//                         Icons.search,
//                         size: 27,
//                         color: Color.fromARGB(255, 255, 153, 0),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   alignment: Alignment.centerLeft,
//                   margin: EdgeInsets.symmetric(
//                     vertical: 15,
//                     horizontal: 10,
//                   ),
//                   child: Text(
//                     "Items",
//                     style: TextStyle(
//                       fontSize: 25,
//                       fontFamily: 'Inter-bold',
//                       color: Colors.black,
//                     ),
//                   ),
//                 ),
//                 //Items
//                 FutureBuilder(
//                   future: _getRedeemShop(),
//                   builder: (BuildContext context, AsyncSnapshot snapshot3) {
//                     if (snapshot3.data == null) {
//                       return Center(
//                         child: Text("Nothing to see here..."),
//                       );

                      
//                     } else {
//                       GridView.builder(
//                         gridDelegate:
//                             const SliverGridDelegateWithFixedCrossAxisCount(
//                                 crossAxisCount: 2),
//                         itemBuilder: (BuildContext context, int index) {
//                           PointShopData data = snapshot3.data[index];
//                         },
//                       );
//                     }
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
