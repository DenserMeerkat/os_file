import 'package:flutter/material.dart';
import 'package:os_file/components/c_icon_button.dart';
import 'package:os_file/notifications.dart';
import 'package:os_file/provider/stack_brains.dart';
import 'package:os_file/screens/file_window.dart';

class WindowButtons extends StatefulWidget {
  const WindowButtons({
    super.key,
  });

  @override
  State<WindowButtons> createState() => _WindowButtonsState();
}

class _WindowButtonsState extends State<WindowButtons> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        children: [
          CustomIconButton(
            onPressed: () {},
            icon: Icons.horizontal_rule,
          ),
          CustomIconButton(
            onPressed: () {},
            icon: Icons.check_box_outline_blank,
          ),
          CustomIconButton(
            onPressed: () {},
            icon: Icons.close,
            size: 18,
          ),
        ],
      ),
    );
  }
}
