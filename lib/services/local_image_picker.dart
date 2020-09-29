import 'package:image_picker/image_picker.dart';
import 'dart:io';

class LocalImagePicker {
  File _image;
  final _picker = ImagePicker();

  File getImage() {
    return _image;
  }

  Future getImageFromCamera() async {
    PickedFile image = await _picker.getImage(source: ImageSource.camera);
    _image = File(image.path);
  }

  Future getImageFromGallery() async {
    PickedFile image = await _picker.getImage(source: ImageSource.gallery);
    _image = File(image.path);
  }
}
