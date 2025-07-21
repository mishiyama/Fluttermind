import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F2027), // Dark gradient-like background
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 📌 Top Illustration with rounded corners & elevation
              Expanded(
                child: Center(
                  child: Material(
                    elevation: 12, // 👈 this gives the lift/shadow
                    borderRadius: BorderRadius.circular(25),
                    clipBehavior:
                        Clip.antiAlias, // 👈 makes rounded corners work
                    child: SizedBox(
                      width: 260,
                      height: 360,
                      child: Image.asset(
                        'assets/images/runner.png', // ✅ make sure asset exists
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),

              // ✨ Tagline
              Column(
                children: [
                  Text(
                    "Track every step.",
                    style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.greenAccent.shade700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 18),
                  Text(
                    "Your fitness journey starts here!",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),

              // 🚀 Get Started Button
              Padding(
                padding: const EdgeInsets.only(bottom: 20, top: 40),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.greenAccent.shade700,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    onPressed: () {
                      // 🔥 TODO: Navigate to user info screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UserInfoScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "Get Started",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 📝 Placeholder for the next screen
class UserInfoScreen extends StatelessWidget {
  const UserInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Your Info")),
      body: const Center(
        child: Text(
          "Weight & Height form goes here",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
