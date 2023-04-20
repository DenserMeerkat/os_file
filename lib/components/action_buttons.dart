import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:os_file/components/c_icon_button.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomIconButton(
            icon: Icons.cut,
            onPressed: () {},
            size: 18,
            color: AdaptiveTheme.of(context)
                .theme
                .colorScheme
                .onBackground
                .withOpacity(0.7),
          ),
          const SizedBox(width: 8),
          CustomIconButton(
            icon: Icons.copy,
            onPressed: () {},
            size: 18,
            color: AdaptiveTheme.of(context)
                .theme
                .colorScheme
                .onBackground
                .withOpacity(0.7),
          ),
          const SizedBox(width: 8),
          CustomIconButton(
            icon: Icons.paste,
            onPressed: () {},
            size: 18,
            color: AdaptiveTheme.of(context)
                .theme
                .colorScheme
                .onBackground
                .withOpacity(0.7),
          ),
          const SizedBox(width: 8),
          CustomIconButton(
            icon: Icons.sort_by_alpha,
            onPressed: () {},
            size: 20,
            color: AdaptiveTheme.of(context)
                .theme
                .colorScheme
                .onBackground
                .withOpacity(0.7),
          ),
          CustomIconButton(
            icon: Icons.delete_outline_rounded,
            onPressed: () {},
            size: 20,
            color: AdaptiveTheme.of(context)
                .theme
                .colorScheme
                .onBackground
                .withOpacity(0.7),
          ),
        ],
      ),
    );
  }
}
