import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'dart:math' as math;

class CustomListTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool showTrailing;
  final double size;
  const CustomListTile({
    super.key,
    required this.icon,
    required this.label,
    this.showTrailing = false,
    this.size = 18,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      borderRadius: BorderRadius.circular(50),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const SizedBox(width: 8),
              Icon(
                icon,
                size: size,
              ),
              const SizedBox(width: 16),
              Text(label),
              const Spacer(),
              showTrailing
                  ? Transform.rotate(
                      angle: math.pi / 5.0,
                      child: const Icon(
                        Icons.push_pin,
                        size: 12,
                      ),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}
