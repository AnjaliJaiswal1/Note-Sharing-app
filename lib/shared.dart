import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
