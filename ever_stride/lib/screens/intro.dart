import 'package:ever_stride/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F2027),
      body: SafeArea(
        child: SingleChildScrollView(
          // ✅ ensures content doesn't overflow on small screens
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30.0,
              vertical: 30.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // 🔥 Flashy card with smaller image
                Card(
                  elevation: 12,
                  shadowColor: Colors.lightGreenAccent.withValues(alpha: 0.6),
                  color: Colors.black.withValues(alpha: 0.4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: Transform.scale(
                            scale: 1.3,
                            child: Image.asset(
                              'assets/images/runner.png',
                              fit: BoxFit.cover,

                              height: 550, // 👈 Reduced height
                              width: double.infinity,
                            ),
                          ),
                        ),
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.transparent,
                                  Colors.black.withValues(alpha: 0.3),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 24), // spacing below the card

                Text(
                  'Track Every Step',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.blackOpsOne(
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                    color: Colors.lightGreenAccent,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  '"Your Fitness Journey Starts here"',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.aBeeZee(
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),

                const SizedBox(height: 32), // spacing before button

                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const UserInfoScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreenAccent,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 8,
                  ),
                  child: Text(
                    'Get Started',
                    style: GoogleFonts.blackOpsOne(
                      fontWeight: FontWeight.w900,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
