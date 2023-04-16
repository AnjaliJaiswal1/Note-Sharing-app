import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_sharing_app/Hive/logged_in.dart';
import 'package:note_sharing_app/Services/upload_service.dart';
import 'package:note_sharing_app/constants.dart';
import 'package:note_sharing_app/shared.dart';
import 'package:provider/provider.dart';

import '../../main.dart';

class UploadPost extends StatelessWidget {
  final File file;
  const UploadPost({super.key, required this.file});

  @override
  Widget build(BuildContext context) {
    UserDataHive userData = box.get(userDataKey);
    GlobalKey<FormState> uploadFormState = GlobalKey<FormState>();
    TextEditingController titleController = TextEditingController();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: ArrowBackButton(
            iconColor: primaryColor1,
          ),
          title: Text(
            "Upload Post",
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: textColorBlack,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: Form(
          key: uploadFormState,
          child: Container(
            margin: EdgeInsets.all(24),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  MyTextFormField(
                    requiredValidator: true,
                    controller: titleController,
                    hintText: "Enter description ",
                  ),
                  SizedBox(
                    height: height10 * 3,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: Colors.grey, width: 2)),
                    height: Get.height * 0.45,
                    width: Get.width,
                    clipBehavior: Clip.hardEdge,
                    child: Image.file(
                      file,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: height10 * 4,
                  ),
                  CustomElevatedButton(
                      child: Text(
                        "Upload",
                        style: GoogleFonts.poppins(),
                      ),
                      onPressed: () {
                        if (uploadFormState.currentState!.validate()) {
                          log("button pressed");
                          Provider.of<UploadFileService>(context, listen: false)
                              .uploadFile(
                                  file: file,
                                  post_content: titleController.text,
                                  post_author: userData.id!);
                        }
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
