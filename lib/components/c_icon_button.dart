import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final Function()? onPressed;
  final double size;
  final double splashRadius;
  final double borderRadius;
  final Color? color;
  final EdgeInsets padding;
  const CustomIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.size = 14,
    this.splashRadius = 18,
    this.borderRadius = 50,
    this.padding = const EdgeInsets.all(0),
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = AdaptiveTheme.of(context).brightness == Brightness.dark;
    return Material(
      type: MaterialType.transparency,
      borderRadius: BorderRadius.circular(borderRadius),
      child: IconButton(
        splashRadius: splashRadius,
        padding: padding,
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: size,
          color: color ??
              (isDark
                  ? AdaptiveTheme.of(context).theme.colorScheme.onBackground
                  : AdaptiveTheme.of(context).theme.colorScheme.onSecondary),
        ),
      ),
    );
  }
}
