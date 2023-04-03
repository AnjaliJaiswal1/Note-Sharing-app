import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_sharing_app/constants.dart';
import 'package:note_sharing_app/shared.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
          "Profile",
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: textColorBlack,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: height10,
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
                height: 16,
                width: Get.width,
              ),
              Text(
                "Anjali Jaiswal",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: textColorBlack,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Computer Science",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: textColorBlack,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "Anjali Jaiswal " * 6,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: textColorBlack.withOpacity(0.6),
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: height10 * 2,
              ),
              const CustomListTile(
                leadingIcon: Icons.person,
                title: "Profile Details",
              ),
              SizedBox(
                height: height10,
              ),
              const CustomListTile(
                leadingIcon: Icons.upload_file_rounded,
                title: "Uploaded Files",
              ),
              SizedBox(
                height: height10,
              ),
              const CustomListTile(
                leadingIcon: Icons.favorite,
                title: "Saved Files",
              ),
              SizedBox(
                height: height10,
              ),
              const CustomListTile(
                leadingIcon: Icons.settings,
                title: "Settings",
              ),
              SizedBox(
                height: height10 * 2,
              ),
              CustomElevatedButton(
                  child: Text("Logout",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(),
                      )),
                  onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final String title;
  final IconData leadingIcon;
  const CustomListTile({
    required this.title,
    required this.leadingIcon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4), color: primaryColor3),
        child: Center(
            child: Icon(
          leadingIcon,
          color: primaryColor1,
        )),
      ),
      title: Text(
        title,
        style: GoogleFonts.poppins(
            textStyle: TextStyle(fontWeight: FontWeight.w400)),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: primaryColor2,
        size: 18,
      ),
    );
  }
}
