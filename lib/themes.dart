// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:

class ThemeProvider with ChangeNotifier {
  static String currentTheme = 'system';

  static String getThemeMode() => currentTheme;

  ThemeMode get themeMode {
    if (currentTheme == 'light') {
      return ThemeMode.light;
    } else if (currentTheme == 'dark') {
      return ThemeMode.dark;
    } else {
      return ThemeMode.system;
    }
  }

  void changeTheme(String theme) {
    currentTheme = theme;
    notifyListeners();
  }

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    colorSchemeSeed: Colors.deepPurple,
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    colorSchemeSeed: Colors.deepPurple,
  );
}
