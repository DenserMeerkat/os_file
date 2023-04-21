import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:os_file/components/c_icon_button.dart';
import 'package:os_file/constants.dart';
import 'package:os_file/screens/content_screen.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';

class LockScreen extends StatefulWidget {
  const LockScreen({super.key});
  static List<bool> selectedIcons = <bool>[
    false,
    false,
    false,
    false,
    false,
    false
  ];

  @override
  State<LockScreen> createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> {
  @override
  void initState() {
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/Background2.png'),
              fit: BoxFit.cover),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          top: 157.h,
                          child: Transform.translate(
                            offset: const Offset(18, 0),
                            child: Transform.scale(
                              scale: 4,
                              child: Container(
                                width: 85,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: kBlack10.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                    color: kBlack10.withOpacity(0.2),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 150.h,
                          child: Transform.translate(
                            offset: const Offset(30, 0),
                            child: Transform.scale(
                              scale: 4,
                              child: DigitalClock(
                                is24HourTimeFormat: true,
                                //showSecondsDigit: false,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                            bottom: 24.h,
                            right: 24.h,
                            child: CustomIconButton(
                              icon: Icons.settings_outlined,
                              size: 28,
                              onPressed: () {},
                            )),
                        Positioned(
                            top: 320.h,
                            child: Column(
                              children: [
                                Container(
                                  height: 130,
                                  width: 130,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          offset: const Offset(1, 1),
                                          color: kDark.withOpacity(1),
                                          blurRadius: 10)
                                    ],
                                    borderRadius: BorderRadius.circular(75),
                                    image: const DecorationImage(
                                      image: AssetImage(
                                          'assets/images/Grant_crop.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 60),
                                Form(
                                  key: _formKey,
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 200,
                                        child: TextFormField(
                                          onChanged: (newValue) {
                                            if (newValue.toLowerCase().trim() ==
                                                "kurukshetra") {
                                              Future.delayed(
                                                  const Duration(
                                                      milliseconds: 300), () {
                                                context.go('/main');
                                              });
                                            }
                                          },
                                          onSaved: (newValue) {
                                            if (newValue == "Kurukshetra") {
                                              context.go('/main');
                                            }
                                          },
                                          obscureText: obscureText,
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                          decoration: InputDecoration(
                                            suffixIcon: CustomIconButton(
                                              onPressed: () {
                                                setState(() {
                                                  obscureText = !obscureText;
                                                });
                                              },
                                              icon: obscureText
                                                  ? Icons.visibility
                                                  : Icons.visibility_off,
                                            ),
                                            alignLabelWithHint: true,
                                            hintText: "Kurukshetra",
                                            isCollapsed: true,
                                            isDense: true,
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 12,
                                                    horizontal: 16),
                                            border: outlineBorder(kLight),
                                            enabledBorder: outlineBorder(kDark),
                                            focusedBorder:
                                                outlineBorder(kLight),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  OutlineInputBorder outlineBorder(Color color, {double width = 1}) {
    return OutlineInputBorder(
        borderSide: BorderSide(color: color, width: width),
        borderRadius: BorderRadius.circular(4));
  }
}
