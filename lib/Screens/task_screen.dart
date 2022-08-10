import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pathstrides_mobile/Services/get_api.dart';

import '../Services/task_info.dart';
import '../text_widget.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  var tasks = <TaskInfo>[];
  @override
  void initState() {
    _getTask();
    super.initState();
  }

  _getTask() {
    CallApi().getEmployeeTaskData('employeeTask').then((response) {
      Iterable list = json.decode(response.body);
      tasks = list.map((model) => TaskInfo.fromJson(model)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
          color: Colors.white,
          child: SafeArea(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: height * 0.02),
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Color.fromARGB(255, 255, 126, 45),
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                    IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        icon: const Icon(
                          Icons.person,
                          color: Color.fromARGB(255, 255, 126, 45),
                        ),
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Container()))),
                  ],
                ),
              ),
              // SizedBox(height: 15,),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: tasks.map((task) {
                      return Text(task.task_title);
                    }).toList(),
                  ),
                ),
              ),
            ],
          ))),
    );
  }
}
