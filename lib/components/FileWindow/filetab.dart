import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:os_file/components/c_icon_button.dart';

class FileTab extends StatelessWidget {
  const FileTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;

    bool isDark = AdaptiveTheme.of(context).brightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      width: width > 800 ? 200 : 150,
      height: 24,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: isDark
            ? AdaptiveTheme.of(context)
                .theme
                .colorScheme
                .primary
                .withOpacity(0.2)
            : AdaptiveTheme.of(context)
                .theme
                .colorScheme
                .onPrimaryContainer
                .withOpacity(0.2),
      ),
      child: Row(
        children: [
          const SizedBox(width: 8),
          const Icon(
            Icons.home,
            size: 16,
          ),
          const SizedBox(width: 16),
          const Text(
            "Home",
            style: TextStyle(fontSize: 12),
          ),
          const Spacer(),
          Transform.translate(
            offset: const Offset(8, 0),
            child: CustomIconButton(
              icon: Icons.close,
              onPressed: () {},
              splashRadius: 10,
              size: 16,
            ),
          ),
        ],
      ),
    );
  }
}
