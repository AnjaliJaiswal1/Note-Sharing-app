import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_sharing_app/Screens/Profile/profile_screen.dart';
import 'package:note_sharing_app/Screens/Register/email_login.dart';
import 'package:note_sharing_app/Services/login_service.dart';
import 'package:note_sharing_app/constants.dart';
import 'package:note_sharing_app/models/login_response_model.dart';
import 'package:note_sharing_app/shared.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  CreateUserResponse? userData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(32),
        child: SingleChildScrollView(
          child: Form(
            key: _registerFormKey,
            child: Center(
              child: Column(children: [
                SizedBox(
                  height: height10 * 3,
                ),
                Text("Create an Account",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 22),
                    )),
                SizedBox(
                  height: height10 * 0.5,
                ),
                Text(
                  "Sign up and start learning",
                  style: GoogleFonts.poppins(),
                ),
                SizedBox(
                  height: height10 * 2,
                ),
                MyTextFormField(
                  keyboardType: TextInputType.text,
                  controller: userNameController,
                  hintText: "User Name",
                ),
                SizedBox(
                  height: height10,
                ),
                MyTextFormField(
                  controller: firstNameController,
                  hintText: "First Name",
                  maxLength: 50,
                ),
                SizedBox(
                  height: height10,
                ),
                MyTextFormField(
                  controller: lastNameController,
                  hintText: "Last Name",
                  maxLength: 50,
                ),
                SizedBox(
                  height: height10,
                ),
                MyTextFormField(
                  emailValidator: true,
                  controller: emailController,
                  hintText: "Email",
                ),
                SizedBox(
                  height: height10,
                ),
                MyTextFormField(
                  maxLength: 25,
                  ownValidator: true,
                  validator: ((value) {
                    if (value!.length < 8) {
                      return "Must be at least 8 character";
                    }
                  }),
                  controller: passwordController,
                  hintText: "Password",
                ),
                SizedBox(
                  height: height10,
                ),
                MyTextFormField(
                  maxLength: 25,
                  ownValidator: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Required";
                    } else if (value != passwordController.text) {
                      return "Password not matched";
                    }
                  },
                  controller: confirmPasswordController,
                  hintText: "Confirm password",
                ),
                SizedBox(
                  height: height10 * 3,
                ),
                CustomElevatedButton(
                    child: const Text("Register"),
                    onPressed: () async {
                      if (_registerFormKey.currentState!.validate()) {
                        userData = await LoginService().registerUser(
                            firstName: firstNameController.text,
                            lastName: lastNameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                            userName: userNameController.text);
                        if (userData != null) {
                          log(userData.toString());
                          Get.to(ProfileScreen());
                        } else {
                          
                        }
                      }
                    }),
                SizedBox(
                  height: height10 * 0.5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?"),
                    TextButton(
                        onPressed: () {
                          Get.offAll(const UserLoginPage());
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(color: primaryColor1),
                        ))
                  ],
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
