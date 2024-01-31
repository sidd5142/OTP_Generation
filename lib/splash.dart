// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:otp/auth_screen.dart';
// import 'package:otp/screens/wrapper.dart';
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin
// {
//   @override
//   void initState() {
//     super.initState();
//     SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
//
//     Future.delayed(const Duration(seconds: 2), (){
//       Navigator.of(context).pushReplacement(MaterialPageRoute(
//           builder: (_) => const Wrapper() ));
//     });
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
//     overlays : SystemUiOverlay.values);
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.blue, Colors.purple],
//             begin: Alignment.topRight,
//             end: Alignment.bottomLeft,
//           )
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(
//               'assets/icon1.png',
//               width: 200,
//               height: 200,
//             ),
//             SizedBox(height: 20),
//             Text("Conexa",
//               style: TextStyle(
//                 fontStyle: FontStyle.italic,
//                 fontSize: 32,
//                 color: Colors.white,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:otp/auth_screen.dart';
import 'package:otp/presentation/home_page/home_page.dart';
import 'package:otp/screens/wrapper.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    _initializeVideo();

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const HomePage()),
      );
    });
  }

  void _initializeVideo() {
    _videoPlayerController = VideoPlayerController.asset("assets/vdo.gif");
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: true,
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();

    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.purple],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Chewie(
              controller: _chewieController,
            ),
            SizedBox(height: 20),
            Text(
              "Conexa",
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 32,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
