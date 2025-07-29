import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({super.key});

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F2027),
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              Text(
                "Your Details",
                style: GoogleFonts.blackOpsOne(
                  fontSize: 40,
                  color: Colors.lightGreenAccent,
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 40.0),
                height: 300,
                width: 300,
                color: Colors.transparent,
                child: Column(
                  children: [
                    Text(
                      "Weight(kg)",
                      style: GoogleFonts.poppins(fontSize: 15),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
