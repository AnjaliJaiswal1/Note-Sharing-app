import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_sharing_app/Hive/logged_in.dart';
import 'package:note_sharing_app/Screens/Home/home.dart';
import 'package:note_sharing_app/Services/login_service.dart';
import 'package:note_sharing_app/shared.dart';
import 'package:provider/provider.dart';
import '../../Hive/user_profile.dart';
import '../../constants.dart';

class CreateProfileScreen extends StatefulWidget {
  final String pageName;
  final bool isNew;
  final UserDataHive userData;
  final UserProfileDataHive? profileData;
  const CreateProfileScreen(
      {super.key,
      required this.pageName,
      required this.userData,
      required this.isNew,
      this.profileData});

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  TextEditingController collegeController = TextEditingController();
  TextEditingController courseController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController descController = TextEditingController();
  String? collegeId;
  String? profilePicUrl;
  // XFile? profile;
  GlobalKey<FormState> _createProfileScreen = GlobalKey<FormState>();
  int? gender;
  bool isButtonPressed = false;
  UserProfileDataHive? profileData;
  @override
  void initState() {
    super.initState();
    log("init state");
    if (widget.profileData != null) {
      log("message");
      courseController.text = widget.profileData!.course!;
      collegeController.text = widget.profileData!.university!;
      yearController.text = widget.profileData!.year!.toString();
      descController.text = widget.profileData!.description!;
      gender = widget.profileData!.gender == 'Male'
          ? 1
          : widget.profileData!.gender == 'Female'
              ? 2
              : 3;
      // profilePicUrl = widget.profileData!.profile_image!;
      collegeId = widget.profileData!.collegeID;
    }
  }

  @override
  Widget build(BuildContext context) {
    log("creste profile screen");
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const ArrowBackButton(
          iconColor: primaryColor1,
        ),
        title: Text(
          widget.pageName,
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: textColorBlack,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Consumer<LoginService>(
          builder: (context, LoginService loginService, _) {
        return Padding(
          padding: const EdgeInsets.all(32),
          child: Form(
            key: _createProfileScreen,
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child:
                              // profile != null
                              // ? const Icon(Icons.person)
                              Image.network(
                            // File(profile!.path),
                            "https://note-sharing-application.onrender.com${widget.profileData!.profile_image}",
                            height: Get.height * 0.125,
                            width: Get.height * 0.125,
                            fit: BoxFit.cover,
                            filterQuality: FilterQuality.high,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4),
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: primaryColor1,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: IconButton(
                              onPressed: () async {
                                // profile = await UploadFileService()
                                //     .uploadFile()
                                //     .then((value) {
                                //   if (value != null) {
                                //     profilePicUrl = value.path;
                                //   }
                                // });
                              },
                              icon: const Icon(
                                Icons.edit,
                                color: Colors.white,
                                size: 16,
                              ),
                              splashRadius: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height10 * 2,
                    ),
                    MyTextFormField(
                      controller: collegeController,
                      hintText: "University/College",
                    ),
                    SizedBox(
                      height: height10,
                    ),
                    MyTextFormField(
                      controller: courseController,
                      hintText: "Course",
                    ),
                    SizedBox(
                      height: height10,
                    ),
                    MyTextFormField(
                      controller: yearController,
                      hintText: "Year",
                    ),
                    SizedBox(
                      height: height10,
                    ),
                    MyTextFormField(
                      controller: descController,
                      hintText: "Description",
                    ),
                    SizedBox(
                      height: height10 / 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButtonFormField(
                          value: gender,
                          validator: (value) {
                            if (value == null) {
                              return "Required";
                            }
                          },
                          hint: const Text("Select Gender"),
                          items: const [
                            DropdownMenuItem(
                              value: 1,
                              child: Text("Male"),
                            ),
                            DropdownMenuItem(
                              value: 2,
                              child: Text("Female"),
                            ),
                            DropdownMenuItem(
                              value: 3,
                              child: Text("Other"),
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              gender = value as int;
                            });
                          }),
                    ),
                    SizedBox(
                      height: height10 * 3,
                    ),
                    CustomElevatedButton(
                      onPressed: isButtonPressed
                          ? () {}
                          : () {
                              if (_createProfileScreen.currentState!
                                  .validate()) {
                                setState(() {
                                  isButtonPressed = true;
                                });
                                // if (profile == null) {
                                //   Fluttertoast.showToast(
                                //       msg: "please upload image");
                                // } else {
                                try {
                                  loginService.createProfile(
                                      course: courseController.text,
                                      desc: descController.text,
                                      university: collegeController.text,
                                      userId: widget.userData.id,
                                      // profileImage: File(profile!.path),
                                      year: int.parse(yearController.text),
                                      gender: gender == 1
                                          ? "Male"
                                          : gender == 2
                                              ? "Female"
                                              : "Other");
                                  profileData = loginService.userProfile;
                                  if (profileData != null) {
                                    setState(() {
                                      isButtonPressed = false;
                                    });
                                    log("-------" + profileData.toString());
                                    Get.offAll(Home(
                                      userData: loginService.userData!,
                                      // userProfileData: profileData,
                                    ));
                                  } else {
                                    setState(() {
                                      isButtonPressed = false;
                                    });
                                  }
                                } catch (e) {
                                  setState(() {
                                    isButtonPressed = false;
                                  });
                                }
                                // }
                              }
                            },
                      child: isButtonPressed
                          ? const Center(
                              child: CircularProgressIndicator.adaptive(
                                valueColor:
                                    AlwaysStoppedAnimation(Colors.white),
                              ),
                            )
                          : Text(
                              "Update",
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
