import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';


Future <Uint8List?>  pickImage() async {

  final ImagePicker imagePicker = ImagePicker();

  XFile? pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
  if (pickedFile != null) {
    return await pickedFile.readAsBytes();
  }
  return null;

}
