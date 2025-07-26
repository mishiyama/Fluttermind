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
        padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 40.0),
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
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      padding: const EdgeInsets.symmetric(
                        vertical: 18,
                        horizontal: 16,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: isSelected
                            ? Colors.lightGreenAccent.withValues(alpha: 0.2)
                            : Colors.black.withValues(alpha: 0.3),
                        border: Border.all(
                          color: isSelected
                              ? Colors.lightGreenAccent
                              : Colors.white24,
                          width: 2,
                        ),
                        boxShadow: isSelected
                            ? [
                                BoxShadow(
                                  color: Colors.lightGreenAccent.withValues(
                                    alpha: 0.5,
                                  ),
                                  blurRadius: 12,
                                  spreadRadius: 2,
                                ),
                              ]
                            : [],
                      ),
                      child: Row(
                        children: [
                          Icon(
                            isSelected
                                ? Icons.check_circle
                                : Icons.circle_outlined,
                            color: isSelected
                                ? Colors.lightGreenAccent
                                : Colors.white54,
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              purpose,
                              style: GoogleFonts.blackOpsOne(
                                fontSize: 20,
                                color: isSelected
                                    ? Colors.lightGreenAccent
                                    : Colors.white70,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: selectedPurpose == null
                  ? null // disabled if nothing selected
                  : () {
                      Navigator.pushNamed(context, '/personaldetails_screen');
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightGreenAccent,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 18,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 8,
              ),
              child: Text(
                'Continue',
                style: GoogleFonts.blackOpsOne(
                  fontWeight: FontWeight.w900,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
