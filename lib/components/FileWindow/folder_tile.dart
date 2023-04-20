import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:os_file/constants.dart';

class FolderTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color? backgroundColor;
  const FolderTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = AdaptiveTheme.of(context).brightness == Brightness.dark;
    return SizedBox(
      width: 70,
      child: Column(
        children: [
          const SizedBox(width: 12),
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: backgroundColor ??
                  (isDark
                      ? AdaptiveTheme.of(context)
                          .theme
                          .colorScheme
                          .tertiaryContainer
                      : AdaptiveTheme.of(context).theme.colorScheme.tertiary),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Icon(
              icon,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Text(
            title,
            style:
                AdaptiveTheme.of(context).theme.textTheme.bodySmall!.copyWith(
                      color: isDark ? null : kBlack10,
                      fontWeight: isDark ? null : FontWeight.w600,
                      fontSize: 13,
                    ),
          ),
          Text(
            subtitle,
            style:
                AdaptiveTheme.of(context).theme.textTheme.bodySmall!.copyWith(
                      color: isDark ? null : kBlack10,
                      fontWeight: isDark ? null : FontWeight.w500,
                      fontSize: 11,
                    ),
          )
        ],
      ),
    );
  }
}
