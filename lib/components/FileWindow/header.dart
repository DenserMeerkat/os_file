import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:os_file/components/FileWindow/action_buttons.dart';
import 'package:os_file/components/FileWindow/filetab.dart';
import 'package:os_file/components/FileWindow/segments.dart';
import 'package:os_file/components/FileWindow/window_buttons.dart';
import 'package:os_file/components/c_icon_button.dart';
import 'package:os_file/constants.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    bool isDark = AdaptiveTheme.of(context).brightness == Brightness.dark;
    return Container(
      height: 140.h,
      width: width > 1020 ? 900.w : 1300.w,
      color: isDark ? kDark.withOpacity(0.9) : kLight.withOpacity(0.6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FileTab(),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16),
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: AdaptiveTheme.of(context)
                      .theme
                      .colorScheme
                      .primary
                      .withOpacity(0.1),
                ),
                child: CustomIconButton(
                  icon: Icons.add,
                  onPressed: () {},
                  splashRadius: 16,
                ),
              ),
              const Spacer(),
              const WindowButtons(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Row(
              children: [
                FilledButton.icon(
                  onPressed: () {},
                  style: ButtonStyle(
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    backgroundColor: MaterialStatePropertyAll(
                      isDark
                          ? AdaptiveTheme.of(context)
                              .theme
                              .colorScheme
                              .primary
                              .withOpacity(0.8)
                          : AdaptiveTheme.of(context)
                              .theme
                              .colorScheme
                              .primary
                              .withOpacity(0.6),
                    ),
                    foregroundColor: MaterialStatePropertyAll(
                      isDark
                          ? null
                          : AdaptiveTheme.of(context)
                              .theme
                              .colorScheme
                              .onPrimary,
                    ),
                  ),
                  icon: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Icon(Icons.add_box_rounded),
                  ),
                  label: const Text("New"),
                ),
                width > 1150 ? const CustomDivider() : Container(),
                width > 1150 ? const ActionButtons() : Container(),
                const CustomDivider(),
                const Segments(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 32),
      height: 40,
      width: 1,
      color: AdaptiveTheme.of(context)
          .theme
          .colorScheme
          .onBackground
          .withOpacity(0.2),
    );
  }
}
