import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';

class ArrowBackButton extends StatelessWidget {
  final Color iconColor;
  const ArrowBackButton({
    Key? key,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Get.back();
      },
      splashRadius: 24,
      splashColor: primaryColor3,
      icon: Icon(
        CupertinoIcons.arrow_left_square_fill,
        color: iconColor,
        size: 24,
      ),
    );
  }
}

class MyTextFormField extends StatelessWidget {
  final Widget? prefixIcon;
  final int? maxLength;
  final bool readOnly;
  final int? maxlines;
  final bool ownValidator;
  final bool numValidator;
  final bool requiredValidator;
  final bool emailValidator;
  final bool mobileNumberValidator;
  final bool obscureText;
  final String? hintText;
  final Widget? suffixIcon;
  final FormFieldValidator<String>? validator;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  MyTextFormField({
    super.key,
    this.validator,
    this.obscureText = false,
    this.suffixIcon,
    this.numValidator = false,
    this.inputFormatters,
    this.keyboardType,
    this.prefixIcon,
    this.maxLength,
    this.readOnly = false,
    this.maxlines,
    this.ownValidator = false,
    this.emailValidator = false,
    this.mobileNumberValidator = false,
    this.requiredValidator = true,
    this.hintText = "",
    required this.controller,
// class ProfileButton extends StatelessWidget {
//   final Function()? onTap;
//   final String title;
//   final IconData icons;
//   const ProfileButton({
//     super.key,
//     required this.onTap,
//     required this.title,
//     required this.icons,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          hintText: hintText,
          counterText: "",
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: primaryColor1,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: primaryColor3,
              width: 1,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: primaryColor3,
              width: 1,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:  BorderSide(color: secondaryColor1, width: 1.5),
          ),
          
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:  BorderSide(color: secondaryColor1, width: 2),
          ),
          isDense: true),
      readOnly: readOnly,
      obscureText: obscureText,
      maxLines: maxlines,
      textInputAction: TextInputAction.next,
      validator: ownValidator
          ? validator
          : (value) {
              if (numValidator && !value!.isNumericOnly) {
                // focusNode.requestFocus();
                return "Must be Number";
              }
              if (requiredValidator && value!.isEmpty) {
                // focusNode.requestFocus();
                return "Required";
              }
              if (emailValidator && (!value!.isEmail)) {
                // focusNode.requestFocus();
                return "Must be Email";
              }
              if (mobileNumberValidator && ((value!.length != 12))) {
                // focusNode.requestFocus();
                return "Must be 10 digits Number";
              }

              return null;
            },
      maxLength: maxLength,
      keyboardType: keyboardType,
      inputFormatters: const [],
    );
  }
}

class CustomElevatedButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  const CustomElevatedButton(
      {super.key, required this.child, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: child,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        minimumSize: Size(Get.width, 50),
        backgroundColor: primaryColor1,
      ),
    );
  }
}

class LargeButton extends StatefulWidget {
  final Function()? onPressed;
  final String buttonName;
  const LargeButton({
    super.key,
    required this.onPressed,
    required this.buttonName,
  });

  @override
  State<LargeButton> createState() => _LargeButtonState();
}

class _LargeButtonState extends State<LargeButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        maximumSize: Size(Get.width * 0.8, 50),
        minimumSize: Size(Get.width * 0.8, 50),
        backgroundColor: primaryColor1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        widget.buttonName,
        style: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: textColorWhite,
        ),
      ),
    );
  }
}

class SettingsButton extends StatefulWidget {
  final Function()? onTap;
  final IconData icons;
  final String title;
  final bool share;
  const SettingsButton({
    Key? key,
    required this.onTap,
    required this.icons,
    required this.title,
    this.share = false,
  }) : super(key: key);

  @override
  State<SettingsButton> createState() => _SettingsButtonState();
}

class _SettingsButtonState extends State<SettingsButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        width: Get.width,
        height: Get.height * 0.06,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            Icon(
              widget.icons,
              size: 20,
              color: primaryColor1,
            ),
            const SizedBox(width: 16),
            Text(
              widget.title,
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: textColorBlack,
                fontWeight: FontWeight.w500,
              ),
            ),
            if (widget.share) const Spacer(),
            if (widget.share)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 20,
                    width: Get.width * 0.2,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(left: 4),
                    decoration: BoxDecoration(
                      color: primaryColor3,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(2),
                        topLeft: Radius.circular(2),
                      ),
                    ),
                    child: Text(
                      "www.behance.net/gallery/134033011/Notes-Sharing-Application-UI-Case-Study?tracking_source=search_projects%7Cnotes",
                      maxLines: 1,
                      overflow: TextOverflow.visible,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: primaryColor1,
                      ),
                    ),
                  ),
                  Container(
                    height: 20,
                    width: Get.width * 0.1,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: primaryColor1,
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(2),
                        topRight: Radius.circular(2),
                      ),
                    ),
                    child: Text(
                      "copy",
                      maxLines: 1,
                      overflow: TextOverflow.visible,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              )
          ],
        ),
      ),
    );
  }
}

toastMessage(String text) {
  Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 3,
    fontSize: 14,
    backgroundColor: Colors.black,
    textColor: Colors.white,
  );
}
