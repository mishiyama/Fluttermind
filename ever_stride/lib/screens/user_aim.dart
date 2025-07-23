import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PurposeScreen extends StatefulWidget {
  const PurposeScreen({super.key});

  @override
  State<PurposeScreen> createState() => _PurposeScreenState();
}

class _PurposeScreenState extends State<PurposeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F2027),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Your Purpose',
          style: GoogleFonts.blackOpsOne(
            color: Colors.lightGreenAccent,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
      ),
    );
  }
}
