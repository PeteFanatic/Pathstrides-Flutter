import 'package:flutter/material.dart';
import 'package:pathstrides_mobile/Screens/profile_screen.dart';
import 'package:pathstrides_mobile/Screens/task_screen.dart';
import 'announcement_screen.dart';
import 'home_screen.dart';
import 'notification_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  static const path = '/tabs';

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List<Map<String, dynamic>> _pageDetails = [
    {'page': const HomeScreen(), 'title': ''},
    {'page': const AnnouncementScreen(), 'title': ' '},
    {'page': const TaskScreen(), 'title': ' '},
    {'page': const NotificationScreen(), 'title': ''},
    {'page': const ProfileScreen(), 'title': ''},
  ];

  var _selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final selectedPage = _pageDetails[_selectedPageIndex];

    return Scaffold(
      body: selectedPage['page'],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color.fromARGB(255, 255, 126, 45),
        unselectedItemColor: Colors.grey,
        iconSize: 35,
        currentIndex: _selectedPageIndex,
        elevation: 10,
        onTap: (index) {
          setState(() => _selectedPageIndex = index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.system_security_update_warning),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: '',
          ),
        ],
      ),
    );
  }
}
