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
          "Your Purpose",
          style: GoogleFonts.blackOpsOne(
            fontSize: 30,
            color: Colors.lightGreenAccent,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Why are you joining EverStride?",
              textAlign: TextAlign.center,
              style: GoogleFonts.aBeeZee(
                fontSize: 18,
                fontStyle: FontStyle.italic,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 24),

            // 🔥 interactive options
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
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
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

            const SizedBox(height: 16),

            // ✅ Continue Button
            ElevatedButton(
              onPressed: selectedPurpose == null
                  ? null
                  : () {
                      // 👉 Handle navigation or save purpose here
                      // Example:
                      // Navigator.push(context, MaterialPageRoute(builder: (_) => NextScreen()));
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
