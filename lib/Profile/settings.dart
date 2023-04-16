// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';

// import '../constants.dart';
// import '../shared.dart';

// class Settings extends StatefulWidget {
//   const Settings({super.key});

//   @override
//   State<Settings> createState() => _SettingsState();
// }

// class _SettingsState extends State<Settings> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white,
//         leading: ArrowBackButton(
//           iconColor: primaryColor1,
//         ),
//         title: Text(
//           "Settings",
//           style: GoogleFonts.poppins(
//             fontSize: 16,
//             color: textColorBlack,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisSize: MainAxisSize.max,
//             children: [
//               SettingsButton(
//                 onTap: () {},
//                 icons: CupertinoIcons.trash_fill,
//                 title: 'Trash',
//               ),
//               SettingsButton(
//                 onTap: () {},
//                 icons: CupertinoIcons.bell_fill,
//                 title: 'Notification',
//               ),
//               SettingsButton(
//                 onTap: () {},
//                 icons: CupertinoIcons.globe,
//                 title: 'Language',
//               ),
//               SettingsButton(
//                 onTap: () {},
//                 icons: CupertinoIcons.lock_shield_fill,
//                 title: 'Privacy Policy',
//               ),
//               SettingsButton(
//                 onTap: () {},
//                 icons: Icons.share_rounded,
//                 title: 'Refer your Friend',
//                 share: true,
//               ),
//               SettingsButton(
//                 onTap: () {},
//                 icons: CupertinoIcons.question_circle_fill,
//                 title: 'Feedback & Help',
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
