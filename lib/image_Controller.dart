import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class ImageController extends GetxController {
  PickedFile? _pickedFile;
  Uint8List? _bytesImage;
  String? base64Image;
  PickedFile? get pickedFile => _pickedFile;
  final _picker = ImagePicker();
  Future<void> pickImage() async {
    // ignore: deprecated_member_use
    _pickedFile = await _picker.getImage(source: ImageSource.gallery);
    update();
  }

//updateimage= update profile
  Future<bool> upload() async {
    Uint8List _bytesImage;
    update();
    bool success = false;
    http.StreamedResponse response = await updateImage(_pickedFile);
    String base64Image;
    http.StreamedResponse imageBytes = response;
    base64Image = base64Encode(response as List<int>);
    _bytesImage = Base64Decoder().convert(base64Image);
    //_isLoading = false;
    if (response.statusCode == 200) {
      Map map = jsonDecode(await response.stream.bytesToString());
      String message = map["message"];
      success = true;
      print(message);
    } else {
      print("error posting the image");
    }
    update();
    return success;
  }

//updateprofile = updateImage
  Future<http.StreamedResponse> updateImage(PickedFile? data) async {
    http.MultipartRequest request = http.MultipartRequest(
        'POST', Uri.parse('http://127.0.0.1:8000/api/uploadImage'));
    // request.headers.addAll(<String,String>{'Authorization': 'Bearer $token'});
    if (GetPlatform.isMobile && data != null) {
      File _file = File(data.path);
      request.files.add(http.MultipartFile(
          'image', _file.readAsBytes().asStream(), _file.lengthSync(),
          filename: _file.path.split('/').last));
    }
    http.StreamedResponse response = await request.send();
    return response;
  }
}
