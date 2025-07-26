import 'package:ever_stride/screens/splash.dart';
import 'package:ever_stride/screens/user_aim.dart';
import 'package:ever_stride/screens/user_weight.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      darkTheme: ThemeData.dark(),
      routes: {
        '/purposescreen': (context) => PurposeScreen(),
        '/personaldetails_screen': (context) => PersonalDetails(),
      },
    );
  }
}
