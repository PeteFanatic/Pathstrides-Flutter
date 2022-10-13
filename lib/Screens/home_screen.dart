import 'package:flutter/material.dart';
import 'package:pathstrides_mobile/Screens/login_screen.dart';
import 'package:pathstrides_mobile/Screens/profile_screen.dart';
import 'package:pathstrides_mobile/Screens/task_desc.dart';
import 'announcement_screen.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'anns_desc.dart';
import 'dashboard_screen.dart';
import 'task_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Future<List<TaskData>> _getTask() async {
    var data =
        await http.get(Uri.parse('http://10.0.2.2:8000/api/employeeTask'));
    var jsonData = json.decode(data.body);

    List<TaskData> tasks = [];
    for (var u in jsonData) {
      TaskData task = TaskData(
        u["task_id"],
        u["task_title"],
        u["task_desc"],
        u["points"],
        u["location"],
        u["emp_id"],
        u["man_id"],
      );
      tasks.add(task);
    }
    print(tasks.length);

    return tasks;
  }

  Future<List<AnnouncementData>> _getAnnouncement() async {
    var data2 =
        await http.get(Uri.parse('http://10.0.2.2:8000/api/employeeAnnounce'));
    var jsonData = json.decode(data2.body);

    List<AnnouncementData> announcements = [];
    for (var a in jsonData) {
      AnnouncementData announcement = AnnouncementData(
        a["ann_id"],
        a["ann_title"],
        a["ann_desc"],
        a["location"],
        a["man_id"],
      );
      announcements.add(announcement);
    }
    print(announcements.length);
    return announcements;
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 240, 240, 240),
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.person,
                color: Color.fromARGB(255, 255, 126, 45),
              ),
              onPressed: () => Navigator.of(context, rootNavigator: true)
                  .pushReplacement(MaterialPageRoute(
                      builder: (context) => new LoginScreen())),
            )
          ],
          // IconButton(
          //               padding: EdgeInsets.zero,
          //               constraints: const BoxConstraints(),
          //               icon: const Icon(
          //                 Icons.person,
          //                 color: Color.fromARGB(255, 255, 126, 45),
          //               ),
          //               onPressed: () => Navigator.push(
          //                   context,
          //                   MaterialPageRoute(
          //                       builder: (context) => LoginScreen()))),
          title: new Text(
            "Let's get out and work!",
            style: TextStyle(
              fontFamily: 'Inter-bold',
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 5,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                // ignore: prefer_const_constructors
                padding: EdgeInsets.only(
                    top: 20.0, left: 0.0, bottom: 0.0, right: 0.0),
                child: const Text('Tasks',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontFamily: 'Inter-Bold',
                        fontSize: 20.0,
                        letterSpacing: -1.0,
                        fontWeight: FontWeight.bold)),
              ),
              Container(
                  margin: EdgeInsets.only(
                      top: 10.0, left: 0.0, bottom: 0.0, right: 0.0),
                  height: 300,
                  width: 800,
                  child: FutureBuilder(
                    future: _getTask(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.data == null) {
                        return Container(
                            child: Center(child: CircularProgressIndicator()));
                      } else {
                        return ListView.builder(
                          itemCount: snapshot.data.length < 3
                              ? snapshot.data.length
                              : 3,
                          itemBuilder: (BuildContext context, int index) {
                            TaskData data = snapshot.data[index];
                            TaskData taskview;
                            return Card(
                              color: Colors.white,
                              margin: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              child: ListTile(
                                title: Text(
                                  snapshot.data[index].task_title,
                                  style: TextStyle(
                                      fontFamily: 'Inter-black', fontSize: 18),
                                ),
                                subtitle: Text(
                                  snapshot.data[index].location,
                                  style: TextStyle(
                                      fontFamily: 'Inter-semibold',
                                      fontSize: 12),
                                ),
                                trailing: Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color:
                                      const Color.fromARGB(255, 255, 126, 45),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => TaskScreen()));
                                },
                              ),
                            );
                          },
                        );
                      }
                    },
                  )),
              Container(
                // ignore: prefer_const_constructors
                padding: EdgeInsets.only(
                    top: 0.0, left: 0.0, bottom: 0.0, right: 0.0),
                child: const Text('Announcements',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontFamily: 'Inter-Bold',
                        fontSize: 20.0,
                        letterSpacing: -1.0,
                        fontWeight: FontWeight.bold)),
              ),
              Container(
                  padding: EdgeInsets.only(
                      top: 10.0, left: 0.0, bottom: 0.0, right: 0.0),
                  height: 300,
                  width: 800,
                  child: FutureBuilder(
                    future: _getAnnouncement(),
                    builder: (BuildContext context, AsyncSnapshot snapshot2) {
                      if (snapshot2.data == null) {
                        return Container(
                            child: Center(child: CircularProgressIndicator()));
                      } else {
                        return ListView.builder(
                          itemCount: snapshot2.data.length < 3
                              ? snapshot2.data.length
                              : 3,
                          itemBuilder: (BuildContext context, int index) {
                            AnnouncementData data = snapshot2.data[index];
                            return Card(
                              color: Colors.white,
                              margin: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              child: ListTile(
                                title: Text(
                                  snapshot2.data[index].ann_title,
                                  style: TextStyle(
                                      fontFamily: 'Inter-black', fontSize: 18),
                                ),
                                subtitle: Text(
                                  snapshot2.data[index].location,
                                  style: TextStyle(
                                      fontFamily: 'Inter-semibold',
                                      fontSize: 12),
                                ),
                                trailing: Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color:
                                      const Color.fromARGB(255, 255, 126, 45),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              AnnouncementScreen()));
                                },
                              ),
                            );
                          },
                        );
                      }
                    },
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
