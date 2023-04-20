import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:os_file/constants.dart';
import 'package:os_file/notifications.dart';

class Segments extends StatefulWidget {
  const Segments({super.key});

  @override
  State<Segments> createState() => _SegmentsState();
}

class _SegmentsState extends State<Segments> {
  String folderView = "card";
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    bool isDark = AdaptiveTheme.of(context).brightness == Brightness.dark;
    return SegmentedButton(
      showSelectedIcon: false,
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.selected)) {
                return isDark
                    ? AdaptiveTheme.of(context)
                        .theme
                        .colorScheme
                        .primary
                        .withOpacity(0.4)
                    : AdaptiveTheme.of(context)
                        .theme
                        .colorScheme
                        .primary
                        .withOpacity(0.7);
              } else {
                return isDark ? Colors.transparent : kLight;
              }
            },
          ),
          foregroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.selected)) {
                return isDark
                    ? null
                    : AdaptiveTheme.of(context).theme.colorScheme.onPrimary;
              } else {
                return isDark ? null : kBlack10;
              }
            },
          ),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          padding: const MaterialStatePropertyAll(
              EdgeInsets.symmetric(vertical: 12, horizontal: 12))),
      segments: [
        getButtonSegment(width, Icons.rectangle_outlined, "Card", "card"),
        getButtonSegment(width, Icons.list, "List", "list"),
        getButtonSegment(width, Icons.image_outlined, "Tile", "tile"),
      ],
      selected: <String>{folderView},
      onSelectionChanged: (Set<String> newSelection) {
        setState(() {
          folderView = newSelection.first;
        });
        SizeChanged(folderView).dispatch(context);
      },
    );
  }

  ButtonSegment<String> getButtonSegment(
      double width, IconData icon, String label, String value) {
    return ButtonSegment(
      value: value,
      // label: width > 1400
      //     ? Padding(
      //         padding: const EdgeInsets.all(4.0),
      //         child: Text(label),
      //       )
      //     : null,
      icon: Tooltip(
        message: label,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Icon(
            icon,
            size: 14,
          ),
        ),
      ),
    );
  }
}
