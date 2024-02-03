import 'package:flutter/material.dart';

import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
// import 'package:otp/screens/data.dart';
import '../screens/auth.dart';

import '../screens/loader.dart';
import 'notifi_service.dart';

DateTime scheduleTime = DateTime.now();

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool loading = false;
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.white), // Set text color to white
        ),
        backgroundColor: Colors.purple,
        elevation: 0.0,
        actions: <Widget>[
          TextButton.icon(
            icon: Icon(Icons.person, color: Colors.black,),
            label: Text('logout',
              style: TextStyle(
                color: Colors.black
              ),
            ),
            onPressed: () async {
              await _auth.signOut();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: const EdgeInsets.only(top: 30.0), // Add padding to the text
              child: Text(
                'Welcome to our app TelCom',
                style: TextStyle(fontStyle: FontStyle.italic, fontSize: 22),
              ),
            ),
            // BrewList(),
            Padding(
              padding: const EdgeInsets.only(top: 30.0, bottom: 20.0),
              child: Image.asset(
                "assets/img4.png",
                width: 250,
                height: 250,
              ),
            ),
            DatePickerTxt(),
            ScheduleBtn(),
          ],
        ),
      ),
    );
  }
}

class DatePickerTxt extends StatefulWidget {
  const DatePickerTxt({
    Key? key,
  }) : super(key: key);

  @override
  State<DatePickerTxt> createState() => _DatePickerTxtState();
}

class _DatePickerTxtState extends State<DatePickerTxt> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        DatePicker.showDateTimePicker(
          context,
          showTitleActions: true,
          onChanged: (date) => scheduleTime = date,
          onConfirm: (date) {},
        );
      },
      child: const Text(
        'Select Date Time',
        style: TextStyle(color: Colors.blue),
      ),
    );
  }
}

class ScheduleBtn extends StatelessWidget {
  const ScheduleBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text('Schedule notifications'),
      onPressed: () {
        debugPrint('Notification Scheduled for $scheduleTime');
        NotificationService().scheduleNotification(
            title: 'Scheduled Notification',
            body: '$scheduleTime',
            scheduledNotificationDateTime: scheduleTime);
      },
    );
  }
}