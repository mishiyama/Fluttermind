import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserWeight extends StatefulWidget {
  const UserWeight({super.key});

  @override
  State<UserWeight> createState() => _UserWeightState();
}

class _UserWeightState extends State<UserWeight> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F2027),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Your Purpose",
          style: GoogleFonts.blackOpsOne(
            fontSize: 30,
            color: Colors.lightGreenAccent,
          ),
        ),
        centerTitle: true,
      ),
    );
  }
}
