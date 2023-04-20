import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:os_file/components/c_icon_button.dart';
import 'package:os_file/constants.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = AdaptiveTheme.of(context).brightness == Brightness.dark;
    return Row(
      children: [
        CustomIconButton(
          icon: Icons.cut,
          onPressed: () {},
          size: 18,
          color: isDark
              ? AdaptiveTheme.of(context)
                  .theme
                  .colorScheme
                  .onBackground
                  .withOpacity(0.7)
              : kLBlack10,
        ),
        const SizedBox(width: 8),
        CustomIconButton(
          icon: Icons.copy,
          onPressed: () {},
          size: 18,
          color: isDark
              ? AdaptiveTheme.of(context)
                  .theme
                  .colorScheme
                  .onBackground
                  .withOpacity(0.7)
              : kLBlack10,
        ),
        const SizedBox(width: 8),
        CustomIconButton(
          icon: Icons.paste,
          onPressed: () {},
          size: 18,
          color: isDark
              ? AdaptiveTheme.of(context)
                  .theme
                  .colorScheme
                  .onBackground
                  .withOpacity(0.7)
              : kLBlack10,
        ),
        const SizedBox(width: 8),
        CustomIconButton(
          icon: Icons.sort_by_alpha,
          onPressed: () {},
          size: 20,
          color: isDark
              ? AdaptiveTheme.of(context)
                  .theme
                  .colorScheme
                  .onBackground
                  .withOpacity(0.7)
              : kLBlack10,
        ),
        CustomIconButton(
          icon: Icons.delete_outline_rounded,
          onPressed: () {},
          size: 20,
          color: isDark
              ? AdaptiveTheme.of(context)
                  .theme
                  .colorScheme
                  .onBackground
                  .withOpacity(0.7)
              : kLBlack10,
        ),
      ],
    );
  }
}
