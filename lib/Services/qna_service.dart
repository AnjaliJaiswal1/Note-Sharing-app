import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:note_sharing_app/Hive/logged_in.dart';
import 'package:note_sharing_app/constants.dart';
import 'package:note_sharing_app/main.dart';
import 'package:note_sharing_app/models/Qna_model.dart';
import 'package:note_sharing_app/models/login_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:note_sharing_app/models/profile_model.dart';

import '../Hive/user_profile.dart';

class QnaService extends ChangeNotifier {
  // String? userToken;
  Future getQnAPosts(String? userToken) async {
    try {
      http.Response qnaPosts = await http.get(
        Uri.parse("https://note-sharing-application.onrender.com/qna/"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $userToken"
        },
      );
      if (qnaPosts.statusCode == 200 && qnaPosts.body.isNotEmpty) {
        Map<String, dynamic> qnaPostsMap = jsonDecode(qnaPosts.body) as Map<String, dynamic>;
        QnaModel qnaModel = QnaModel.fromJson(qnaPostsMap);
        notifyListeners();
      } else {
        log("Empty data QnA Posts");
      }
    } catch (e) {
      log('QnA Posts Exception : $e');
    }
  }
}