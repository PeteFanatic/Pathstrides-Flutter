import 'package:flutter/material.dart';
import 'package:pathstrides_mobile/Screens/register_screen.dart';
import 'login_screen.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('WELCOME!',
                style: TextStyle(
                  fontFamily: 'Inter-Black',
                  fontSize: 40,
                  color: Color.fromARGB(255, 255, 126, 45),
                  letterSpacing: -2.0,
                )),
            Center(
              child: Image.asset('assets/images/pathstrides-logo-FINAL.png'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const LoginScreen()));
              },
              child: const Text("Sign In"),
              style: TextButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 255, 126, 45),
                primary: Colors.grey[200],
                minimumSize: const Size(200.0, 40.0),
                //textStyle: GoogleFonts.montserrat(),
                shape: const StadiumBorder(),
              ),
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const RegisterScreen()));
              },
              child: const Text('Register'),
              style: OutlinedButton.styleFrom(
                primary: Color.fromARGB(255, 255, 126, 45),
                side: const BorderSide(color: Colors.orange, width: 2.0),
                minimumSize: const Size(200.0, 40.0),
                //textStyle: GoogleFonts.montserrat(),
                shape: const StadiumBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
