import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pathstrides_mobile/Services/auth_services.dart';
import 'package:pathstrides_mobile/Services/globals.dart';

import '../rounded_button.dart';
import 'home_screen.dart';
import 'login_screen.dart';
import 'package:http/http.dart' as http;

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // String _email = '';
  // String _password = '';
  // String _name = '';

  // createAccountPressed() async {
  //   bool emailValid = RegExp(
  //           r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
  //       .hasMatch(_email);
  //   if (emailValid) {
  //     http.Response response =
  //         await AuthServices.register(_password, _email, _password);
  //     Map responseMap = jsonDecode(response.body);
  //     if (response.statusCode == 200) {
  //       Navigator.push(
  //           context,
  //           MaterialPageRoute(
  //             builder: (BuildContext context) => const HomeScreen(),
  //           ));
  //     } else {
  //       errorSnackBar(context, responseMap.values.first[0]);
  //     }
  //   } else {
  //     errorSnackBar(context, 'email not valid');
  //   }
  String _password = '';
  String _new_password = '';
  String _confirm_password = '';

  createAccountPressed() async {
    // bool emailValid = RegExp(
    //         r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
    //     .hasMatch(_email);
    if (_password.isNotEmpty &&
        _new_password.isNotEmpty &&
        _confirm_password.isNotEmpty) {
      http.Response response = await AuthServices.register(
          _password, _new_password, _confirm_password);
      Map responseMap = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const HomeScreen(),
            ));
      } else {
        errorSnackBar(context, responseMap.values.first[0]);
      }
    } else {
      errorSnackBar(context, 'password not valid');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const LoginScreen()));
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
              // ignore: prefer_const_constructors
              padding: EdgeInsets.only(
                  top: 50.0, left: 0.0, bottom: 50.0, right: 0.0),
              child: const Text('Update Password',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Inter-Black',
                      fontSize: 26.0,
                      letterSpacing: -1.0,
                      fontWeight: FontWeight.bold)),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Old Password',
              ),
              onChanged: (value) {
                _password = value;
              },
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'Inter-SemiBold',
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              decoration: const InputDecoration(
                hintText: 'New Password',
              ),
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'Inter-SemiBold',
              ),
              onChanged: (value) {
                _new_password = value;
              },
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Confirm New Password',
              ),
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'Inter-SemiBold',
              ),
              onChanged: (value) {
                _confirm_password = value;
              },
            ),
            const SizedBox(
              height: 40,
            ),
            RoundedButton(
              btnText: 'Update',
              onBtnPressed: () => createAccountPressed(),
            ),
            const SizedBox(
              height: 40,
            ),
            // GestureDetector(
            //   onTap: () {
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (BuildContext context) => const LoginScreen(),
            //         ));
            //   },
            //   child: const Text(
            //     'already have an account? Login Here',
            //     style: TextStyle(
            //       decoration: TextDecoration.underline,
            //       fontSize: 14,
            //       fontFamily: 'Inter-SemiBold',
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
