import 'package:ever_stride/screens/user_aim.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F2027),
      body: SafeArea(
        child: Stack(
          children: [
            // Image Card positioned at top
            Positioned(
              top: 30,
              left: 30,
              right: 30,
              child: Card(
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
                      Transform.translate(
                        offset: const Offset(-50, 100),
                        child: Transform.scale(
                          scale: 1.5,
                          child: Image.asset(
                            'assets/images/runner.png',
                            fit: BoxFit.contain,
                            height: 500,
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
            ),

            // Text and button fixed at bottom center
            Positioned(
              left: 30,
              right: 30,
              bottom: 50,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
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
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const PurposeScreen(),
                        ),
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
          ],
        ),
      ),
    );
  }
}
