import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_sharing_app/constants.dart';

import '../../shared.dart';

class SubjectShelf extends StatefulWidget {
  const SubjectShelf({super.key});

  @override
  State<SubjectShelf> createState() => _SubjectShelfState();
}

class _SubjectShelfState extends State<SubjectShelf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryColor1,
        leading: const ArrowBackButton(iconColor: Colors.white),
        title: Text(
          "Subject Shelf",
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: textColorWhite,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            splashColor: primaryColor3,
            splashRadius: 24,
            icon: const Icon(
              CupertinoIcons.bell_fill,
              color: Colors.white,
              size: 24,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: Get.height * 0.24,
                width: Get.width,
                color: primaryColor1,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Search and organize\nyour uploaded files here!",
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          color: textColorWhite,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 24),
                      TextFormField(
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: primaryColor1,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.all(8),
                          prefixIcon: Icon(
                            CupertinoIcons.search,
                            color: primaryColor3,
                            size: 24,
                          ),
                          hintText: "Search",
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: primaryColor3,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: primaryColor1,
                              width: 2,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: tertiaryColor3,
                              width: 1,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: tertiaryColor3,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    height: Get.height * 0.05,
                    width: Get.width,
                    color: primaryColor1,
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 16,
                      childAspectRatio: 0.7,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: 4,
                    itemBuilder: (context, gridIndex) {
                      return Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            width: 1.5,
                            color: primaryColor3,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AspectRatio(
                              aspectRatio: 1,
                              child: SvgPicture.asset(
                                subjectShelfSvg[gridIndex],
                                fit: BoxFit.contain,
                              ),
                            ),
                            SizedBox(
                              width: Get.width * 0.39,
                              child: Text(
                                subjectShelfTitle[gridIndex],
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  height: 1,
                                  color: textColorBlack,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(
                                  CupertinoIcons.folder_fill,
                                  color: primaryColor1,
                                  size: 16,
                                ),
                                Text(
                                  "18 files",
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: textColorBlack.withOpacity(0.6),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Icon(
                                  CupertinoIcons.clock_fill,
                                  color: primaryColor1,
                                  size: 16,
                                ),
                                Text(
                                  "64 mins",
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: textColorBlack.withOpacity(0.6),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        height: 48,
        width: 56,
        child: FloatingActionButton(
          onPressed: () {},
          foregroundColor: primaryColor3,
          backgroundColor: primaryColor1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(
            Icons.add,
            size: 24,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
