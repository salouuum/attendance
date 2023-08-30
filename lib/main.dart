
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:attendence_sfe/doctor/Doctor_Home.dart';
import 'package:attendence_sfe/Welcome.dart';
import 'package:attendence_sfe/student/sutdent_profile.dart';
import 'package:attendence_sfe/doctor/Doctor_login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        backgroundColor:Colors.grey.shade700,
        splashTransition: SplashTransition.slideTransition,
        splashIconSize: 500,
        animationDuration: Duration(seconds: 1),
        nextScreen: Welcome(),
        splash: Container(
          height: 500,
          width: 300,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  fit: BoxFit.fill,
                  image: AssetImage('Assets/logo.png'),
                  width: 300,
                  height: 200,
                ),
                SizedBox(height: 15,),
                Text(
                  'Benha University Attendance System',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10.0,),
                Text(
                  'Shoubra Faculity Of Engineering',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      theme: ThemeData(
      primaryColor: Colors.blue,
          scaffoldBackgroundColor: Colors.grey.shade700,
      ),
    );
  }
}

