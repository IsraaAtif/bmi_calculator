
import 'package:flutter/material.dart';

class CounterCard extends StatelessWidget {
  final String title;
  final int value;
  final Color activeColor;
  final String decHeroTag;
  final String incHeroTag;
  final VoidCallback onDecrement;
  final VoidCallback onIncrement;

  const CounterCard({
    super.key,
    required this.title,
    required this.value,
    required this.activeColor,
    required this.decHeroTag,
    required this.incHeroTag,
    required this.onDecrement,
    required this.onIncrement,
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
          Text(
            title,
            style: const TextStyle(fontSize: 18, color: Color(0xFF8D8E98)),
          ),
          Text(
            '$value',
            style: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton.small(
                heroTag: decHeroTag,
                backgroundColor: const Color(0xFF4C4F5E),
                onPressed: onDecrement,
                child: const Icon(Icons.remove, color: Colors.white),
              ),
              const SizedBox(width: 10),
              FloatingActionButton.small(
                heroTag: incHeroTag,
                backgroundColor: const Color(0xFF4C4F5E),
                onPressed: onIncrement,
                child: const Icon(Icons.add, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}