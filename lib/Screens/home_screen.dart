import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pathstrides_mobile/Screens/login_screen.dart';
import 'package:pathstrides_mobile/Screens/profile_screen.dart';
import 'package:pathstrides_mobile/Screens/task_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            Container(
              // ignore: prefer_const_constructors
              padding: EdgeInsets.only(
                  top: 50.0, left: 0.0, bottom: 0.0, right: 250.0),
              child: const Text('Hi,',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontFamily: 'Inter-Bold',
                      fontSize: 26.0,
                      letterSpacing: -1.0,
                      fontWeight: FontWeight.bold)),
            ),
            Container(
                padding: const EdgeInsets.only(top: 30.0, bottom: 0, left: 50),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const TaskScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 126, 45),
                  ),
                  // padding: const EdgeInsets.all(0.0),
                  child: Container(
                    padding: const EdgeInsets.only(top: 0.0, bottom: 0),
                    width: 250,
                    height: 70,
                    child: Row(
                      children: [
                        // ignore: prefer_const_constructors
                        Align(
                          alignment: Alignment.centerLeft,
                        ),
                        Container(
                            margin: const EdgeInsets.only(left: 0.0),
                            // ignore: prefer_const_constructors
                            child: Text(
                              "Task of the Day >>",
                              // ignore: prefer_const_constructors
                              style: TextStyle(
                                  fontFamily: 'Inter-Black', fontSize: 22.0),
                            ))
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
