import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:os_file/components/c_list_tile.dart';
import 'package:os_file/constants.dart';

class SideBar extends StatelessWidget {
  const SideBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    bool isDark = AdaptiveTheme.of(context).brightness == Brightness.dark;
    return Container(
      height: width > 1000 ? 410.h : 500.h,
      color: isDark ? kDark.withOpacity(0.7) : kLight.withOpacity(0.6),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          shrinkWrap: true,
          children: const [
            CustomListTile(
              icon: Icons.home,
              label: "Home",
              showTrailing: true,
            ),
            CustomListTile(
              icon: Icons.drive_file_move,
              label: "Drive",
              showTrailing: true,
            ),
            CustomListTile(
              icon: Icons.desktop_mac_outlined,
              label: "Desktop",
              showTrailing: true,
              size: 16,
            ),
            Divider(),
            CustomListTile(
              icon: Icons.computer_outlined,
              label: "This PC",
            ),
            CustomListTile(
              icon: Icons.file_copy,
              label: "Documents",
            ),
            CustomListTile(
              icon: Icons.image,
              label: "Pictures",
            ),
            CustomListTile(
              icon: Icons.music_video,
              label: "Videos",
            ),
            Divider(),
            CustomListTile(
              icon: Icons.language,
              label: "Network",
            ),
            CustomListTile(
              icon: Icons.manage_accounts,
              label: "Users",
            ),
          ],
        ),
      ),
    );
  }
}
