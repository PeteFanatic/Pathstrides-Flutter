// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pathstrides_mobile/Services/auth_services.dart';

import 'package:pathstrides_mobile/Services/globals.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../Services/task_api.dart';
import '../rounded_button.dart';
import 'dashboard_screen.dart';
import 'home_screen.dart';
import 'landing_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool ishiddenPassword = true;

  bool _isLoading = false;

  // TextEditingController mailController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();
  ScaffoldState scaffoldState = ScaffoldState();
  _showMsg(msg) {
    //
    final snackBar = SnackBar(
      content: Text(msg),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          // Some code to undo the change!
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  loginPressed() async {
    
    var res = await CallApi().postData(data, 'login');
    var body = json.decode(res.body);
    if (_email.isNotEmpty && _password.isNotEmpty) {
      http.Response response = await AuthServices.login(_email, _password);
      Map responseMap = jsonDecode(response.body);
      if (response.statusCode == 200) {
        // ignore: use_build_context_synchronously
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        localStorage.setString('token', body['token']);
        localStorage.setString('employee', json.encode(body['employee']));
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => DashboardScreen(),
            ));
      } else {
        // ignore: use_build_context_synchronously
        errorSnackBar(context, responseMap.values.first);
      }
    } else {
      errorSnackBar(context, 'enter all required fields');
    }
    setState(() {
      _isLoading = false;
    });
  }

  void _togglePasswordView() {
    // if (ishiddenPassword == true) {
    //   ishiddenPassword = false;
    // } else {
    //   ishiddenPassword = true;
    // }
    setState(() {
      ishiddenPassword = !ishiddenPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      verticalDirection: VerticalDirection.down,
      children: <Widget>[
        IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const LandingScreen()));
          },
          padding: const EdgeInsets.only(
              top: 40.0, left: 0.0, bottom: 0.0, right: 330.0),
          icon: const Icon(
            Icons.arrow_circle_left_rounded,
            color: const Color.fromARGB(255, 255, 126, 45),
            size: 40.0,
          ),
        ),
        Container(
          padding: const EdgeInsets.only(
              top: 30.0, left: 0.0, bottom: 0.0, right: 0.0),
          height: 180,
          width: double.infinity,
          child: Image.asset(
            "assets/images/pathstrides-logo-with-text.png",
            width: 100,
            height: 100,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: TextField(
            decoration: const InputDecoration(
              hintText: 'Enter email',
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 255, 126, 45),
                ),
              ),
            ),
            onChanged: (value) {
              _email = value;
            },
            style: const TextStyle(
              fontSize: 16,
              fontFamily: 'Inter-SemiBold',
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: TextField(
            obscureText: ishiddenPassword,
            // controller: passwordController,
            decoration: InputDecoration(
                hintText: 'Enter password',
                // ignore: prefer_const_constructors
                focusedBorder: UnderlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 255, 126, 45),
                  ),
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      ishiddenPassword = !ishiddenPassword;
                    });
                  },
                  child: Icon(
                    ishiddenPassword ? Icons.visibility : Icons.visibility_off,
                    color: const Color.fromARGB(255, 255, 126, 45),
                  ),
                )),
            style: const TextStyle(
              fontSize: 16,
              fontFamily: 'Inter-SemiBold',
            ),
            onChanged: (value) {
              _password = value;
            },
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        RoundedButton(
          btnText: 'Log In',
          onBtnPressed: () => _isLoading ? null : loginPressed(),
        )
      ],
    ));
  }

  // void _login() async {
  //   setState(() {
  //     _isLoading = true;
  //   });

  //   var data = {
  //     'email': mailController.text,
  //     'password': passwordController.text
  //   };

  //   var res = await CallApi().postData(data, 'login');
  //   var body = json.decode(res.body);
  //   if (body['success']) {
  //     SharedPreferences localStorage = await SharedPreferences.getInstance();
  //     localStorage.setString('token', body['token']);
  //     localStorage.setString('employee', json.encode(body['employee']));
  //     Navigator.push(context,
  //         new MaterialPageRoute(builder: (context) => DashboardScreen()));
  //   } else {
  //     _showMsg(body['message']);
  //   }

  //   setState(() {
  //     _isLoading = false;
  //   });
  // }
}
