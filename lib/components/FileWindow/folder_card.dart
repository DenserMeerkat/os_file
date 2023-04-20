import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:os_file/constants.dart';

class FolderCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color? backgroundColor;
  const FolderCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = AdaptiveTheme.of(context).brightness == Brightness.dark;
    return Container(
      width: 150,
      height: 60,
      decoration: BoxDecoration(
          color:
              isDark ? kDark.withOpacity(0.9) : Colors.white.withOpacity(0.3),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              color: isDark ? Colors.transparent : kDark.withOpacity(0.3))),
      child: Row(
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
              color: isDark
                  ? null
                  : AdaptiveTheme.of(context).theme.colorScheme.onTertiary,
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: AdaptiveTheme.of(context)
                    .theme
                    .textTheme
                    .bodySmall!
                    .copyWith(
                      color: isDark ? null : kBlack10,
                      fontWeight: isDark ? null : FontWeight.w600,
                      fontSize: 13,
                    ),
              ),
              Text(
                subtitle,
                style: AdaptiveTheme.of(context)
                    .theme
                    .textTheme
                    .bodySmall!
                    .copyWith(
                      color: isDark ? null : kBlack10,
                      fontWeight: isDark ? null : FontWeight.w500,
                      fontSize: 11,
                    ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
