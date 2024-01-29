
// import 'dart:js';

// import 'dart:js';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:otp/home.dart';
import 'package:otp/notification/home_notify.dart';
import 'package:otp/phone.dart';
import 'package:otp/splash.dart';
import 'package:otp/verify.dart';
import 'auth_screen.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBWuBgWPNpo5jt_HWDy9UC4iBi82ufQPIg",
      appId: '1:647327850047:android:65fe277fb48d6391aaa28a',
      messagingSenderId: '647327850047',
      projectId: '647327850047',
    ),
  );
  runApp(MaterialApp(
    initialRoute: 'splash',
    debugShowCheckedModeBanner: false,
    routes: {
      'splash': (context) => SplashScreen(),
      'lock': (context) => LocalAuthScreen(),
      'phone': (context) => MyPhone(),
      'verify': (context) => MyVerify(),
      'home': (context) => MyHome(),
      'notifyhome': (context) => const MyHomePage(title: "Set your Notification time")
    },
  ));
}