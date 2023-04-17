import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_sharing_app/Hive/user_profile.dart';
import 'package:note_sharing_app/Screens/Bottom%20Navigation/bottom_navigation_bar.dart';
import 'package:note_sharing_app/Screens/Home/subject_shelf.dart';
import 'package:note_sharing_app/Screens/Profile/profile_screen.dart';
import 'package:note_sharing_app/Screens/Register/user_login.dart';
import 'package:note_sharing_app/Services/upload_service.dart';
import 'package:note_sharing_app/constants.dart';
import 'package:note_sharing_app/main.dart';
import '../../Hive/logged_in.dart';
class Explore extends StatefulWidget {
  final UserDataHive? userData;
  final UserProfileDataHive? userProfileDetail;
  const Explore({super.key, this.userData, this.userProfileDetail});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  UserProfileDataHive? profileData;
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Container(
        color: Colors.white,
        margin: const EdgeInsets.only(
          top: 32,
        ),
        child: ValueListenableBuilder<Box>(
          valueListenable: box.listenable(),
          builder: (context, boxdetails, _) {
            profileData = box.get(userProfileKey);
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                leading: GestureDetector(
                  onTap: () {
                    // log(profileData.toString());
                    // log(box.get(userProfileKey).toString());
                    // log(boxdetails.get(userProfileKey).toString());
                    // // Get.offAll(UserLoginPage());
                    Get.to(() => ProfileScreen(
                          userData: widget.userData!,
                          userProfileData: boxdetails.get(userProfileKey),
                        ));
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    foregroundImage: NetworkImage(
                        'https://note-sharing-application.onrender.com${profileData!.profile_image}'),
                  ),
                ),
                leadingWidth: 80,
                titleSpacing: 0,
                centerTitle: false,
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    widget.userData != null
                        ? Text(
                            "Hi ${widget.userData!.first_name} ",
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: textColorBlack,
                            ),
                          )
                        : TextButton(
                            onPressed: () => Get.to(() => ProfileScreen(
                                  userData: widget.userData!,
                                  userProfileData:
                                      boxdetails.get(userProfileKey),
                                )),
                            child: Text(
                              "Complete your profile",
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: textColorBlack,
                              ),
                            )),
                    // const SizedBox(height: 2.5),
                    Text(
                      "Welcome back!",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: textColorBlack.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    splashRadius: 24,
                    splashColor: primaryColor3,
                    icon: const Icon(
                      CupertinoIcons.bell_fill,
                      color: primaryColor1,
                      size: 24,

//            valueListenable: box.listenable(),
//            builder: (context, boxdetails, _) {
//              profileData = box.get(userProfileKey);
//              log(box.get(userProfileKey).toString());
//              return Scaffold(
//                appBar: AppBar(
//                  backgroundColor: Colors.white,
//                  elevation: 0,
//                  leading: GestureDetector(
//                    onTap: () {
//                      // log(profileData.toString());
//                      // log(box.get(userProfileKey).toString());
//                      // log(boxdetails.get(userProfileKey).toString());
//                      // // Get.offAll(UserLoginPage());
//                      Get.to(() => ProfileScreen(
//                            userData: widget.userData!,
//                            // userProfileData: boxdetails.get(userProfileKey),
//                          ));
//                    },
//                    child: CircleAvatar(
//                      backgroundColor: Colors.white,
//                      // foregroundImage:
//                      //     NetworkImage(profileData!.profile_image!)
//                      foregroundImage: AssetImage('assets/images/anjali.png'),
                    ),
                  ),
                ],
              ),
              backgroundColor: Colors.white,
              body: Padding(
                padding: const EdgeInsets.only(right: 16, left: 16, top: 16),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: searchController,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: primaryColor1,
                        ),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(8),
                          prefixIcon: const Icon(
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
                              color: primaryColor3,
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: primaryColor3,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
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
                      SizedBox(height: height10),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              'assets/images/book.jpg',
                              fit: BoxFit.cover,
                              height: Get.height * 0.2,
                              width: Get.width,
                            ),
                          ),
                          Container(
                            height: 56,
                            width: 56,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(56),
                              boxShadow: const [
                                BoxShadow(
                                  offset: Offset(0, 0),
                                  blurRadius: 10,
                                  color: Colors.black54,
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.play_arrow_rounded,
                              color: primaryColor1,
                              size: 48,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height10 * 1.5),
                      SizedBox(
                          height: Get.height * 0.25,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  height: Get.height * 0.25,
                                  width: Get.width * 0.3,
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      width: 1.5,
                                      color: primaryColor3,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      AspectRatio(
                                        aspectRatio: 1,
                                        child: SvgPicture.asset(
                                          'assets/images/exam.svg',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      Text(
                                        'Exam Info',
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: textColorBlack,
                                        ),
                                      ),
                                      Text(
                                        'Get exam release information in one spot',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color:
                                              textColorBlack.withOpacity(0.6),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => const SubjectShelf());
                                },
                                child: Container(
                                  height: Get.height * 0.25,
                                  width: Get.width * 0.3,
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      width: 1.5,
                                      color: primaryColor3,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      AspectRatio(
                                        aspectRatio: 1,
                                        child: SvgPicture.asset(
                                          'assets/images/subject.svg',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      Text(
                                        'Subject Shelf',
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: textColorBlack,
                                        ),
                                      ),
                                      Text(
                                        'Exchange note and knowlegde globally',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color:
                                              textColorBlack.withOpacity(0.6),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  height: Get.height * 0.25,
                                  width: Get.width * 0.3,
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      width: 1.5,
                                      color: primaryColor3,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      AspectRatio(
                                        aspectRatio: 1,
                                        child: SvgPicture.asset(
                                          'assets/images/forum.svg',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      Text(
                                        'Q/A Forum',
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: textColorBlack,
                                        ),
                                      ),
                                      Text(
                                        'Get the right solutions it just one click',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color:
                                              textColorBlack.withOpacity(0.6),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                          // ListView.separated(
                          //   scrollDirection: Axis.horizontal,
                          //   itemCount: 3,
                          //   shrinkWrap: true,
                          //   itemBuilder: (context, listIndex) {
                          //     return Container(
                          //       height: Get.height * 0.25,
                          //       width: Get.width * 0.3,
                          //       padding: const EdgeInsets.all(4),
                          //       decoration: BoxDecoration(
                          //         borderRadius: BorderRadius.circular(8),
                          //         border: Border.all(
                          //           width: 1.5,
                          //           color: primaryColor3,
                          //         ),
                          //       ),
                          //       child: Column(
                          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //         children: [
                          //           AspectRatio(
                          //             aspectRatio: 1,
                          //             child: SvgPicture.asset(
                          //               listViewSvg[listIndex],
                          //               fit: BoxFit.contain,
                          //             ),
                          //           ),
                          //           Text(
                          //             listViewTitle[listIndex],
                          //             style: GoogleFonts.poppins(
                          //               fontSize: 14,
                          //               fontWeight: FontWeight.w600,
                          //               color: textColorBlack,
                          //             ),
                          //           ),
                          //           Text(
                          //             listViewDescription[listIndex],
                          //             textAlign: TextAlign.center,
                          //             style: GoogleFonts.poppins(
                          //               fontSize: 12,
                          //               fontWeight: FontWeight.w400,
                          //               color: textColorBlack.withOpacity(0.6),
                          //             ),
                          //           ),
                          //         ],
                          //       ),
                          //     );
                          //   },
                          //   separatorBuilder: (context, index) =>
                          //       const SizedBox(width: 10),
                          // ),
                          ),
                      const SizedBox(height: 16),
                      Text(
                        "Recently Viewed Notes",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: textColorBlack,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ListView.separated(
                        itemCount: 3,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, recentIndex) {
                          return Container(
                            height: Get.height * 0.15,
                            width: Get.width - 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                width: 1,
                                color: primaryColor3,
                              ),
                            ),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(16),
                                    topLeft: Radius.circular(16),
                                  ),
                                  child: AspectRatio(
                                    aspectRatio: 1.25,
                                    child: Image.asset(
                                      recentViewImage[recentIndex],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: Get.width * 0.45,
                                        child: Text(
                                          recentViewTitlw[recentIndex],
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.poppins(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: textColorBlack,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "Uploaded 3 mins ago",
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: textColorBlack,
                                        ),
                                      ),
                                      Text(
                                        "12 MB",
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: textColorBlack,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const CircleAvatar(
                                            backgroundColor: Colors.white,
                                            foregroundImage: AssetImage(
                                                'assets/images/potrait.jpg'),
                                            maxRadius: 12,
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            "Lisa Lang",
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.poppins(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: textColorBlack,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 10),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  
  }
}
