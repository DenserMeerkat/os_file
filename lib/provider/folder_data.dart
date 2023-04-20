import 'package:flutter/material.dart';

class FolderData {
  final String title;
  final String subtitle;
  final IconData icon;
  final String size;
  final String date;
  const FolderData({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.size,
    required this.date,
  });
}

class FolderBrains {
  static List<FolderData> folderList = const [
    FolderData(
      title: "Desktop",
      subtitle: "User",
      icon: Icons.laptop_chromebook,
      size: "24MB",
      date: "12-03-2023",
    ),
    FolderData(
      title: "Documents",
      subtitle: "Disk E",
      icon: Icons.file_open,
      size: "172MB",
      date: "14-02-2023",
    ),
    FolderData(
      title: "Pictures",
      subtitle: "Disk C",
      icon: Icons.photo,
      size: "281MB",
      date: "07-03-2023",
    ),
    FolderData(
      title: "Downloads",
      subtitle: "Disk D",
      icon: Icons.download,
      size: "2.3GB",
      date: "22-03-2023",
    ),
    FolderData(
      title: "Videos",
      subtitle: "Disk D",
      icon: Icons.video_camera_back,
      size: "5.8GB",
      date: "04-03-2023",
    ),
    FolderData(
      title: "Music",
      subtitle: "Disk C",
      icon: Icons.music_note,
      size: "1.2GB",
      date: "29-03-2023",
    ),
    FolderData(
      title: "Code",
      subtitle: "Disk C",
      icon: Icons.folder,
      size: "98MB",
      date: "20-04-2023",
    ),
    FolderData(
      title: "Files",
      subtitle: "Disk E",
      icon: Icons.folder,
      size: "343MB",
      date: "20-03-2023",
    ),
  ];

  static List<FolderData> getFiles() {
    return folderList;
  }

  static int getFilesLength() {
    return folderList.length;
  }
}
