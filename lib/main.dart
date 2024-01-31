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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
  tz.initializeTimeZones();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'splash',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // accentColor: Colors.purple,
        brightness: Brightness.light, // Light theme
      ),
      darkTheme: ThemeData.dark(), // Dark theme
      routes: {
        'wrapper': (context) => Wrapper(),
        'splash': (context) => SplashScreen(),
        'lock': (context) => LocalAuthScreen(),
        'phone': (context) => MyPhone(),
        'verify': (context) => MyVerify(),
        'notifyhome': (context) => const MyHomePage(title: "Dashboard"),
        'home': (context) => HomePage(),
        'notifications': (context) => const NotificationsPage(),
      },
    );
  }
}
