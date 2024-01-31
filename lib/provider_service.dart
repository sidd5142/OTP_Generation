import 'package:flutter/material.dart';

class PhoneNumberProvider extends ChangeNotifier {
  String _phoneNumber = "";

  String get phoneNumber => _phoneNumber;

  void setPhoneNumber(String number) {
    _phoneNumber = number;
    notifyListeners();
  }
}