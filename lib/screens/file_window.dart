import 'dart:ui';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:os_file/components/FileWindow/folder_wrap.dart';
import 'package:os_file/components/FileWindow/header.dart';
import 'package:os_file/components/FileWindow/search_bar.dart';
import 'package:os_file/components/FileWindow/sidebar.dart';
import 'package:os_file/constants.dart';
import 'package:os_file/notifications.dart';

class FileWindow extends StatefulWidget {
  const FileWindow({
    super.key,
  });

  @override
  State<FileWindow> createState() => _FileWindowState();
}

class _FileWindowState extends State<FileWindow> {
  String size = 'card';
  @override
  Widget build(BuildContext context) {
    bool isDark = AdaptiveTheme.of(context).brightness == Brightness.dark;
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    return Positioned(
      top: width > 1020 ? 100.h : 30.h,
      left: width > 1020 ? 260.w : 30.w,
      child: Container(
        clipBehavior: Clip.hardEdge,
        height: width > 1020 ? 550.h : 750.h,
        width: width > 1020 ? 900.w : 1300.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            NotificationListener<SizeChanged>(
              onNotification: (n) {
                setState(() {
                  size = n.size;
                  debugPrint(size);
                });
                return true;
              },
              child: const Header(),
            ),
            Row(
              children: [
                width > 720
                    ? const Expanded(
                        flex: 2,
                        child: SideBar(),
                      )
                    : Container(),
                Expanded(
                  flex: 6,
                  child: SizedBox(
                    height: width > 1000 ? 410.h : 500.h,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        ClipRRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                            child: Container(
                              color: isDark
                                  ? kBlack10.withOpacity(0.7)
                                  : kLBlack10.withOpacity(0.7),
                            ),
                          ),
                        ),
                        const SearchBar(),
                        FolderWrap(size: size),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
