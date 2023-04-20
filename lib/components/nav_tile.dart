import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:os_file/components/c_icon_button.dart';
import 'package:os_file/provider/stack_brains.dart';
import 'package:os_file/screens/home_page.dart';

class NavigationTile extends StatefulWidget {
  final int index;
  final IconData icon;
  final String label;
  final Function()? onChange;
  final Widget? window;
  const NavigationTile({
    super.key,
    required this.index,
    required this.icon,
    required this.label,
    this.onChange,
    this.window,
  });

  @override
  State<NavigationTile> createState() => _NavigationTileState();
}

class _NavigationTileState extends State<NavigationTile> {
  @override
  Widget build(BuildContext context) {
    bool isDark = AdaptiveTheme.of(context).brightness == Brightness.dark;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          width: 55,
          height: 35,
          decoration: BoxDecoration(
            color: HomePage.selectedIcons[widget.index]
                ? isDark
                    ? AdaptiveTheme.of(context)
                        .theme
                        .colorScheme
                        .secondaryContainer
                    : AdaptiveTheme.of(context)
                        .theme
                        .colorScheme
                        .onSecondaryContainer
                : null,
            borderRadius: BorderRadius.circular(50),
          ),
          child: CustomIconButton(
            icon: widget.icon,
            // color: HomePage.selectedIcons[widget.index]
            //     ? AdaptiveTheme.of(context).theme.colorScheme.onPrimary
            //     : null,
            onPressed: () {
              if (HomePage.selectedIcons[widget.index]) {
                StackBrains.removeWindow(widget.window!);
              } else {
                StackBrains.appendWindow(widget.window!);
              }
              setState(() {
                HomePage.selectedIcons[widget.index] =
                    !HomePage.selectedIcons[widget.index];
              });
              widget.onChange!();
            },
            size: 22,
            splashRadius: 30,
          ),
        ),
        Offstage(
          offstage: !HomePage.selectedIcons[widget.index],
          child: Text(
            widget.label,
            style:
                AdaptiveTheme.of(context).theme.textTheme.bodySmall!.copyWith(
                      fontSize: 12,
                      color: isDark ? null : Colors.black,
                      fontWeight: isDark ? FontWeight.w500 : FontWeight.w700,
                    ),
          ),
        ),
        Offstage(
          offstage: !HomePage.selectedIcons[widget.index],
          child: const SizedBox(height: 8),
        ),
      ],
    );
  }
}
