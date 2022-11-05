import 'package:http/http.dart' as http;

class CallPointsShop {
  final String _url = '';
  final String _imgUrl = '';

  getImage() {
    return _imgUrl;
  }

  getItemData(apiUrl) async {
    http.Response response = await http.get(
      Uri.parse(_url + apiUrl),
    );

    try {
      if (response.statusCode == 200) {
        return response;
      } else {
        return 'failed';
      }
    } catch (e) {
      print(e);
      return 'failed';
    }
  }
}
