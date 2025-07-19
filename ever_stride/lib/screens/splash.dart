import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'dart:async';
import 'package:ever_stride/screens/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(milliseconds: 2500), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Login()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      // backgroundColor: const Color.fromARGB(255, 219, 206, 206),
      body: Center(
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            Lottie.asset('assets/lottie/splash_run.json', height: 280),
            Positioned(
              bottom: -10, // Pull the text 10 pixels up, closer to animation
              child: RichText(
                text: TextSpan(
                  style: GoogleFonts.blackOpsOne(
                    fontSize: 40,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: 'Ever',
                      style: TextStyle(color: Colors.greenAccent.shade700),
                    ),
                    TextSpan(
                      text: 'Stride',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 223, 223, 223),
                      ),
                    ),
                    TextSpan(
                      text: '!',
                      style: TextStyle(color: Colors.greenAccent.shade700),
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
