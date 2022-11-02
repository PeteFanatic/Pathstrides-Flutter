import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../task_data.dart';

class GeolocationScreen extends StatelessWidget {
  const GeolocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        // ElevatedButton(
        //   onPressed: () {
        //     Navigator.of(context).pushReplacement(
        //         MaterialPageRoute(builder: (context) => const TaskScreen()));
        //   },

        //   // style: ButtonStyle(elevation: MaterialStateProperty(12.0 )),
        //   style: ElevatedButton.styleFrom(
        //       padding:
        //           EdgeInsets.only(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0),
        //       minimumSize: const Size(200, 40),
        //       backgroundColor: Color.fromARGB(255, 64, 151, 64),
        //       elevation: 12.0,
        //       textStyle: const TextStyle(
        //           color: Colors.white, fontFamily: 'Inter-Bold', fontSize: 18)),
        //   child: const Text('Start Task'),
        // ),
        );
  }
}
