import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class UploadFileService extends ChangeNotifier {
  Future<XFile?> pickImage() async {
    final _imagePicker = ImagePicker();
    XFile? image;
    await Permission.photos.request();

    // var permissionStatus = await Permission.photos.status;
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

  uploadFile({required File file,required String post_content,required int post_author}){
    

  }
}
