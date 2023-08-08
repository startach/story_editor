import 'dart:io';

import 'package:image_picker/image_picker.dart';

class MyCamera {
  static Future<File?> takePicture() async {
    try {
      final imagePicker = ImagePicker();
      final takenImage = await imagePicker.pickImage(
        source: ImageSource.camera,
        maxWidth: 900,
      );
      if (takenImage == null) {
        return null;
      }
      return File(takenImage.path);
    } catch (e) {
      throw Exception();
    }
  }
}
