import 'dart:async';
import 'package:ever_stride/screens/intro.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:ever_stride/widgets/brand_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isImagePrecached = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_isImagePrecached) {
      precacheImage(const AssetImage('assets/images/runner.png'), context);
      _isImagePrecached = true;

      Timer(const Duration(milliseconds: 2500), () {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const IntroScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
            transitionDuration: const Duration(milliseconds: 500),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: Center(
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            Lottie.asset('assets/lottie/splash_run.json', height: 280),
            Positioned(bottom: -10, child: BrandLogo()),
          ],
        ),
      ),
    );
  }
}
