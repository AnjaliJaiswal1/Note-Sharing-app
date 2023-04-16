// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:note_sharing_app/constants.dart';
// import 'package:note_sharing_app/shared.dart';

// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({super.key});

//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {
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
//           "Profile",
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
//               Stack(
//                 alignment: Alignment.bottomRight,
//                 children: [
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(12),
//                     child: Image.asset(
//                       'assets/images/anjali.png',
//                       height: Get.height * 0.125,
//                       width: Get.height * 0.125,
//                       fit: BoxFit.cover,
//                       filterQuality: FilterQuality.high,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(4),
//                     child: Container(
//                       height: 24,
//                       width: 24,
//                       decoration: BoxDecoration(
//                         color: primaryColor1,
//                         borderRadius: BorderRadius.circular(4),
//                       ),
//                       child: const Icon(
//                         Icons.edit,
//                         color: Colors.white,
//                         size: 16,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 16,
//                 width: Get.width,
//               ),
//               Text(
//                 "Anjali Jaiswal",
//                 style: GoogleFonts.poppins(
//                   fontSize: 16,
//                   color: textColorBlack,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               Text(
//                 "Computer Science",
//                 style: GoogleFonts.poppins(
//                   fontSize: 14,
//                   color: textColorBlack,
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//               const SizedBox(height: 4),
//               Text(
//                 "Anjali Jaiswal " * 6,
//                 textAlign: TextAlign.center,
//                 style: GoogleFonts.poppins(
//                   fontSize: 12,
//                   color: textColorBlack.withOpacity(0.6),
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
