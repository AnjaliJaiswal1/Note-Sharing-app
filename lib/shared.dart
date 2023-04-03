import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

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
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: primaryColor3)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: primaryColor3, width: 1)),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: primaryColor3, width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(12))),
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
          minimumSize: Size(Get.width - 100, 50),
          backgroundColor: primaryColor2),
    );
  }
}
