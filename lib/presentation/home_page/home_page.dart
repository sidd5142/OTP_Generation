import 'package:flutter/material.dart';
import '../../messaging_service/messaging_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("DASHBOARD"),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 4,
              color: Colors.lightGreen,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                        image: DecorationImage(
                          image: AssetImage('assets/profile.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 14.0, right: 25.0),
                      child: Text(
                        'Hello XYZ!!',
                        textAlign: TextAlign.end,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20), // Add spacing before TabBar
            const TabBar(
              tabs: [
                Tab(text: 'Guidelines'),
                Tab(text: 'Status'),
                // Tab(text: 'Calls'),
                // Tab(text: 'Settings'),
              ],
            ),
            const Expanded(
              child: Padding(padding: EdgeInsets.all(16.0),
              child: TabBarView(
                children: [
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 15),
                        Text(
                          'This is the important guidelines you have to follow:',
                          style: TextStyle(fontSize: 19),
                        ),
                        SizedBox(height: 15),
                        Text(
                          '1. Through this app we are going to protect from Cyber Crime.',
                          style: TextStyle(fontSize: 17),
                        ),
                        SizedBox(height: 15),
                        Text(
                          '2. You have to log in after every 72 hours otherwise your account will be blocked automatically.',
                          style: TextStyle(fontSize: 17),
                        ),
                      ],
                    ),
                  ),
                  Center(child: Text('Status Page')),
                  // Add other TabBarView pages as needed
                ],
              ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
