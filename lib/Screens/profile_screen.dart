import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:pathstrides_mobile/Screens/home_screen.dart';

import '../Services/user.dart';

class ProfileScreen extends StatefulWidget {
  //ProfileData profileview;
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Future<UserData> _getUser() async {
  //   var data =
  //       await http.get(Uri.parse('http://10.0.2.2:8000/api/employeeUser'));
  //   var jsonData = json.decode(data.body);

  //   var u = jsonData;
  //   UserData user = u["user_id"];
  //   u["user_fname"];
  //   u["user_mname"];
  //   u["user_lname"];
  //   u["user_email"];
  //   u["contactnumber"];
  //   u["user_username"];
  //   u["user_password"];
  //   u["user_department"];
  //   u["role"];
  //   u["status"];
  //   u["admin_id"];
  //   u["dep_id"];
  //   return user;
  // }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    var user = UserData();
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
            "Profile",
            style: TextStyle(
              fontFamily: 'Inter-bold',
              color: Colors.black,
            ),
          ),
          backgroundColor: Color.fromARGB(255, 240, 240, 240),
          elevation: 0,
        ),
        body: Container(
          child: Text(
            user.user_fname.toString(),
            style: TextStyle(
              fontFamily: 'Inter-bold',
              color: Colors.black,
            ),
          ),
        ));
  }
}
