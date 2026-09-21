
import 'package:flutter/material.dart';

class GenderCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;
  final Color activeColor;
  final Color inactiveColor;
  final VoidCallback onTap;

  const GenderCard({
    super.key,
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.activeColor,
    required this.inactiveColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? activeColor : inactiveColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 70, color: Colors.white),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(fontSize: 18, color: Color(0xFF8D8E98)),
            ),
          ],
        ),
      ),
    );
  }
}