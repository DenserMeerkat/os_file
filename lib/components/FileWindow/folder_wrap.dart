import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:os_file/components/FileWindow/folder_card.dart';
import 'package:os_file/components/FileWindow/folder_list.dart';
import 'package:os_file/components/FileWindow/folder_tile.dart';
import 'package:os_file/provider/folder_data.dart';

class FolderWrap extends StatelessWidget {
  final String size;
  const FolderWrap({
    super.key,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    final List<FolderData> list = FolderBrains.getFiles();
    if (size == 'card') {
      List<FolderCard> folders = [];
      for (int i = 0; i < FolderBrains.getFilesLength(); i++) {
        folders.add(
          FolderCard(
            icon: list[i].icon,
            title: list[i].title,
            subtitle: list[i].subtitle,
          ),
        );
      }
      return Container(
        margin: const EdgeInsets.only(top: 80, left: 20),
        child: Wrap(
          runSpacing: 24,
          spacing: 30,
          children: folders,
        ),
      );
    } else if (size == 'list') {
      List<FolderList> folders = [];
      for (int i = 0; i < FolderBrains.getFilesLength(); i++) {
        folders.add(
          FolderList(
            icon: list[i].icon,
            title: list[i].title,
            subtitle: list[i].subtitle,
            date: list[i].date,
            size: list[i].size,
          ),
        );
      }
      return Container(
        margin: const EdgeInsets.only(top: 80, left: 20, right: 20),
        child: Wrap(
          runSpacing: 4,
          spacing: 30,
          children: [
            const FolderListHeader(),
            ...folders,
          ],
        ),
      );
    } else {
      List<FolderTile> folders = [];
      for (int i = 0; i < FolderBrains.getFilesLength(); i++) {
        folders.add(
          FolderTile(
            icon: list[i].icon,
            title: list[i].title,
            subtitle: list[i].subtitle,
          ),
        );
      }
      return Container(
        margin: const EdgeInsets.only(top: 80, left: 30, right: 30),
        child: Wrap(
          runSpacing: 30,
          spacing: 30,
          children: folders,
        ),
      );
    }
  }
}
