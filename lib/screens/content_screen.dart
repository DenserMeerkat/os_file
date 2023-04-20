import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:os_file/components/taskbar_datetime.dart';
import 'package:os_file/constants.dart';
import 'package:os_file/notifications.dart';
import 'package:os_file/provider/stack_brains.dart';
import 'package:os_file/screens/file_window.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';

class ContentScreen extends StatefulWidget {
  const ContentScreen({required Key key}) : super(key: key);

  @override
  State<ContentScreen> createState() => ContentScreenState();
}

class ContentScreenState extends State<ContentScreen> {
  List<Widget> gengallList() {
    List<Widget> list = StackBrains.retrieveList();
    return list;
  }

  List windows = [];
  @override
  void initState() {
    windows += gengallList();
    super.initState();
  }

  void update() {
    setState(() {
      windows = gengallList();
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = AdaptiveTheme.of(context).brightness == Brightness.dark;
    return Expanded(
        child: Column(
      children: [
        Expanded(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AdaptiveTheme.of(context)
                      .theme
                      .colorScheme
                      .background
                      .withOpacity(0.1),
                ),
                // child: Transform.scale(
                //   scale: 3,
                //   child: DigitalClock(
                //     is24HourTimeFormat: true,
                //   ),
                // ),
              ),
              ...windows,
            ],
          ),
        ),
        Container(
          height: 45,
          width: double.infinity,
          color: isDark ? kDark.withOpacity(0.7) : kLight.withOpacity(0.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Icon(
                Icons.wifi,
                size: 16,
              ),
              SizedBox(width: 12),
              Icon(
                Icons.volume_up_outlined,
                size: 16,
              ),
              SizedBox(width: 12),
              Icon(
                Icons.battery_5_bar_rounded,
                size: 16,
              ),
              SizedBox(width: 20),
              TaskBarDateTime(),
              SizedBox(width: 30),
            ],
          ),
        ),
      ],
    ));
  }
}
