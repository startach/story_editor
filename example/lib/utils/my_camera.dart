import 'dart:io';
import 'package:flutter/services.dart';
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
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print('Failed to pick image: $e');
    }
    return null;
  }
}
