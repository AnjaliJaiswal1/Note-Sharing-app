import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_sharing_app/Screens/Chat/chat.dart';
import 'package:note_sharing_app/Screens/Home/home.dart';
import 'package:note_sharing_app/Upload/upload.dart';
import 'package:note_sharing_app/constants.dart';

import '../Explore/explore.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: bottomNavIndex,
        children: const [
          Home(),
          Explore(),
          Upload(),
          Chat(),
        ],
      ),
      bottomNavigationBar: Container(
        height: Get.height * 0.08,
        width: Get.width * 0.9,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            width: 1,
            color: primaryColor3,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  bottomNavIndex = 0;
                });
              },
              child: SizedBox(
                width: Get.width * 0.2,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      Icons.home,
                      size: 28,
                      color:
                          bottomNavIndex == 0 ? primaryColor1 : primaryColor3,
                    ),
                    Text(
                      "Home",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color:
                            bottomNavIndex == 0 ? primaryColor1 : primaryColor3,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  bottomNavIndex = 1;
                });
              },
              child: SizedBox(
                width: Get.width * 0.2,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      Icons.grid_view_rounded,
                      size: 28,
                      color:
                          bottomNavIndex == 1 ? primaryColor1 : primaryColor3,
                    ),
                    Text(
                      "Explore",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color:
                            bottomNavIndex == 1 ? primaryColor1 : primaryColor3,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  bottomNavIndex = 2;
                });
              },
              child: SizedBox(
                width: Get.width * 0.2,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      Icons.add_box,
                      size: 28,
                      color:
                          bottomNavIndex == 2 ? primaryColor1 : primaryColor3,
                    ),
                    Text(
                      "Upload",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color:
                            bottomNavIndex == 2 ? primaryColor1 : primaryColor3,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  bottomNavIndex = 3;
                });
              },
              child: SizedBox(
                width: Get.width * 0.2,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      Icons.chat_rounded,
                      size: 28,
                      color:
                          bottomNavIndex == 3 ? primaryColor1 : primaryColor3,
                    ),
                    Text(
                      "chat",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color:
                            bottomNavIndex == 3 ? primaryColor1 : primaryColor3,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
