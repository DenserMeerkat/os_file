// import 'package:adaptive_theme/adaptive_theme.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:os_file/screens/home_page.dart';

// class NavRail extends StatelessWidget {
//   const NavRail({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(boxShadow: [
//         BoxShadow(
//           offset: Offset(0, 2),
//           color: Color.fromRGBO(28, 27, 31, 0.8),
//         )
//       ]),
//       child: Column(
//         children: [
//           SizedBox(height: 20.h),
//           const Spacer(),
//           ...HomePage.icons,
//           const Spacer(),
//           IconButton(
//             splashRadius: 24,
//             onPressed: () {},
//             icon: const Icon(Icons.apps),
//           ),
//           Container(
//             margin: const EdgeInsets.all(12),
//             padding: const EdgeInsets.all(4),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color: AdaptiveTheme.of(context).theme.colorScheme.onSecondary,
//             ),
//             child: IconButton(
//               splashRadius: 20,
//               onPressed: () {},
//               icon: const Icon(Icons.exit_to_app),
//             ),
//           ),
//           SizedBox(height: 20.h),
//         ],
//       ),
//     );
//   }
// }
