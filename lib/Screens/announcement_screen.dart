// ignore_for_file: unused_local_variable, prefer_const_constructors, avoid_unnecessary_containers, unnecessary_new, avoid_print, non_constant_identifier_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:async';
import '../Screens/anns_desc.dart';
import 'home_screen.dart';

class AnnouncementScreen extends StatefulWidget {
  const AnnouncementScreen({super.key});

  @override
  State<AnnouncementScreen> createState() => _AnnouncementScreenState();
}

class AnnouncementData {
  int ann_id;
  String ann_title = "";
  String ann_desc = "";
  String location = "";
  int man_id = 0;

  AnnouncementData(
      this.ann_id, this.ann_title, this.ann_desc, this.location, this.man_id);
}

class _AnnouncementScreenState extends State<AnnouncementScreen> {
  // var tasks = <TaskInfo>[];
  // @override
  // void initState() {
  //   _getTask();
  //   super.initState();
  // }

  // Future _getTask() async {
  //   CallApi().getEmployeeTaskData('employeeTask').then((response) {
  //     Iterable list = json.decode(response.body);
  //     tasks = list.map((model) => TaskInfo.fromJson(model)).toList();
  //   });
  // }
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
            "Announcements",
            style: TextStyle(
              fontFamily: 'Inter-bold',
              color: Colors.black,
            ),
          ),
          backgroundColor: Color.fromARGB(255, 240, 240, 240),
          elevation: 0,
        ),
        body: Container(
            child: FutureBuilder(
          future: _getAnnouncement(),
          builder: (BuildContext context, AsyncSnapshot snapshot2) {
            if (snapshot2.data == null) {
              return Container(
                  child: Center(child: CircularProgressIndicator()));
            } else {
              return ListView.builder(
                itemCount: snapshot2.data.length,
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
                        style:
                            TextStyle(fontFamily: 'Inter-black', fontSize: 18),
                      ),
                      subtitle: Text(
                        snapshot2.data[index].location,
                        style: TextStyle(
                            fontFamily: 'Inter-semibold', fontSize: 12),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: const Color.fromARGB(255, 255, 126, 45),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    AnnounceDescription(data)));
                      },
                    ),
                  );
                },
              );
            }
          },
        )));
  }
}
