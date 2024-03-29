import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_local_auth/screens/home_screen.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';
import 'package:local_auth/error_codes.dart' as auth_error;
import 'package:otp/phone.dart';
import 'package:otp/screens/loader.dart';

// import 'home_screen.dart';

class LocalAuthScreen extends StatefulWidget {
  const LocalAuthScreen({Key? key}) : super(key: key);
  @override
  State<LocalAuthScreen> createState() => _LocalAuthScreenState();
}
class _LocalAuthScreenState extends State<LocalAuthScreen> {
  final LocalAuthentication auth = LocalAuthentication();
  bool loading = false;

  Future<void> authinticate() async {
    try {
      final bool didAuthenticate = await auth.authenticate(
        localizedReason: 'Please authenticate to open your Account',
        options: const AuthenticationOptions(useErrorDialogs: false),
      );
      if (didAuthenticate == true) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MyPhone()));
      }
    } on PlatformException catch (e) {
      if (e.code == auth_error.notEnrolled) {
        // Add handling of no hardware here.
      } else if (e.code == auth_error.lockedOut ||
          e.code == auth_error.permanentlyLockedOut) {
      } else {
        // ...
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      appBar: AppBar(
        title: const Text('ZIOSAFE',
        style: TextStyle( fontWeight: FontWeight.bold, fontSize: 26, color: Colors.blue),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Image.asset(
              'assets/home2.png',
              width: 250,
              height: 250,
            ),
          ),
          const Padding(
            padding: const EdgeInsets.fromLTRB(45, 40, 20, 10), // Add padding to the text
            child: Text(
                  'Protect your phone at all times',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26, fontStyle: FontStyle.italic),
            ),
          ),

          const Padding(
            padding: const EdgeInsets.fromLTRB( 45, 10, 30, 15),
            child: Center(// Add padding to the text
            child: Text(
              'Keep your phone safe from hackers. '
                  'Authenticate before accessing the app',
              textAlign: TextAlign.center,

              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
            ),
          ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightBlue,
                ),
                child: Icon(Icons.arrow_forward_rounded, color: Colors.white, size: 30), // Use arrow icon
                onPressed: () => authinticate(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}