import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({super.key});

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  bool isKg = true;

  List<int> get weights => isKg
      ? List.generate(121, (i) => 30 + i)
      : List.generate(171, (i) => 66 + i);

  final List<int> feetList = List.generate(6, (i) => 3 + i); // 3ft to 8ft
  final List<int> inchesList = List.generate(12, (i) => i); // 0in to 11in

  int selectedWeightIndex = 0;
  int selectedFeetIndex = 0;
  int selectedInchesIndex = 0;

  late FixedExtentScrollController weightController;

  @override
  void initState() {
    super.initState();
    weightController = FixedExtentScrollController(
      initialItem: selectedWeightIndex,
    );
  }

  @override
  void dispose() {
    weightController.dispose();
    super.dispose();
  }

  void toggleUnit(bool value) {
    double currentValue = isKg
        ? weights[selectedWeightIndex].toDouble()
        : weights[selectedWeightIndex] / 2.20462;

    setState(() {
      isKg = value;

      double convertedValue = isKg
          ? (currentValue / 2.20462) // lbs to kg
          : (currentValue * 2.20462); // kg to lbs

      int newIndex = weights.indexWhere((w) => w >= convertedValue.round());
      if (newIndex == -1) newIndex = weights.length - 1;

      selectedWeightIndex = newIndex;

      // Jump scroll position to new index
      weightController.jumpToItem(newIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F2027),
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Text(
                "Body Metric",
                style: GoogleFonts.blackOpsOne(
                  fontSize: 40,
                  color: Colors.lightGreenAccent,
                ),
              ),
              const SizedBox(height: 10),

              // Toggle between kg and lbs
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    isKg ? "Switch to lbs" : "Switch to kg",
                    style: const TextStyle(color: Colors.white70, fontSize: 18),
                  ),
                  Switch(
                    value: isKg,
                    onChanged: toggleUnit,
                    activeThumbColor: Colors.lightGreenAccent,
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Weight picker
              Container(
                height: 250,
                width: 300,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFF1A2A30),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      "Weight (${isKg ? 'kg' : 'lbs'})",
                      style: GoogleFonts.poppins(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightGreenAccent,
                      ),
                    ),
                    Expanded(
                      child: ListWheelScrollView.useDelegate(
                        controller: weightController,
                        itemExtent: 42,
                        physics: const FixedExtentScrollPhysics(),
                        diameterRatio: 1.5,
                        onSelectedItemChanged: (index) {
                          setState(() => selectedWeightIndex = index);
                        },
                        childDelegate: ListWheelChildBuilderDelegate(
                          builder: (context, index) {
                            if (index < 0 || index >= weights.length) {
                              return const SizedBox();
                            }
                            final isSelected = index == selectedWeightIndex;
                            return Center(
                              child: Text(
                                "${weights[index]}",
                                style: TextStyle(
                                  fontSize: isSelected ? 28 : 20,
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

              const SizedBox(height: 30),

              // Height picker (feet & inches)
              Container(
                height: 250,
                width: 300,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFF1A2A30),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      "Height (ft & in)",
                      style: GoogleFonts.poppins(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightGreenAccent,
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: ListWheelScrollView.useDelegate(
                              itemExtent: 42,
                              physics: const FixedExtentScrollPhysics(),
                              diameterRatio: 1.5,
                              onSelectedItemChanged: (index) {
                                setState(() => selectedFeetIndex = index);
                              },
                              childDelegate: ListWheelChildBuilderDelegate(
                                builder: (context, index) {
                                  if (index < 0 || index >= feetList.length) {
                                    return const SizedBox();
                                  }
                                  final isSelected = index == selectedFeetIndex;
                                  return Center(
                                    child: Text(
                                      "${feetList[index]} ft",
                                      style: TextStyle(
                                        fontSize: isSelected ? 28 : 20,
                                        color: isSelected
                                            ? Colors.lightGreenAccent
                                            : Colors.white70,
                                      ),
                                    ),
                                  );
                                },
                                childCount: feetList.length,
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListWheelScrollView.useDelegate(
                              itemExtent: 42,
                              physics: const FixedExtentScrollPhysics(),
                              diameterRatio: 1.5,
                              onSelectedItemChanged: (index) {
                                setState(() => selectedInchesIndex = index);
                              },
                              childDelegate: ListWheelChildBuilderDelegate(
                                builder: (context, index) {
                                  if (index < 0 || index >= inchesList.length) {
                                    return const SizedBox();
                                  }
                                  final isSelected =
                                      index == selectedInchesIndex;
                                  return Center(
                                    child: Text(
                                      "${inchesList[index]} in",
                                      style: TextStyle(
                                        fontSize: isSelected ? 28 : 20,
                                        color: isSelected
                                            ? Colors.lightGreenAccent
                                            : Colors.white70,
                                      ),
                                    ),
                                  );
                                },
                                childCount: inchesList.length,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor:
                      Colors.transparent, // We'll use gradient below
                  shadowColor: Colors.black54,
                  elevation: 6,
                ),
                onPressed: () {
                  // Your submit logic here
                  Navigator.pushNamed(context, '/homescreen');
                },
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF76FF03), Color(0xFF64DD17)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    constraints: const BoxConstraints(
                      minWidth: 150,
                      minHeight: 40,
                    ),
                    child: Text(
                      "Submit",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                        letterSpacing: 1.2,
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
