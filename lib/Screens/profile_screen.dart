import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      fit: StackFit.expand,
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          AntDesign.arrowleft,
                          color: Color.fromARGB(255, 255, 126, 45),
                        ),
                        onPressed: () =>
                            Navigator.of(context, rootNavigator: true)
                                .pushReplacement(MaterialPageRoute(
                                    builder: (context) => new ProfileScreen())),
                      ),
                      const Icon(
                        AntDesign.setting,
                        color: const Color.fromARGB(255, 255, 126, 45),
                      ),
                    ],
                  ),
                  Container(
                    height: height * 0.43,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        double innerHeight = constraints.maxHeight;
                        double innerWidth = constraints.maxWidth;
                        return Stack(
                          fit: StackFit.expand,
                          children: [
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: innerHeight * 0.72,
                                width: innerWidth,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white,
                                ),
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 80,
                                    ),
                                    const Text(
                                      'User_01', //Employee's first and last name
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Inter-Black',
                                        fontSize: 24,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          children: const [
                                            Text(
                                              'Points',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: 'Inter-Regular',
                                                fontSize: 18,
                                              ),
                                            ),
                                            Text(
                                              '10', //employee's earned
                                              style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 255, 126, 45),
                                                fontFamily: 'Inter-Bold',
                                                fontSize: 25,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 25,
                                            vertical: 8,
                                          ),
                                          child: Container(
                                            height: 50,
                                            width: 3,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        Column(
                                          children: const [
                                            Text(
                                              'Pending',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: 'Inter-Regular',
                                                fontSize: 18,
                                              ),
                                            ),
                                            Text(
                                              '1',
                                              style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 255, 126, 45),
                                                fontFamily: 'Inter-Bold',
                                                fontSize: 25,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                              child: Center(
                                child: Container(
                                    //insert employee's profile
                                    // child: Image.asset(
                                    //   'assets/img/profile.png',
                                    //   width: innerWidth * 0.45,
                                    //   fit: BoxFit.fitWidth,
                                    // ),
                                    ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: height * 0.5,
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Tasks',
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 126, 45),
                              fontSize: 27,
                              fontFamily: 'Inter-Bold',
                            ),
                          ),
                          const Divider(
                            thickness: 1.5,
                            color: Colors.black,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: height * 0.15,
                            decoration: BoxDecoration(
                              color: Colors.pinkAccent,
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: height * 0.15,
                            decoration: BoxDecoration(
                              color: Colors.pinkAccent,
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
