

import 'package:bmi_calculator/screens/result_screen.dart'; 
import 'package:bmi_calculator/widgets/counter_card.dart';
import 'package:bmi_calculator/widgets/gender_card.dart';
import 'package:bmi_calculator/widgets/height_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const Color activeCardColor = Color(0xFF1D1E33);
  static const Color inactiveCardColor = Color(0xFF111328);
  static const Color primaryPink = Color(0xFFEB1555);

  bool isMale = true;
  double height = 150;
  int weight = 60;
  int age = 26;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E21),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0E21),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'BMI Calculator',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double maxWidth = constraints.maxWidth > 600 ? 500 : double.infinity;

          return Center(
            child: SizedBox(
              width: maxWidth,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment:CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: GenderCard(
                              title: 'Male',
                              icon: Icons.male,
                              isSelected: isMale,
                              activeColor: activeCardColor,
                              inactiveColor: inactiveCardColor,
                              onTap: () => setState(() => isMale = true),
                            ),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: GenderCard(
                              title: 'Female',
                              icon: Icons.female,
                              isSelected: !isMale,
                              activeColor: activeCardColor,
                              inactiveColor: inactiveCardColor,
                              onTap: () => setState(() => isMale = false),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    Expanded(
                      child: HeightCard(
                        height: height,
                        activeColor: activeCardColor,
                        accentColor: primaryPink,
                        onChanged: (val) => setState(() => height = val),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: CounterCard(
                              title: 'Weight',
                              value: weight,
                              activeColor: activeCardColor,
                              decHeroTag: 'weight_dec',
                              incHeroTag: 'weight_inc',
                              onDecrement: () {
                                if (weight > 1) setState(() => weight--);
                              },
                              onIncrement: () => setState(() => weight++),
                            ),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: CounterCard(
                              title: 'Age',
                              value: age,
                              activeColor: activeCardColor,
                              decHeroTag: 'age_dec',
                              incHeroTag: 'age_inc',
                              onDecrement: () {
                                if (age > 1) setState(() => age--);
                              },
                              onIncrement: () => setState(() => age++),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      height: 55,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryPink,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          double heightInMeters = height / 100;
                          double bmi = weight / (heightInMeters * heightInMeters);

                          String resultText;
                          String interpretation;

                          if (bmi >= 25) {
                            resultText = 'Overweight';
                            interpretation =
                                'You have a higher than normal body weight. Try to exercise more.';
                          } else if (bmi >= 18.5) {
                            resultText = 'Normal';
                            interpretation =
                                'You have a Normal Body Weight, Good Job.';
                          } else {
                            resultText = 'Underweight';
                            interpretation =
                                'You have a lower than normal body weight. You can eat a bit more.';
                          }
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResultScreen(
                                bmiResult: bmi,
                                resultText: resultText,
                                interpretation: interpretation,
                              ),
                            ),
                          );
                        },
                        child: const Text(
                          'Calculate',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}