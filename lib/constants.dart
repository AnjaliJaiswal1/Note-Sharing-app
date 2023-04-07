import 'package:flutter/material.dart';
import 'package:get/get.dart';

double height = Get.height;
double width = Get.width;
double height10 = Get.height / 39.2;
double width10 = Get.width / 82.5;
String girlAvatar =
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1tZt2GTv3xusdfAEeIuJj-Po7TUIxUEaTzw&usqp=CAU";
String boyAvatar =
    "data:image/png;base64,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";

Color primaryColor1 = const Color(0xFF5A56BF);
Color primaryColor2 = const Color(0xFF817ECE);
Color primaryColor3 = const Color(0xFFBBBAD9);

Color secondaryColor1 = const Color(0xFFF27052);
Color secondaryColor2 = const Color(0xFFFF9076);
Color secondaryColor3 = const Color(0xFFFFB7A7);

Color tertiaryColor1 = const Color(0xFF5A56BF);
Color tertiaryColor2 = const Color(0xFFFFDD64);
Color tertiaryColor3 = const Color(0xFFFF1640);
Color tertiaryColor4 = const Color(0xFF4CE364);

Color textColorBlack = const Color(0xFF2D2D2D);
Color textColorWhite = const Color(0xFFFAFAFA);

List<String> onboardingImages = [
  'assets/images/organized.svg',
  'assets/images/students_community.svg',
  'assets/images/prepare.svg',
];

List<String> onboardingTitle = [
  'Get Organized Shelf',
  'Students Community',
  'Prepare Better',
];

List<String> onboardingDescription = [
  "Notes getting scattered in your gallery?\nNow you can keep them organized in our\nsubjects show",
  "Get all your queries answered and your\ndoubts solved from people of your stream",
  "Get study materials for your targeted exams\nand be ready for future ",
];

List<String> listViewSvg = [
  'assets/images/exam.svg',
  'assets/images/subject.svg',
  'assets/images/forum.svg',
];

List<String> listViewTitle = [
  'Exam Info',
  'Subject Shelf',
  'Q/A Forum',
];

List<String> listViewDescription = [
  'Get exam release information in one spot',
  'Exchange note and knowlegde globally',
  'Get the right solutions it just one click',
];

List<String> recentViewImage = [
  'assets/images/circuit.jpg',
  'assets/images/django.jpg',
  'assets/images/engineering_drawing.jpg',
];

List<String> recentViewTitlw = [
  'Circuit Design',
  'Django',
  'Engineering Drawing',
];

List<String> subjectShelfSvg = [
  'assets/images/circuit_design.svg',
  'assets/images/computer_science.svg',
  'assets/images/oops.svg',
  'assets/images/data_structure.svg',
];

List<String> subjectShelfTitle = [
  'Circuit Design',
  'Computer Science',
  'Object Oriented Programming',
  'Data Structure',
];
