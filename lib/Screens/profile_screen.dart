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

// class ProfileData {
//   String user_fname = "";
//   String user_mname = "";
//   String user_lname = "";
//   String user_email = "";
//   String contactnumber = "";
//   String user_username = "";
//   String user_department = "";
//   String status = "";
//   //int status;
//   //int user_id = 0;

//   ProfileData(
//       this.user_fname,
//       this.user_mname,
//       this.user_lname,
//       this.user_email,
//       this.contactnumber,
//       this.user_username,
//       this.user_department,
//       this.status
//       //this.status, this.user_id
//       );
// }

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
    // var user = UserData();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70.10, //set your height
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(
              top: 10,
              left: 10,
            ),
            color: Color.fromARGB(255, 255, 255, 255), // set your color
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
                          "User Profile",
                          style: TextStyle(
                            fontFamily: 'Inter-Black',
                            fontSize: 25,
                          ),
                        ),
                      ],
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
        padding: EdgeInsets.only(top: 15, left: 15, right: 15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 255, 157, 59),
                Color.fromARGB(255, 235, 80, 24),
              ],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.5, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      bottom: 15,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: new BorderRadius.circular(16.0),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(Icons.person_pin_circle_rounded),
                              onPressed: () {},
                              iconSize: 150,
                            ),
                          ],
                        ),
                        Container(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Nicki Minaj",
                                    style: TextStyle(
                                      fontFamily: 'Inter-Bold',
                                      fontSize: 30,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(top: 10),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              new BorderRadius.circular(16.0),
                                          color: Colors.green,
                                        ),
                                        child: Text(
                                          "Active",
                                          style: TextStyle(
                                            fontFamily: 'Inter-Bold',
                                            fontSize: 15,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column()
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              padding: EdgeInsets.only(
                bottom: 15,
                left: 10,
                top: 15,
              ),
              decoration: BoxDecoration(
                borderRadius: new BorderRadius.circular(16.0),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.person_2_rounded),
                        onPressed: () {},
                        iconSize: 30,
                      ),
                      Text(
                        "nicki_minaj",
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.groups_3_rounded),
                        onPressed: () {},
                        iconSize: 30,
                      ),
                      Text(
                        "Marketing",
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.email_rounded),
                        onPressed: () {},
                        iconSize: 30,
                      ),
                      Text(
                        "nickiminaj@gmail.com",
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.phone_android_rounded),
                        onPressed: () {},
                        iconSize: 30,
                      ),
                      Text(
                        "09123456789",
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
