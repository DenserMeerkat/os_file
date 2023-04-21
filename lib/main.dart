import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:os_file/screens/home_page.dart';
import 'package:os_file/screens/lock_screen.dart';
import 'package:os_file/themes.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:go_router/go_router.dart';

void main() async {
  setPathUrlStrategy();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(MyApp(
    savedThemeMode: savedThemeMode,
  ));
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const Material(
          child: LockScreen(),
        );
      },
    ),
    GoRoute(
      path: '/main',
      builder: (BuildContext context, GoRouterState state) {
        return const Material(
          child: HomePage(),
        );
      },
    ),
  ],
);

class MyApp extends StatefulWidget {
  final AdaptiveThemeMode? savedThemeMode;
  const MyApp({super.key, this.savedThemeMode});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        useInheritedMediaQuery: true,
        designSize: const Size(1536, 745.6),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: AdaptiveTheme(
              light: ThemeProvider.lightTheme,
              dark: ThemeProvider.darkTheme,
              initial: widget.savedThemeMode ?? AdaptiveThemeMode.dark,
              builder: (theme, darktheme) => MaterialApp.router(
                debugShowCheckedModeBanner: false,
                scrollBehavior: const MaterialScrollBehavior().copyWith(
                  dragDevices: {
                    PointerDeviceKind.mouse,
                    PointerDeviceKind.touch,
                    PointerDeviceKind.stylus,
                    PointerDeviceKind.unknown
                  },
                ),
                title: 'K! | Web Design',
                theme: FlexThemeData.light(scheme: FlexScheme.deepPurple),
                darkTheme: FlexThemeData.dark(scheme: FlexScheme.deepPurple),
                themeMode: ThemeMode.dark,
                routeInformationProvider: _router.routeInformationProvider,
                routeInformationParser: _router.routeInformationParser,
                routerDelegate: _router.routerDelegate,
              ),
            ),
          );
        });
  }
}
