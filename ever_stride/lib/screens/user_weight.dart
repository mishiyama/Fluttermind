import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({super.key});

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  final List<int> weights = List.generate(121, (i) => 30 + i); // for weight
  final List<int> feetList = List.generate(6, (i) => 3 + i); // 3ft–8ft height
  final List<int> inchesList = List.generate(12, (i) => i); // 0in–11in height

  int selectedWeightIndex = 0; // Default selected index for weight
  int selectedFeetIndex = 0; // Default selected index for feet(height)
  int selectedInchesIndex = 0; //  Default selected index for inch(height)

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
                padding: const EdgeInsets.fromLTRB(24.0, 54.0, 24.0, 0),
                height: 300,
                width: 300,
                color: Colors.transparent,
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                const SizedBox(height: 20),
                                Text(
                                  "Weight (kg)",
                                  style: GoogleFonts.poppins(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.lightGreenAccent,
                                  ),
                                ),
                                Expanded(
                                  child: ListWheelScrollView.useDelegate(
                                    itemExtent: 42,
                                    physics: const FixedExtentScrollPhysics(),
                                    diameterRatio: 1.5,
                                    onSelectedItemChanged: (index) {
                                      setState(
                                        () => selectedWeightIndex = index,
                                      );
                                    },
                                    childDelegate:
                                        ListWheelChildBuilderDelegate(
                                          builder: (context, index) {
                                            if (index < 0 ||
                                                index >= weights.length) {
                                              return const SizedBox();
                                            }
                                            final isSelected =
                                                index == selectedWeightIndex;
                                            return Center(
                                              child: Text(
                                                "${weights[index]}",
                                                style: TextStyle(
                                                  fontSize: isSelected
                                                      ? 28
                                                      : 20,
                                                  color: isSelected
                                                      ? Colors.lightGreenAccent
                                                      : Colors.white70,
                                                ),
                                              ),
                                            );
                                          },
                                          childCount: weights.length,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
