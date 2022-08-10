// ignore_for_file: non_constant_identifier_names, prefer_initializing_formals

// import 'dart:convert';

class TaskInfo {
  int task_id = 0;
  String task_title = "";
  String task_desc = "";
  int points = 0;
  String location = "";
  int emp_id = 0;
  int man_id = 0;

  TaskInfo(int task_id, String task_title, String task_desc, int points,
      String location, int emp_id, int man_id) {
    this.task_id = task_id;
    this.task_title = task_title;
    this.task_desc = task_desc;
    this.points = points;
    this.location = location;
    this.emp_id = emp_id;
    this.man_id = man_id;
  }

  TaskInfo.fromJson(Map json)
      : task_id = json['task_id'],
        task_title = json['task_title'],
        task_desc = json['task_desc'],
        points = json['points'],
        location = json['location'],
        emp_id = json['emp_id'],
        man_id = json['man_id'];
}
