import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'home_screen.dart';

class PointsShopScreen extends StatefulWidget {
  const PointsShopScreen({super.key});

  @override
  State<PointsShopScreen> createState() => _PointsShopScreenState();
}

class _PointsShopScreenState extends State<PointsShopScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Text(
          'Points Shop',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 153, 0),
            fontFamily: 'Inter-Bold',
            fontSize: 30,
          ),
        ),
        backgroundColor: Colors.white,
        toolbarHeight: 150,
        flexibleSpace: Container(
          alignment: Alignment.bottomLeft,
          padding: EdgeInsets.only(left: 70, bottom: 20, top: 20),
          child: Container(
            child: Text(
              'Points: 42,069',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Inter-Bold',
                fontSize: 16,
              ),
            ),
          ),
        ),
        elevation: 20,
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          child: GNav(
            gap: 8,
            padding: EdgeInsets.all(15),
            backgroundColor: Colors.white,
            color: Color.fromARGB(255, 255, 153, 0),
            activeColor: Color.fromARGB(255, 255, 153, 0),
            tabBackgroundColor: Color.fromARGB(69, 255, 153, 0),
            tabs: const [
              GButton(icon: Icons.home),
              GButton(icon: Icons.announcement),
              GButton(icon: Icons.list),
              GButton(icon: Icons.notifications),
              GButton(icon: Icons.person),
            ],
          ),
        ),
      ),
    );
  }
}
