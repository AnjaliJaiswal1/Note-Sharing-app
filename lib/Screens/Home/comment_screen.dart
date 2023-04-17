import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_sharing_app/constants.dart';
import 'package:note_sharing_app/shared.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  TextEditingController commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          FocusManager.instance.primaryFocus!.unfocus();
        });
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: ArrowBackButton(iconColor: primaryColor1),
          title: Text(
            "Comments",
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: textColorBlack,
              fontWeight: FontWeight.w600,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        bottomNavigationBar: Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: MyTextFormField(
              controller: commentController,
              hintText: 'Type comment here',
              suffixIcon: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.send_rounded,
                  color: primaryColor1,
                  size: 24,
                ),
                splashRadius: 24,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
