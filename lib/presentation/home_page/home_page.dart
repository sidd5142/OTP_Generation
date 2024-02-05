// // home_page.dart
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../provider.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     // Retrieve the phone number from the provider
//     String phoneNumber =
//         Provider.of<PhoneNumberProvider>(context).phoneNumber;
//
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text("DASHBOARD"),
//           centerTitle: true,
//         ),
//         body: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Card(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(15.0),
//               ),
//               elevation: 4,
//               color: Colors.lightGreen,
//               child: Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Container(
//                       width: 120,
//                       height: 120,
//                       decoration: const BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: Colors.black,
//                         image: DecorationImage(
//                           image: AssetImage('assets/profile.png'),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: Padding(
//                       padding: EdgeInsets.only(left: 10.0, right: 10.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         children: [
//                           const Text(
//                             'Hello XYZ!!',
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 20,
//                               color: Colors.white,
//                             ),
//                           ),
//                           // Remove const from here
//                           Text(
//                             'Your Phone Number: $phoneNumber',
//                             textAlign: TextAlign.center,
//                             style: const TextStyle(
//                               fontSize: 16,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 20), // Add spacing before TabBar
//             const TabBar(
//               tabs: [
//                 Tab(text: 'Status'),
//                 Tab(text: 'Guidelines'),
//                 Tab(text: 'Support'),
//               ],
//             ),
//             Expanded(
//               child: Padding(
//                 padding: EdgeInsets.all(16.0),
//                 child: TabBarView(
//                   children: [
//
//                     Center(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           SizedBox(height: 40),
//                           const Text('Thank you for your Verification',
//                             textAlign: TextAlign.center,
//                             style: TextStyle(fontStyle: FontStyle.italic, fontSize: 22),
//                           ),
//                           SizedBox(height: 15.0),
//                           const Text('You are safe now !!',
//                             textAlign: TextAlign.center,
//                             style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
//                           ),
//                           SizedBox(height: 25),
//                           Image.network(
//                             'https://cdni.iconscout.com/illustration/premium/thumb/cyber-security-4916170-4092830.png',
//                             height: 150,
//                             width: 150,
//                          ),
//                         ],
//                       ),
//                     ),
//                     Center(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           SizedBox(height: 5),
//                           Image.network(
//                             'https://www.pngall.com/wp-content/uploads/4/Cyber-Security-PNG-Clipart.png',
//                             height: 150,
//                             width: 150,
//                           ),
//                           SizedBox(height: 30),
//                           Text(
//                             'This is the important guidelines you have to follow:',
//                             style: TextStyle(fontSize: 19),
//                           ),
//                           SizedBox(height: 25),
//                           Text(
//                             '1. Through this app we are going to protect you from Cyber Crime.',
//                             style: TextStyle(fontSize: 17),
//                           ),
//                           SizedBox(height: 25),
//                           Text(
//                             '2. You have to log in after every 72 hours otherwise your account will be blocked automatically.',
//                             style: TextStyle(fontSize: 17),
//                           ),
//                           SizedBox(height: 35),
//                         ],
//                       ),
//                     ),
//                     const Center(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           SizedBox(height: 25),
//                           Text(
//                             'For any queries feel free to contact us !!!',
//                             style: TextStyle(fontSize: 19),
//                             textAlign: TextAlign.center,
//                           ),
//                           SizedBox(height: 40),
//                           Text(
//                             'Name = Siddharth Yadav',
//                             style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//                             textAlign: TextAlign.center,
//                           ),
//                           SizedBox(height: 10),
//                           Text(
//                             'email = siddharthyadav5142@gmail.com',
//                             style: TextStyle(fontSize: 18),
//                             textAlign: TextAlign.center,
//                           ),
//                           SizedBox(height: 25),
//                           Text(
//                             'Name = Vijay Yadav',
//                             style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//                             textAlign: TextAlign.center,
//                           ),
//                           SizedBox(height: 10),
//                           Text(
//                             'email = vijay@gmail.com',
//                             style: TextStyle(fontSize: 18),
//                             textAlign: TextAlign.center,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:otp/phone.dart';
import 'package:provider/provider.dart';
import '../../provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // Retrieve the phone number from the provider
    String phoneNumber =
        Provider.of<PhoneNumberProvider>(context).phoneNumber;

    return DefaultTabController(
      length: 3,
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
              color: Colors.lightBlueAccent,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      width: 120,
                      height: 120,
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
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            'Hello XYZ!!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 15,),
                          Text(
                            // padding: EdgeInsets.only(left: 10),
                            'Phone Number: $phoneNumber',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 25),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => MyPhone()),
                                );
                              },
                              child: const Padding(
                                padding: EdgeInsets.only(left: 50),
                                child: Center(
                                  child: Text(
                                    '+ Add another number',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              )
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const TabBar(
              tabs: [
                Tab(text: 'Status'),
                Tab(text: 'Guidelines'),
                Tab(text: 'Support'),
              ],
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: TabBarView(
                  children: [
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 40),
                          const Text('Thank you for your Verification',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontStyle: FontStyle.italic, fontSize: 22),
                          ),
                          SizedBox(height: 15.0),
                          const Text('You are safe now !!',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
                          ),
                          SizedBox(height: 25),
                          Image.network(
                            'https://cdni.iconscout.com/illustration/premium/thumb/cyber-security-4916170-4092830.png',
                            height: 150,
                            width: 150,
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 5),
                          Image.network(
                            'https://www.pngall.com/wp-content/uploads/4/Cyber-Security-PNG-Clipart.png',
                            height: 150,
                            width: 150,
                          ),
                          SizedBox(height: 30),
                          Text(
                            'This is the important guidelines you have to follow:',
                            style: TextStyle(fontSize: 19),
                          ),
                          SizedBox(height: 25),
                          Text(
                            '1. Through this app we are going to protect you from Cyber Crime.',
                            style: TextStyle(fontSize: 17),
                          ),
                          SizedBox(height: 25),
                          Text(
                            '2. You have to log in after every 72 hours otherwise your account will be blocked automatically.',
                            style: TextStyle(fontSize: 17),
                          ),
                          SizedBox(height: 35),
                        ],
                      ),
                    ),
                    const Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 25),
                          Text(
                            'For any queries feel free to contact us !!!',
                            style: TextStyle(fontSize: 19),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 40),
                          Text(
                            'Name = Siddharth Yadav',
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'email = siddharthyadav5142@gmail.com',
                            style: TextStyle(fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 25),
                          Text(
                            'Name = Vijay Yadav',
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'email = vijay@gmail.com',
                            style: TextStyle(fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
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
