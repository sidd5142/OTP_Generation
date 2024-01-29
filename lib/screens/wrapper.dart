import 'package:flutter/material.dart';
import 'package:otp/auth_screen.dart';
import 'package:otp/notification/home_notify.dart';
import 'package:otp/phone.dart';
import 'package:provider/provider.dart';
import 'User.dart';


class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<Users?>(context);
    // print(user);
    // // return either home or authenticate
    // return Authenticate();
    if(user == null)
    {
      return LocalAuthScreen();
    } else{
      return MyHomePage(title: "TelCom");
    }
  }
}


