import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:note_sharing_app/shared.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;

import '../models/posts_model.dart';

class UploadFileService extends ChangeNotifier {
  AllPostsModel? allPosts;
  Future<XFile?> pickImage() async {
    final _imagePicker = ImagePicker();
    XFile? image;
    await Permission.photos.request();

    // var permissionStatus = await Permission.photos.status;1
    // if (permissionStatus.isGranted) {
    image = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      return image;
    } else {
      log("No image!!");
      // }
    }
    return null;
  }

  uploadFile(
      {required File file,
      required String post_content,
      required int post_author}) async {
    try {
      http.Response response = await http.post(
          Uri.parse("https://note-sharing-application.onrender.com/post/"),
          headers: {'Content-Type': 'application/json', 'Charset': 'utf-8'},
          body: jsonEncode({
            "post-content": post_content,
            "post_image": file,
            "post_author": post_author
          }));
      if (response.statusCode == 201) {
        toastMessage("Uploaded");
      }
    } catch (e) {
      log(e.toString());
      toastMessage("Failed to upload! please try again!!");
    }
  }

  getPosts({required String userToken}) async {
    try {
      http.Response response = await http.get(
        Uri.parse("https://note-sharing-application.onrender.com/post/"),
        headers: {
          'Content-Type': 'application/json',
          "Authorization": 'Bearer $userToken'
        },
      );
      log("---  " + response.body.toString());
      Map<String, dynamic> data =
          jsonDecode(response.body) as Map<String, dynamic>;
      if (response.statusCode == 200) {
        Map<String, dynamic> posts =
            jsonDecode(response.body) as Map<String, dynamic>;
        allPosts = AllPostsModel.fromMap(posts);
        log(allPosts!.data.toString());
        notifyListeners();
      } else {
        toastMessage("Failed to load");
        log("status code while getting post is not 200");
      }
    } catch (e) {
      toastMessage("Failed to load");
      log("error to get posts---" + e.toString());
      toastMessage(e.toString());
    }
  }
}
