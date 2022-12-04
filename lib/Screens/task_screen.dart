// ignore_for_file: unused_local_variable, prefer_const_constructors

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:pathstrides_mobile/Screens/task_desc.dart';
import 'dart:async';

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
  int points = 0;
  String address = "";
  String task_lat = "";
  String task_long = "";
  // int status = 0;
  int user_id = 0;
  String deadline = "";

  TaskData(
      this.task_id,
      this.task_title,
      this.task_desc,
      this.points,
      this.address,
      this.task_lat,
      this.task_long,
      // this.status,
      this.user_id,
      this.deadline);
}

class _TaskScreenState extends State<TaskScreen> {
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
          u["address"],
          u["task_lat"],
          u["task_long"],
          // u["status"],
          u["user_id"],
          u["deadline"]);
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
            "Tasks",
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
          future: _getTask(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                  child: Center(child: CircularProgressIndicator()));
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  TaskData data = snapshot.data[index];
                  return Card(
                    color: Color.fromARGB(255, 255, 255, 255),
                    margin: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    child: ListTile(
                      title: Text(
                        snapshot.data[index].task_title,
                        style:
                            TextStyle(fontFamily: 'Inter-black', fontSize: 18),
                      ),
                      subtitle: Text(
                        snapshot.data[index].address,
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
                                builder: (context) => TaskDescription(data)));
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
