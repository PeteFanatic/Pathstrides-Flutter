//import 'package:flutter/src/widgets/container.dart';
//import 'package:flutter/src/widgets/framework.dart';
//import 'home_screen.dart';
// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'dart:async';
//import 'dart:convert';
import 'dart:io';
//import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:pathstrides_mobile/Screens/task_desc.dart';
import '../Screens/task_screen.dart';
import '../image_Controller.dart';

class TaskReport extends StatefulWidget {
  const TaskReport({Key? key}) : super(key: key);
  @override
  _TaskReportState createState() => _TaskReportState();
}

class _TaskReportState extends State<TaskReport> {
  late TaskData taskview;
  TextEditingController nameController = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  File? _image;
  PickedFile? _pickedFile;
  final _picker = ImagePicker();
  Future<void> choiceImage() async {
    // ignore: deprecated_member_use
    _pickedFile = await _picker.getImage(source: ImageSource.gallery);
    if (!mounted) {
      return;
    }
    if (_pickedFile != null) {
      setState(() {
        _image = File(_pickedFile!.path);
      });
    }

    // void submitValues() async {
    //   Blob blob = new Blob(await _image.readAsBytes());
    // }
    // try {
    //   final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    //   if (image == null) return;
    //   final imageTemporary = File(image.path);
    //   if (!mounted) {
    //     return;
    //   }
    //   setState(() {
    //     _image = imageTemporary;
    //   });
    // } catch (error) {
    //   print("error: $error");
    // }
  }

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ImageController());
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
            "Task Report",
            style: TextStyle(
              fontFamily: 'Inter-bold',
              color: Colors.black,
            ),
          ),
          backgroundColor: Color.fromARGB(255, 240, 240, 240),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GetBuilder<ImageController>(builder: (imageController) {
                  return SafeArea(
                      child: Container(
                    padding: EdgeInsets.only(
                        top: 20, left: 100.0, right: 100.0, bottom: 40),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 255, 126, 45)),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Center(
                          child: GestureDetector(
                              child: const Text('Select An Image'),
                              //onPressed: _openImagePicker,
                              //onTap:()=> Get.find<ImageController>().pickImage(),
                              onTap: () => imageController.pickImage()),
                        ),
                        const SizedBox(height: 35),
                        // Padding(
                        //   padding: const EdgeInsets.all(4.0),
                        //   child: IconButton(
                        //     icon: Icon(Icons.image),
                        //     iconSize: 80,
                        //     color: Color.fromARGB(255, 192, 192, 192),
                        //     onPressed: () {
                        //       Navigator.pop(context);
                        //       choiceImage();
                        //     },
                        //   ),
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.all(0),
                        //   child: Text(
                        //     "Insert Image",
                        //     style: TextStyle(
                        //         color: Color.fromARGB(255, 173, 173, 173),
                        //         fontFamily: 'Inter-Medium',
                        //         fontSize: 18),
                        //   ),
                        // ),
                        Container(
                          // ignore: unnecessary_null_comparison
                          alignment: Alignment.center,
                          width: double.infinity,
                          height: 200,
                          child: imageController.pickedFile != null
                              ? Image.file(
                                  File(imageController.pickedFile!.path),
                                  width: 300,
                                  height: 300,
                                  fit: BoxFit.cover)
                              : const Text('No Image Selected'),
                        ),
                      ],
                    ),
                  ));
                }),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(
                      top: 30, left: 0.0, right: 0.0, bottom: 10),
                  child: Text(
                    "Caption:",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        fontFamily: 'Inter-bold'),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                      top: 0, left: 0.0, right: 0.0, bottom: 20),
                  child: TextFormField(
                    minLines: 4,
                    maxLines: 5,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Enter your report...',
                      hintStyle: TextStyle(fontFamily: 'Inter-regular'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                    ),
                  ),
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
                      backgroundColor: Color.fromARGB(255, 64, 151, 64),
                      elevation: 12.0,
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Inter-Bold',
                          fontSize: 18)),
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ));
  }
}
