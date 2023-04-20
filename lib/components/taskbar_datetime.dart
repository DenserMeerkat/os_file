import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';
import 'package:intl/intl.dart';

class TaskBarDateTime extends StatelessWidget {
  const TaskBarDateTime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = AdaptiveTheme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DigitalClock(
          colon: Text(
            ":",
            style: AdaptiveTheme.of(context)
                .theme
                .textTheme
                .bodySmall!
                .copyWith(
                  color: isDark
                      ? AdaptiveTheme.of(context).theme.colorScheme.onBackground
                      : AdaptiveTheme.of(context).theme.colorScheme.onPrimary,
                  fontSize: 10,
                  fontWeight: isDark ? FontWeight.normal : FontWeight.w600,
                ),
          ),
          hourMinuteDigitTextStyle: AdaptiveTheme.of(context)
              .theme
              .textTheme
              .bodySmall!
              .copyWith(
                color: isDark
                    ? AdaptiveTheme.of(context).theme.colorScheme.onBackground
                    : AdaptiveTheme.of(context).theme.colorScheme.onPrimary,
                fontSize: 10,
                fontWeight: isDark ? FontWeight.normal : FontWeight.w600,
              ),
          secondDigitTextStyle: AdaptiveTheme.of(context)
              .theme
              .textTheme
              .bodySmall!
              .copyWith(
                color: isDark
                    ? AdaptiveTheme.of(context).theme.colorScheme.onBackground
                    : AdaptiveTheme.of(context).theme.colorScheme.onPrimary,
                fontSize: 10,
                fontWeight: isDark ? FontWeight.normal : FontWeight.w600,
              ),
          showSecondsDigit: false,
        ),
        Transform.translate(
          offset: const Offset(0, -6),
          child: Text(
            DateFormat.yMMMMd().format(DateTime.now()),
            style: AdaptiveTheme.of(context)
                .theme
                .textTheme
                .bodySmall!
                .copyWith(
                  color: isDark
                      ? AdaptiveTheme.of(context).theme.colorScheme.onBackground
                      : AdaptiveTheme.of(context).theme.colorScheme.onPrimary,
                  fontSize: 10,
                  fontWeight: isDark ? FontWeight.normal : FontWeight.w600,
                ),
          ),
        )
      ],
    );
  }
}
