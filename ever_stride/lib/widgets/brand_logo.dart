import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BrandLogo extends StatefulWidget {
  const BrandLogo({super.key});

  @override
  State<BrandLogo> createState() => _BrandLogoState();
}

class _BrandLogoState extends State<BrandLogo> {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: GoogleFonts.blackOpsOne(fontSize: 40, color: Colors.black),
        children: [
          TextSpan(
            text: 'Ever',
            style: TextStyle(color: Colors.greenAccent.shade700),
          ),
          TextSpan(
            text: 'Stride',
            style: TextStyle(color: const Color.fromARGB(255, 223, 223, 223)),
          ),
          TextSpan(
            text: '!',
            style: TextStyle(color: Colors.greenAccent.shade700),
          ),
        ],
      ),
    );
  }
}
