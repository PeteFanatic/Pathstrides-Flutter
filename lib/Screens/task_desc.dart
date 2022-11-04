// ignore_for_file: must_be_immutable

import 'package:pathstrides_mobile/Screens/geolocation_screen.dart';
import 'package:pathstrides_mobile/Screens/task_report.dart';

import 'package:flutter/material.dart';
import '../Screens/task_screen.dart';

class TaskDescription extends StatefulWidget {
  TaskData taskview;
  TaskDescription(this.taskview, {super.key});

  @override
  State<TaskDescription> createState() => _TaskDescriptionState();
}

class _TaskDescriptionState extends State<TaskDescription> {
  @override
  Widget build(BuildContext context) {
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
                  MaterialPageRoute(builder: (context) => const TaskScreen()));
            },
          ),
          title: Text(
            widget.taskview.task_title,
            style: TextStyle(
              fontFamily: 'Inter-bold',
              color: Colors.black,
            ),
          ),
          backgroundColor: Color.fromARGB(255, 240, 240, 240),
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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 10.0, right: 0.0),
                  child: Text(
                    widget.taskview.task_title,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 30.0, fontFamily: 'Inter-black'),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 10.0, right: 0.0),
                  child: Text(
                    widget.taskview.location,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                        fontFamily: 'Inter-semibold'),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(
                      top: 30, left: 10.0, right: 0.0, bottom: 0),
                  child: Text(
                    "Description",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        fontFamily: 'Inter-bold'),
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(
                        top: 0.0, left: 10.0, bottom: 0.0, right: 10.0),
                    height: 300,
                    width: 380,
                    child: Card(
                        color: Colors.white,
                        margin: EdgeInsets.symmetric(
                          horizontal: 0,
                          vertical: 5,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 10.0, left: 10.0, bottom: 0.0, right: 0.0),
                          child: Text(
                            widget.taskview.task_desc,
                            style: TextStyle(
                                fontFamily: 'Inter-regular', fontSize: 14),
                          ),
                        ))),
                Container(
                  padding: EdgeInsets.only(
                      top: 0.0, left: 0.0, bottom: 50.0, right: 200.0),
                  child: Text(
                    "Earning points: ${widget.taskview.points} points",
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                        fontFamily: 'Inter-semibold'),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const GeolocationScreen()));
                  },

                  // style: ButtonStyle(elevation: MaterialStateProperty(12.0 )),
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.only(
                          top: 0.0, left: 0.0, bottom: 0.0, right: 0.0),
                      minimumSize: const Size(200, 40),
                      backgroundColor: Color.fromARGB(255, 64, 151, 64),
                      elevation: 12.0,
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Inter-Bold',
                          fontSize: 18)),
                  child: const Text('Start Task'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => TaskReport()));
                  },

                  // style: ButtonStyle(elevation: MaterialStateProperty(12.0 )),
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.only(
                          top: 0.0, left: 0.0, bottom: 0.0, right: 0.0),
                      minimumSize: const Size(200, 40),
                      backgroundColor: Color.fromARGB(255, 71, 71, 71),
                      elevation: 12.0,
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Inter-Bold',
                          fontSize: 18)),
                  child: const Text('Task Report'),
                ),
              ],
            ),
          ),
        ));
  }
}
