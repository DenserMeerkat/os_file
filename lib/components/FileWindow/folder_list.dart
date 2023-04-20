import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:os_file/constants.dart';

class FolderList extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String date;
  final String size;
  final Color? backgroundColor;
  const FolderList({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.date,
    required this.size,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = AdaptiveTheme.of(context).brightness == Brightness.dark;
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    return Container(
      height: 30,
      decoration: BoxDecoration(
        color: isDark ? kDark.withOpacity(0.9) : Colors.white.withOpacity(0.2),
      ),
      child: Row(
        children: [
          const SizedBox(width: 12),
          Icon(
            icon,
            size: 16,
            color: isDark
                ? null
                : AdaptiveTheme.of(context)
                    .theme
                    .colorScheme
                    .onTertiaryContainer,
          ),
          const SizedBox(width: 16),
          SizedBox(
            width: width > 1300 ? 200 : 150,
            child: Text(
              title,
              style:
                  AdaptiveTheme.of(context).theme.textTheme.bodySmall!.copyWith(
                        color: isDark ? null : kBlack10,
                        fontWeight: isDark ? null : FontWeight.w600,
                        fontSize: 13,
                      ),
            ),
          ),
          width > 1300
              ? SizedBox(
                  width: 100,
                  child: Text(
                    subtitle,
                    style: AdaptiveTheme.of(context)
                        .theme
                        .textTheme
                        .bodySmall!
                        .copyWith(
                          color: isDark ? null : kBlack10,
                          fontWeight: isDark ? null : FontWeight.w500,
                          fontSize: 12,
                        ),
                  ),
                )
              : Container(),
          SizedBox(
            width: 100,
            child: Text(
              date,
              style:
                  AdaptiveTheme.of(context).theme.textTheme.bodySmall!.copyWith(
                        color: isDark ? null : kBlack10,
                        fontWeight: isDark ? null : FontWeight.w500,
                        fontSize: 12,
                      ),
            ),
          ),
          Text(
            size,
            style:
                AdaptiveTheme.of(context).theme.textTheme.bodySmall!.copyWith(
                      color: isDark ? null : kBlack10,
                      fontWeight: isDark ? null : FontWeight.w500,
                      fontSize: 10,
                    ),
          ),
        ],
      ),
    );
  }
}

class FolderListHeader extends StatelessWidget {
  const FolderListHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = AdaptiveTheme.of(context).brightness == Brightness.dark;
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    return Row(
      children: [
        const SizedBox(width: 44),
        SizedBox(
          width: width > 1300 ? 200 : 150,
          child: Text(
            "Name",
            style:
                AdaptiveTheme.of(context).theme.textTheme.bodySmall!.copyWith(
                      color: isDark ? null : kBlack10,
                      fontWeight: isDark ? null : FontWeight.w500,
                      fontSize: 12,
                    ),
          ),
        ),
        width > 1300
            ? SizedBox(
                width: 100,
                child: Text(
                  "Location",
                  style: AdaptiveTheme.of(context)
                      .theme
                      .textTheme
                      .bodySmall!
                      .copyWith(
                        color: isDark ? null : kBlack10,
                        fontWeight: isDark ? null : FontWeight.w500,
                        fontSize: 12,
                      ),
                ),
              )
            : Container(),
        SizedBox(
          width: 100,
          child: Text(
            "Date Modified",
            style:
                AdaptiveTheme.of(context).theme.textTheme.bodySmall!.copyWith(
                      color: isDark ? null : kBlack10,
                      fontWeight: isDark ? null : FontWeight.w500,
                      fontSize: 12,
                    ),
          ),
        ),
        Text(
          "Size",
          style: AdaptiveTheme.of(context).theme.textTheme.bodySmall!.copyWith(
                color: isDark ? null : kBlack10,
                fontWeight: isDark ? null : FontWeight.w500,
                fontSize: 12,
              ),
        ),
      ],
    );
  }
}
