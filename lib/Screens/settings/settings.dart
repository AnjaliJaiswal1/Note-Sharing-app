import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_sharing_app/shared.dart';

import '../../constants.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: ArrowBackButton(
          iconColor: primaryColor1,
        ),
        title: Text(
          "Settings",
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: textColorBlack,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: height10 * 2,
            ),
            ListTile(
              leading: Icon(
                Icons.delete,
                color: primaryColor1,
              ),
              title: Text("Trash Bin"),
            ),
            ListTile(
              leading: Icon(
                Icons.notifications,
                color: primaryColor1,
              ),
              title: Text("Notifications"),
            ),
            ListTile(
              leading: Icon(
                Icons.language,
                color: primaryColor1,
              ),
              title: Text("Language"),
            ),
            ListTile(
              leading: Icon(
                Icons.privacy_tip,
                color: primaryColor1,
              ),
              title: Text("Privacy Policy"),
            ),
            ListTile(
              leading: Icon(
                Icons.share,
                color: primaryColor1,
              ),
              title: Text("Refer your friend"),
            ),
            ListTile(
              leading: Icon(
                Icons.feedback,
                color: primaryColor1,
              ),
              title: Text("Feedback & Help"),
            ),
            ListTile(
              leading: Icon(
                Icons.delete,
                color: primaryColor1,
              ),
              title: Text("Trash Bin"),
            ),
          ]),
        ),
      ),
    );
  }
}
