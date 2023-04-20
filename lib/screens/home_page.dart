import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:os_file/components/c_icon_button.dart';
import 'package:os_file/components/nav_tile.dart';
import 'package:os_file/constants.dart';
import 'package:os_file/screens/content_screen.dart';
import 'package:os_file/screens/file_window.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static List<bool> selectedIcons = <bool>[
    false,
    false,
    false,
    false,
    false,
    false
  ];

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  GlobalKey<ContentScreenState> globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    bool darkSwitch = AdaptiveTheme.of(context).brightness == Brightness.dark;
    bool isDark = AdaptiveTheme.of(context).brightness == Brightness.dark;
    final List<Widget> icons = <Widget>[
      NavigationTile(
        icon: Icons.folder,
        index: 0,
        label: "Explorer",
        window: const FileWindow(),
        onChange: update,
      ),
      NavigationTile(
        icon: Icons.download,
        index: 1,
        label: "Downloads",
        window: Container(
          width: 100,
          height: 100,
          //color: Colors.pink,
        ),
        onChange: update,
      ),
      NavigationTile(
        icon: Icons.mail,
        index: 2,
        label: "Mail",
        window: Container(
          width: 100,
          height: 100,
          //color: Colors.blue,
        ),
        onChange: update,
      ),
      NavigationTile(
        icon: Icons.language,
        index: 3,
        label: "Internet",
        window: Container(
          width: 100,
          height: 100,
          //color: Colors.green,
        ),
        onChange: update,
      ),
      NavigationTile(
        icon: Icons.delete,
        index: 4,
        label: "Trash",
        window: Container(
          width: 100,
          height: 100,
          //color: Colors.red,
        ),
        onChange: update,
      ),
      NavigationTile(
        icon: Icons.settings,
        index: 5,
        label: "Settings",
        window: Container(
          width: 100,
          height: 100,
          //color: Colors.yellow,
        ),
        onChange: update,
      ),
    ];
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/Background2.png'),
              fit: BoxFit.cover),
        ),
        child: Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 2),
                  color:
                      isDark ? kDark.withOpacity(0.8) : kLight.withOpacity(0.4),
                )
              ]),
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  Theme(
                    data: AdaptiveTheme.of(context)
                        .theme
                        .copyWith(useMaterial3: true),
                    child: Tooltip(
                      message: "Dark Mode",
                      child: Switch(
                          activeColor: AdaptiveTheme.of(context)
                              .theme
                              .colorScheme
                              .tertiaryContainer,
                          activeTrackColor: AdaptiveTheme.of(context)
                              .theme
                              .colorScheme
                              .tertiary,
                          value: darkSwitch,
                          onChanged: (t) {
                            if (AdaptiveTheme.of(context).mode !=
                                AdaptiveThemeMode.light) {
                              AdaptiveTheme.of(context).setLight();
                              ScaffoldMessenger.of(context).clearSnackBars();
                              Future.delayed(const Duration(milliseconds: 10),
                                  () {
                                reponseSnackbar("Light");
                              });
                            } else if (AdaptiveTheme.of(context).mode !=
                                AdaptiveThemeMode.dark) {
                              AdaptiveTheme.of(context).setDark();
                              ScaffoldMessenger.of(context).clearSnackBars();
                              Future.delayed(const Duration(milliseconds: 10),
                                  () {
                                reponseSnackbar("Dark");
                              });
                            }
                            setState(() {
                              darkSwitch = !darkSwitch;
                            });
                          }),
                    ),
                  ),
                  const Spacer(),
                  ...icons,
                  const Spacer(),
                  CustomIconButton(
                    icon: Icons.apps,
                    onPressed: () {},
                    size: 24,
                  ),
                  Tooltip(
                    message: "Log Out",
                    child: Container(
                      margin: const EdgeInsets.all(12),
                      child: FilledButton(
                        style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          padding: const MaterialStatePropertyAll(
                              EdgeInsets.all(16)),
                          backgroundColor: MaterialStatePropertyAll(
                              AdaptiveTheme.of(context)
                                  .theme
                                  .colorScheme
                                  .tertiaryContainer
                                  .withOpacity(0.8)),
                        ),
                        onPressed: () {
                          context.go('/');
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Icon(
                            Icons.exit_to_app,
                            color: AdaptiveTheme.of(context)
                                .theme
                                .colorScheme
                                .onTertiaryContainer,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
            ContentScreen(
              key: globalKey,
            ),
          ],
        ),
      ),
    );
  }

  dynamic update() {
    globalKey.currentState!.update();
  }

  void reponseSnackbar(String theme) {
    bool isDark = AdaptiveTheme.of(context).brightness == Brightness.dark;
    final scaffoldContext = ScaffoldMessenger.of(context);
    final snackBar = SnackBar(
      content: Text(
        "Theme switched to $theme",
        style: TextStyle(
            color: isDark
                ? AdaptiveTheme.of(context).theme.colorScheme.onBackground
                : AdaptiveTheme.of(context)
                    .theme
                    .colorScheme
                    .onPrimaryContainer),
      ),
      margin: EdgeInsets.fromLTRB(1200.w, 0, 20, 60),
      behavior: SnackBarBehavior.floating,
      backgroundColor: isDark
          ? AdaptiveTheme.of(context).theme.colorScheme.background
          : AdaptiveTheme.of(context).theme.colorScheme.primaryContainer,
    );
    scaffoldContext.showSnackBar(snackBar);
  }
}
