import 'dart:developer';

import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class UploadFileService {
  Future<XFile?> uploadFile() async {
    final _imagePicker = ImagePicker();
    XFile? image;
    await Permission.photos.request();

    // var permissionStatus = await Permission.photos.status;
    // if (permissionStatus.isGranted) {
    image = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      var file = XFile(image.path);
      log(file.path.toString());
      return file;
    } else {
      log("No image!!");
    }
    // }
    return null;
  }
}
