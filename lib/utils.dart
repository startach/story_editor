import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

Future<XFile> takePicture() async {
  XFile? image;
  try {
    var pickedImage = await ImagePicker().pickImage(source: ImageSource.camera);

    final imageTemp = XFile(pickedImage!.path);
    image = imageTemp;

    return image;
  } on PlatformException catch (e) {
    return e as XFile;
  }
}
