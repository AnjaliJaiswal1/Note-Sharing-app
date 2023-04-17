import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_sharing_app/Services/qna_service.dart';
import 'package:note_sharing_app/models/Qna_model.dart';
import 'package:http/http.dart' as http;

import '../../Hive/token/token.dart';
import '../../constants.dart';
import '../../main.dart';
import '../Profile/profile_screen.dart';

class QnA_Forum extends StatefulWidget {
  const QnA_Forum({super.key});

  @override
  State<QnA_Forum> createState() => _QnA_ForumState();
}

QnaModel? qnaModel;

class _QnA_ForumState extends State<QnA_Forum> {
  TokenModel userToken = box.get(tokenHiveKey);
  Future getQnAPosts() async {
    try {
      http.Response qnaPosts = await http.get(
        Uri.parse("https://note-sharing-application.onrender.com/qna/"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${userToken.accessToken}"
        },
      );
      if (qnaPosts.statusCode == 200 && qnaPosts.body.isNotEmpty) {
        Map<String, dynamic> qnaPostsMap =
            jsonDecode(qnaPosts.body) as Map<String, dynamic>;
        qnaModel = QnaModel.fromJson(qnaPostsMap);
      } else {
        log("Empty data QnA Posts");
      }
    } catch (e) {
      log('QnA Posts Exception : $e');
    }
  }

  @override
  void initState() {
    getQnAPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          width: Get.width,
          padding: const EdgeInsets.all(16),
          child: qnaModel != null
              ? ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: qnaModel!.data!.length,
                  itemBuilder: (context, index) {
                    log(qnaModel!.data![index].user.toString());
                    return QnAPost(index: index);
                  },
                  separatorBuilder: (context, index) => Container(
                    height: 6,
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: primaryColor3.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                )
              : Center(
                  child: CircularProgressIndicator.adaptive(
                    valueColor: AlwaysStoppedAnimation(primaryColor1),
                  ),
                ),
        ),
      ),
    );
  }
}

class QnAPost extends StatelessWidget {
  int index;
  QnAPost({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: Colors.white,
                foregroundImage: AssetImage('assets/images/anjali.png'),
                minRadius: 24,
              ),
              const SizedBox(width: 16),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tanmoy Saha",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: textColorBlack,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "2 hours ago",
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: primaryColor3,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                splashRadius: 24,
                splashColor: primaryColor3,
                icon: const Icon(
                  Icons.more_horiz_outlined,
                  color: primaryColor1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            qnaModel!.data![0].questionTitle!,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: textColorBlack,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            qnaModel!.data![index].questionDescription!,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: textColorBlack,
            ),
          ),
          const SizedBox(height: 12),
          qnaModel!.data![index].questionImage != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset("assets/images/book.jpg"),
                )
              : const SizedBox(
                  height: 0,
                  width: 0,
                ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: primaryColor3,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.thumb_up,
                        color: primaryColor1,
                        size: 24,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "0 likes",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: primaryColor1,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: primaryColor3,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.comment_outlined,
                        color: primaryColor1,
                        size: 24,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "0 comments",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: primaryColor1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                splashRadius: 24,
                splashColor: primaryColor3,
                icon: const Icon(
                  Icons.add_box_outlined,
                  color: primaryColor1,
                  size: 24,
                ),
              )
            ],
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
