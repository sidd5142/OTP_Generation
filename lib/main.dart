
// import 'dart:js';

// import 'dart:js';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:otp/notification/home_notify.dart';
import 'package:otp/phone.dart';
import 'package:otp/presentation/home_page/home_page.dart';
import 'package:otp/presentation/notifications_page/notification_page.dart';
import 'package:otp/screens/wrapper.dart';
import 'package:otp/splash.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:otp/verify.dart';
import 'auth_screen.dart';
import 'firebase_options.dart';
import 'notification/notifi_service.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
  tz.initializeTimeZones();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
    // options: const FirebaseOptions(
      // apiKey: "AIzaSyBWuBgWPNpo5jt_HWDy9UC4iBi82ufQPIg",
      // appId: '1:647327850047:android:65fe277fb48d6391aaa28a',
      // messagingSenderId: '647327850047',
      // projectId: '647327850047',
      // storageBucket: 'otp-phone-6c183.appspot.com',
    // ),
  );
  runApp(MaterialApp(
    initialRoute: 'splash',
    debugShowCheckedModeBanner: false,
    routes: {
      'wrapper': (context) => Wrapper(),
      'splash': (context) => SplashScreen(),
      'lock': (context) => LocalAuthScreen(),
      'phone': (context) => MyPhone(),
      'verify': (context) => MyVerify(),
      // 'home': (context) => MyHome(),
      'notifyhome': (context) => const MyHomePage(title: "Dashboard"),
      'home': (context) => HomePage(),
      'notifications': (context) => const NotificationsPage()
    },
  ));
}