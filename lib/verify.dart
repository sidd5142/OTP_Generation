import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:otp/phone.dart';
import 'package:otp/provider.dart';
import 'package:otp/screens/loader.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class MyVerify extends StatefulWidget {
  const MyVerify({Key? key}) : super(key: key);

  @override
  State<MyVerify> createState() => _MyVerifyState();
}

class _MyVerifyState extends State<MyVerify> {

  bool loading = false;

  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    String phoneNumber =
        Provider.of<PhoneNumberProvider>(context).phoneNumber;
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    var code = "";
    return loading ? Loading() : Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25.0, bottom: 5.0),
                child: Image.asset(
                  "assets/img3.png",
                  width: 220,
                  height: 220,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                "Phone Verification",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "We need to register your phone without getting started!",
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height : 30),
               Text(
                "OTP send to $phoneNumber",
                style: TextStyle(
                  fontSize: 17,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(
                height: 30,
              ),
              Pinput(
                length: 6,
                // defaultPinTheme: defaultPinTheme,
                // focusedPinTheme: focusedPinTheme,
                // submittedPinTheme: submittedPinTheme,

                showCursor: true,
                onChanged: (value){
                  code = value;
                },
                onCompleted: (pin) => print(pin),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.lightGreenAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () async{
                      try {
                        PhoneAuthCredential credential = PhoneAuthProvider.credential(
                            verificationId: MyPhone.verify,
                            smsCode: code
                        );
                        await auth.signInWithCredential(credential);
                        Navigator.pushNamedAndRemoveUntil(context, "home", (route) => false);
                      }
                      catch(e){
                        print("Wrong OTP");
                      }
                    },
                    child: Text("Verify Phone Number")),
              ),
              Row(
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          'phone',
                              (route) => false,
                        );
                      },
                      child: Text(
                        "Edit Phone Number ?",
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}