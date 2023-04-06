import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_sharing_app/Screens/Home/home.dart';
import 'package:note_sharing_app/Services/login_service.dart';
import 'package:note_sharing_app/models/login_response_model.dart';
import 'package:note_sharing_app/models/profile_model.dart';
import 'package:note_sharing_app/shared.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';

class CreateProfileScreen extends StatefulWidget {
  final UserData userData;
  const CreateProfileScreen({super.key, required this.userData});

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  TextEditingController collegeController = TextEditingController();
  TextEditingController courseController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController descController = TextEditingController();
  GlobalKey<FormState> _createProfileScreen = GlobalKey<FormState>();
  int? gender;
  bool isButtonPressed = false;
  ProfileData? profileData;

  @override
  Widget build(BuildContext context) {
    log(widget.userData.id.toString());
    log(widget.userData.firstName.toString());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: ArrowBackButton(
          iconColor: primaryColor1,
        ),
        title: Text(
          "Create Profile",
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
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Form(
            key: _createProfileScreen,
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      height: height10 * 3,
                    ),
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            'assets/images/anjali.png',
                            height: Get.height * 0.125,
                            width: Get.height * 0.125,
                            fit: BoxFit.cover,
                            filterQuality: FilterQuality.high,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4),
                          child: Container(
                            height: 24,
                            width: 24,
                            decoration: BoxDecoration(
                              color: primaryColor1,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height10 * 3,
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
                              gender = value;
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
                                  loginService.createProfile(
                                      course: courseController.text,
                                      desc: descController.text,
                                      university: collegeController.text,
                                      userId: widget.userData.id,
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
                                    Get.offAll(Home(
                                      userProfileData: profileData,
                                    ));
                                  }
                                }
                              },
                        child: isButtonPressed
                            ? const Center(
                                child: CircularProgressIndicator.adaptive(
                                  valueColor:
                                      AlwaysStoppedAnimation(Colors.white),
                                ),
                              )
                            : Text("Update",
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(fontSize: 18),
                                )))
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
