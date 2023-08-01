import 'package:image_picker/image_picker.dart';

imagePicker() async {
  final returnedImage = ImagePicker().pickImage(source: ImageSource.gallery);
}
