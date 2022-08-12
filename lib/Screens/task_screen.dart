// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:pathstrides_mobile/Services/task_api.dart';
import 'dart:async';
import '../Services/task_info.dart';
import '../text_widget.dart';
import 'home_screen.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class TaskData {
  int task_id;
  String task_title = "";
  String task_desc = "";
  String points = "";
  String location = "";
  int emp_id = 0;
  int man_id = 0;

  TaskData(this.task_id, this.task_title, this.task_desc, this.points,
      this.location, this.emp_id, this.man_id);
}

class _TaskScreenState extends State<TaskScreen> {
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

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          title: new Text("hello"),
        ),
        body: Container(
            child: FutureBuilder(
          future: _getTask(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(child: Center(child: Text("hi")));
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(snapshot.data[index].task_title),
                  );
                },
              );
            }
          },
        )));
  }
}
