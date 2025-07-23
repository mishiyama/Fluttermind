import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PurposeScreen extends StatefulWidget {
  const PurposeScreen({super.key});

  @override
  State<PurposeScreen> createState() => _PurposeScreenState();
}

class _PurposeScreenState extends State<PurposeScreen> {
  final List<String> purposes = [
    "Lose Weight",
    "Stay Fit",
    "Train for an Event",
    "Track Daily Steps",
    "Just Exploring",
  ];
  String? selectedPurpose;
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
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                '"Why are you joining EverStride !?"',

                style: GoogleFonts.aBeeZee(
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                  color: Colors.white70,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.builder(
                itemCount: purposes.length,
                itemBuilder: (context, index) {
                  final purpose = purposes[index];
                  final isSelected = selectedPurpose == purpose;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedPurpose = purpose;
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
