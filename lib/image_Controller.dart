import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class ImageController extends GetxController {
  PickedFile? _pickedFile;
  PickedFile? get pickedFile => _pickedFile;
  final _picker = ImagePicker();
  Future<void> pickImage() async {
    // ignore: deprecated_member_use
    _pickedFile = await _picker.getImage(source: ImageSource.gallery);
    update();
    // if (!mounted) {
    //   return;
    // }

    // try {
    //   final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    //   if (image == null) return;
    //   final imageTemporary = File(image.path);
    //   if (!mounted) {
    //     return;
    //   }
    //   setState(() {
    //     _image = imageTemporary;
    //   });
    // } catch (error) {
    //   print("error: $error");
    // }
  }

//updateimage= update profile
  Future<bool> upload() async {
    update();
    bool success = false;
    http.StreamedResponse response = await updateImage(_pickedFile);
    //_isLoading = false;
    if (response.statusCode == 200) {
      Map map = jsonDecode(await response.stream.bytesToString());
      String message = map["message"];
      success = true;
      //_imagePath = message;
      // _pickedFile = null;
      //await getUserInfo();
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
    // Map<String, String> _fields = Map();
    // _fields.addAll(<String, String>{
    //   'f_name': userInfoModel.fName,
    //   'email': userInfoModel.email
    // });
    // request.fields.addAll(_fields);
    http.StreamedResponse response = await request.send();
    return response;
  }
}
