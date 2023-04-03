import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_sharing_app/constants.dart';
import 'package:note_sharing_app/shared.dart';

import 'register_screen.dart';

class UserLoginPage extends StatefulWidget {
  const UserLoginPage({super.key});

  @override
  State<UserLoginPage> createState() => UserLoginPageState();
}

class UserLoginPageState extends State<UserLoginPage> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 32),
        child: SingleChildScrollView(
            child: Center(
          child: Column(
            children: [
              SizedBox(
                height: height10 * 3,
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
                // suffixIcon: isVisible
                //     ? IconButton(
                //         onPressed: () {
                //           setState(() {
                //             isVisible = false;
                //           });
                //         },
                //         icon: Icon(
                //           Icons.visibility,
                //           color: primaryColor3,
                //           size: 22,
                //         ))
                //     : IconButton(
                //         onPressed: () {
                //           setState(() {
                //             isVisible = true;
                //           });
                //         },
                //         icon: Icon(
                //           Icons.visibility_off,
                //           color: primaryColor3,
                //           size: 22,
                //         )),
                // obscureText: isVisible,
                controller: passwordController,
                hintText: "Enter Password",
              ),
              SizedBox(
                height: height10 * 3,
              ),
              CustomElevatedButton(
                  child: Text(
                    "Login",
                    style: GoogleFonts.poppins(),
                  ),
                  onPressed: () {}),
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
                      child: Text(
                        "Register",
                        style: TextStyle(color: primaryColor2),
                      ))
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
