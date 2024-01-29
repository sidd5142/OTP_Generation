
// import 'dart:html';
// import 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:menu_order/services/database.dart';
import 'User.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // get password => null;

  // create users obj based on FirebaseUser(User)
  Users? _userFromFirebaseUser(User user){
    return user != null ? Users(uid: user.uid) : null;
  }

  //auth change user stream
  // Stream<Users> get user {
  //   return _auth.onAuthStateChanged
  //       .map(_userFromFirebaseUser);

  Stream<Users?> get user {
    return _auth.authStateChanges().map((User? user) {
      return _userFromFirebaseUser(user!);
    });
  }

  // signIn anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user!);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  // // Sign In with email and password
  // Future signInWithEmailAndPassword(String email, String password) async {
  //   try{
  //     UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
  //     User? user = result.user;
  //     return _userFromFirebaseUser(user!);
  //   }
  //   catch(e){
  //     print(e.toString());
  //     return null;
  //   }
  // }

  Future signInWithPhoneNumber(String phoneNumber) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          print("Verification Failed: ${e.message}");
          return null;
        },
        codeSent: (String verificationId, int? resendToken) async {
          print("Code Sent to $phoneNumber");
          print("Verification ID: $verificationId");
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          print("Code Auto Retrieval Timeout. Verification ID: $verificationId");
        },
      );

      // The actual sign-in happens in the verificationCompleted callback
      return null;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }



  //Sign Out
  Future signOut() async {
    try{
      return await _auth.signOut();
    }
    catch(e)
    {
      print(e.toString());
      return null;
    }
  }
}