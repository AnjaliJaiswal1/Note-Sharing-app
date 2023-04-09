import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:note_sharing_app/Hive/logged_in.dart';
import 'package:note_sharing_app/constants.dart';
import 'package:note_sharing_app/main.dart';
import 'package:note_sharing_app/models/login_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:note_sharing_app/models/profile_model.dart';

import '../Hive/user_profile.dart';
// import 'package:xfile/xfile.dart';

class LoginService extends ChangeNotifier {
  CreateUserResponse? userResponseToken;
  bool? isUserAlreadyExist = false;
  bool? isuserEmailAlreadyExist = false;
  bool isLoggedIn = false;
  String? userToken;
  UserDataHive? userData;
  UserProfileDataHive? userProfile;
  bool refreshToken = false;
  // var box = Hive.box<UserDataHive>("UserInfo");

  registerUser(
      {required String firstName,
      required String lastName,
      required String email,
      required String password,
      required String userName}) async {
    try {
      Map<String, dynamic> userDetail = {
        "first_name": firstName,
        "last_name": lastName,
        "name": "$firstName $lastName",
        "email": email,
        "password": password,
        "username": userName
      };
      http.Response response = await http.post(
          Uri.parse(
            "https://note-sharing-application.onrender.com/user/api/register/",
          ),
          headers: {'Content-Type': 'application/json', 'Charset': 'utf-8'},
          body: jsonEncode(userDetail));

      Map<String, dynamic> data =
          jsonDecode(response.body) as Map<String, dynamic>;
      if (data.containsKey("access") || data.containsKey("refresh")) {
        userResponseToken = CreateUserResponse.fromMap(data);
        notifyListeners();
        userToken = userResponseToken!.access;
        notifyListeners();
      } else if (data.containsKey("username")) {
        isUserAlreadyExist = true;
        notifyListeners();
      } else if (data.containsKey("email")) {
        isuserEmailAlreadyExist = true;
        notifyListeners();
      }
    } catch (e) {
      log('$e---error');
      Fluttertoast.showToast(msg: "$e");
    }
  }

  loginUser({required String userName, required String password}) async {
    try {
      http.Response loginResponse = await http.post(
          Uri.parse(refreshToken
              ? "https://note-sharing-application.onrender.com/user/api/login/refresh:refresh_token"
              : "https://note-sharing-application.onrender.com/user/api/login/"),
          headers: {'Content-Type': 'application/json', 'Charset': 'utf-8'},
          body: jsonEncode({"username": userName, "password": password}));

      Map<String, dynamic> data =
          jsonDecode(loginResponse.body) as Map<String, dynamic>;
      log(loginResponse.body.toString());

      if (data.containsKey("refresh") || data.containsKey("access")) {
        userResponseToken = CreateUserResponse.fromMap(data);
        isLoggedIn = true;
        notifyListeners();
        userToken = userResponseToken!.access;
        notifyListeners();
        // log(userResponseToken.toString());
      } else if (data.containsKey("message") &&
          data.containsValue("Token is invalid or expired")) {
        refreshToken = true;
        notifyListeners();
      } else if (data.containsKey("error") &&
          data.containsValue("Invalid credentials")) {
        log("worng credentials");
        isLoggedIn = false;
        notifyListeners();
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "$e");
      log(e.toString());
    }
  }

  getUserData() async {
    try {
      http.Response loginResponse = await http.get(
        Uri.parse(
            "https://note-sharing-application.onrender.com/user/api/user/"),
        headers: {
          'Content-Type': 'application/json',
          "Authorization": 'Bearer $userToken'
        },
      );

      Map<String, dynamic> data =
          jsonDecode(loginResponse.body) as Map<String, dynamic>;
      // log(data.toString());
      if (data.containsKey("id")) {
        // log("user data exists");
        userData = UserDataHive.fromMap(data);
        box.put(userDataKey, userData!);
        notifyListeners();
      } else {
        // log("user dadta is null");
        userData = null;
      }
      // log(loginResponse.body.toString());
    } catch (e) {
      Fluttertoast.showToast(msg: "$e");
      log(e.toString());
    }
  }

  createProfile(
      {String? university,
      String? course,
      int? year,
      String? desc,
      String? gender,
      File? profileImage,
      int? userId}) async {
    try {
      http.Response response = await http.post(
          Uri.parse(
              "https://note-sharing-application.onrender.com/user/api/profile/"),
          headers: {
            'Content-Type': 'application/json',
            'Charset': 'utf-8',
            "Authorization": 'Bearer $userToken'
          },
          body: jsonEncode({
            "user": userId,
            "gender": gender,
            "description": desc,
            "university": university,
            "course": course,
            "year": year,
            "profile_image": profileImage
          }));
      Map<String, dynamic> data =
          jsonDecode(response.body) as Map<String, dynamic>;
      if (data.containsKey("id")) {
        userProfile = UserProfileDataHive.fromMap(data);
        box.put(userProfileKey, userProfile!);
        log("-----------------++-----------${box.get(userProfileKey)}");
        notifyListeners();
      }
      log(data.toString());
    } catch (e) {
      Fluttertoast.showToast(msg: "$e");
      log(e.toString());
    }
  }

  getProfileDetails() async {
    try {
      http.Response response = await http.get(
        Uri.parse(
            "https://note-sharing-application.onrender.com/user/api/profile/"),
        headers: {
          'Content-Type': 'application/json',
          "Authorization": 'Bearer $userToken'
        },
      );
      Map data = jsonDecode(response.body) as Map;
      if (data.containsKey("id")) {
        userProfile = UserProfileDataHive.fromMap(data as Map<String, dynamic>);
        box.put(userProfileKey, userProfile);
        notifyListeners();
        log("${box.get(userProfileKey)} __________________________");
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }
}
