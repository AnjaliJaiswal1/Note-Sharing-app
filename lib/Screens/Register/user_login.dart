import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_sharing_app/Screens/Bottom%20Navigation/bottom_navigation_bar.dart';
import 'package:note_sharing_app/Screens/Home/home.dart';
import 'package:note_sharing_app/Screens/Profile/create_profile.dart';
import 'package:note_sharing_app/Services/login_service.dart';
import 'package:note_sharing_app/constants.dart';
import 'package:note_sharing_app/shared.dart';
import 'package:provider/provider.dart';
import '../../main.dart';
import 'register_screen.dart';

class UserLoginPage extends StatefulWidget {
  const UserLoginPage({super.key});

  @override
  State<UserLoginPage> createState() => UserLoginPageState();
}

class UserLoginPageState extends State<UserLoginPage> {
  GlobalKey<FormState> _loginForm = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isVisible = true;
  bool? isvalidUser;
  bool isButtonPressed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<LoginService>(
          builder: (context, LoginService loginService, _) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 32),
          child: SingleChildScrollView(
              child: Center(
            child: Form(
              key: _loginForm,
              child: Column(
                children: [
                  SizedBox(
                    height: height10 * 5,
                  ),
                  const Text(
                    "Login Account",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Hello, Welcome back to your account",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(fontSize: 16)),
                  ),
                  SizedBox(
                    height: height10 * 2,
                  ),
                  Icon(
                    Icons.co_present_rounded,
                    size: 120,
                    color: primaryColor2,
                  ),
                  SizedBox(
                    height: height10 * 3,
                  ),
                  MyTextFormField(
                    controller: userNameController,
                    hintText: "Enter User Name",
                  ),
                  SizedBox(
                    height: height10,
                  ),
                  MyTextFormField(
                    ownValidator: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Required";
                      }
                      //  else if (isvalidUser == false) {
                      //   return "Invalid username or password";
                      // }
                    },
                    maxLength: 25,
                    maxlines: 1,
                    suffixIcon: isVisible
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                isVisible = false;
                              });
                            },
                            icon: const Icon(
                              Icons.visibility,
                              color: primaryColor3,
                              size: 22,
                            ))
                        : IconButton(
                            onPressed: () {
                              setState(() {
                                isVisible = true;
                              });
                            },
                            icon: const Icon(
                              Icons.visibility_off,
                              color: primaryColor3,
                              size: 22,
                            )),
                    obscureText: isVisible,
                    controller: passwordController,
                    hintText: "Enter Password",
                  ),
                  SizedBox(
                    height: height10 * 3,
                  ),
                  CustomElevatedButton(
                      onPressed: isButtonPressed
                          ? () {}
                          : () async {
                              if (_loginForm.currentState!.validate()) {
                                setState(() {
                                  isButtonPressed = true;
                                });
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());

                                await loginService.loginUser(
                                    userName: userNameController.text.trim(),
                                    password: passwordController.text.trim());
                                await loginService.getProfileDetails();
                                await loginService.getUserData();
                                isvalidUser = loginService.isLoggedIn;
                                if (isvalidUser!) {
                                  log("yes user valid");
                                  setState(() {
                                    isButtonPressed = false;
                                  });
                                  Get.offAll(()=> CustomBottomNavBar());
                                  isvalidUser = true;
                                } else {
                                  log("user not valid");
                                  Fluttertoast.showToast(
                                      msg: "Wrong Credentials");
                                  setState(() {
                                    isvalidUser = false;
                                    isButtonPressed = false;
                                  });
                                }
                              }
                            },
                      child: isButtonPressed
                          ? const Center(
                              child: CircularProgressIndicator.adaptive(
                                strokeWidth: 2,
                                valueColor:
                                    AlwaysStoppedAnimation(Colors.white),
                              ),
                            )
                          : Text(
                              "Login",
                              style: GoogleFonts.poppins(),
                            )),
                  SizedBox(
                    height: height10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Not registered yet?"),
                      TextButton(
                          onPressed: () {
                            Get.offAll(const RegisterScreen());
                          },
                          child: const Text(
                            "Register",
                            style: TextStyle(color: primaryColor1),
                          ))
                    ],
                  )
                ],
              ),
            ),
          )),
        );
      }),
    );
  }
}
