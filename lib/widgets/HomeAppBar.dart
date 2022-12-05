// import 'package:badges/badges.dart';
// import 'package:flutter/material.dart';
// import 'package:badges/badges.dart';

// class HomeAppBar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.white,
//       padding: EdgeInsets.all(25),
//       child: Row(
//         children: [
//           Icon(
//             Icons.arrow_back_outlined,
//             size: 30,
//             color: Color.fromARGB(255, 255, 153, 0),
//           ),
//           Padding(
//             padding: EdgeInsets.only(
//               left: 20,
//             ),
//             child: Text(
//               "Points Shop",
//               style: TextStyle(
//                 fontSize: 23,
//                 fontFamily: 'Inter-Bold',
//               ),
//             ),
//           ),
//           Spacer(),
//           Badge(
//             badgeContent: Text(
//               "3",
//               style: TextStyle(
//                 color: Colors.white,
//               ),
//             ),
//             badgeColor: Colors.red,
//             padding: EdgeInsets.all(7),
//             child: InkWell(
//               onTap: () {},
//               child: Icon(
//                 Icons.shopping_bag_outlined,
//                 size: 30,
//                 color: Color.fromARGB(255, 255, 153, 0),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }