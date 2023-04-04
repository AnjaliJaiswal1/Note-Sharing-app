import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_sharing_app/constants.dart';
import 'package:note_sharing_app/shared.dart';

class PhoneLoginPage extends StatefulWidget {
  const PhoneLoginPage({super.key});

  @override
  State<PhoneLoginPage> createState() => _PhoneLoginPageState();
}

class _PhoneLoginPageState extends State<PhoneLoginPage> {
  TabController? tabController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Center(
          child: DefaultTabController(
            length: 2,
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
                  height: height10 * 4,
                ),
                Container(
                  width: Get.width - 100,
                  height: 50,
                  decoration: BoxDecoration(
                      color: primaryColor3,
                      border: Border.all(color: const Color(0xffE2E2E2)),
                      borderRadius: const BorderRadius.all(Radius.circular(8))),
                  child: TabBar(
                    labelColor: Colors.white,
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: primaryColor2),
                    controller: tabController,
                    tabs: const [
                      // Tab(text: "Signin",),
                      Tab(
                        child: Text(
                          "Phone Number",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, color: Colors.white),
                        ),
                      ),
                      Tab(
                        child: Text(
                          "Email",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: height10,
                ),
                SizedBox(
                  height: height10 * 23,
                  child: TabBarView(
                      controller: tabController,
                      children: [PhoneLogin(), PhoneLogin()]),
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}

class PhoneLogin extends StatefulWidget {
  const PhoneLogin({super.key});

  @override
  State<PhoneLogin> createState() => _PhoneLoginState();
}

class _PhoneLoginState extends State<PhoneLogin> {
  GlobalKey<FormState> _phoneLoginFormKey = GlobalKey<FormState>();
  TextEditingController mobileNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 52.0, vertical: 24),
      child: SingleChildScrollView(
        child: Form(
          key: _phoneLoginFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Phone number",
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w400),
                  )),
              SizedBox(
                height: height10,
              ),
              MyTextFormField(
                controller: mobileNumberController,
                hintText: "Enter your mobile number",
                keyboardType: TextInputType.number,
                maxLength: 10,
                mobileNumberValidator: true,
              ),
              SizedBox(
                height: height10 * 10,
              ),
              CustomElevatedButton(
                child: const Text("Request OTP"),
                onPressed: () {
                  if (_phoneLoginFormKey.currentState!.validate()) {
                    log("Done");
                  }
                },
              ),
              SizedBox(
                height: height10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Not registered yet?"),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Sign Up",
                        style: TextStyle(color: primaryColor1),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
