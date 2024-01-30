import 'package:flutter/material.dart';
import '../../messaging_service/messaging_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _messagingService =
  MessagingService(); // Instance of MessagingService for handling notifications

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dashboard',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        // color: Colors.pink[50], // Set the background color to light pink
        child: const Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello User,',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Welcome to Conexa:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              SizedBox(height: 10),
              Text(
                'This is the important guidelines you have to follow:',
                style: TextStyle(fontSize: 19),
              ),
              SizedBox(height: 10),
              Text(
                '1. Through this app we are going to protect from Cyber Crime.',
                style: TextStyle(fontSize: 17),
              ),
              SizedBox(height: 5),
              Text(
                '2. You have to log in after every 72 hours otherwise your account will be blocked automatically.',
                style: TextStyle(fontSize: 17),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _messagingService
        .init(context); // Initialize MessagingService to handle notifications
  }
}
