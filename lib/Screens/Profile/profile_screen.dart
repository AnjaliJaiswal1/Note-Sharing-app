import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_sharing_app/Screens/Profile/create_profile.dart';
import 'package:note_sharing_app/Screens/settings/settings.dart';
import 'package:note_sharing_app/constants.dart';
import 'package:note_sharing_app/shared.dart';
import '../../models/login_response_model.dart';
import '../../models/profile_model.dart';

class ProfileScreen extends StatefulWidget {
  final UserData userData;
  final ProfileData? userProfileData;
  const ProfileScreen(
      {super.key, this.userProfileData, required this.userData});

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
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: primaryColor2),
                        borderRadius: BorderRadius.circular(12)),
                    height: Get.height * 0.125,
                    width: Get.height * 0.125,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        widget.userProfileData!.profile_image!,
                        height: Get.height * 0.125,
                        width: Get.height * 0.125,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Icon(
                          Icons.error_outline,
                          color: primaryColor2,
                        ),
                        filterQuality: FilterQuality.high,
                      ),
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
                "${widget.userData.firstName} ${widget.userData.lastName!}",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: textColorBlack,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                widget.userProfileData!.course!,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: textColorBlack,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                widget.userProfileData!.description!,
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
              CustomListTile(
                onTap: () {
                  Get.to(() => CreateProfileScreen(
                        profileData: widget.userProfileData,
                        isNew: false,
                        userData: widget.userData,
                      ));
                },
                leadingIcon: Icons.person,
                title: "Profile Details",
              ),
              SizedBox(
                height: height10,
              ),
              CustomListTile(
                onTap: () {},
                leadingIcon: Icons.upload_file_rounded,
                title: "Uploaded Files",
              ),
              SizedBox(
                height: height10,
              ),
              CustomListTile(
                onTap: () {},
                leadingIcon: Icons.favorite,
                title: "Saved Files",
              ),
              SizedBox(
                height: height10,
              ),
              CustomListTile(
                onTap: () {
                  Get.to(() => const SettingScreen());
                },
                leadingIcon: Icons.settings,
                title: "Settings",
              ),
              SizedBox(
                height: height10 * 2,
              ),
              CustomElevatedButton(
                  child: Text("Logout", style: GoogleFonts.poppins()),
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
  final Function()? onTap;
  const CustomListTile({
    required this.title,
    required this.leadingIcon,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
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
