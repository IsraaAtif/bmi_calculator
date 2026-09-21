
import 'package:flutter/material.dart';

class HeightCard extends StatelessWidget {
  final double height;
  final Color activeColor;
  final Color accentColor;
  final ValueChanged<double> onChanged;

  const HeightCard({
    super.key,
    required this.height,
    required this.activeColor,
    required this.accentColor,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: activeColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Height',
            style: TextStyle(fontSize: 18, color: Color(0xFF8D8E98)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                '${height.round()}',
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
              const Text(
                'cm',
                style: TextStyle(fontSize: 16, color: Color(0xFF8D8E98)),
              ),
            ],
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: accentColor,
              inactiveTrackColor: Colors.white24,
              thumbColor: accentColor,
              overlayColor: accentColor.withOpacity(0.2),
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10.0),
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 20.0),
            ),
            child: Slider(
              value: height,
              min: 100,
              max: 220,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}