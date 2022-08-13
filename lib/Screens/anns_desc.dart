import 'home_screen.dart';
import 'package:flutter/material.dart';
import '../Screens/announcement_screen.dart';

class AnnounceDescription extends StatelessWidget {
  final AnnouncementData announceview;
  AnnounceDescription(this.announceview);

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
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const AnnouncementScreen()));
            },
          ),
          title: Text(
            announceview.ann_title,
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
          //           builder: (context) => const AnnouncementScreen()));
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
                    announceview.ann_title,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 30.0, fontFamily: 'Inter-black'),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 10.0, right: 0.0),
                  child: Text(
                    announceview.location,
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
                            announceview.ann_desc,
                            style: TextStyle(
                                fontFamily: 'Inter-regular', fontSize: 14),
                          ),
                        ))),
              ],
            ),
          ),
        ));
  }
}
