import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final String urlData;
  NetworkHelper(this.urlData);

  Future getData() async {
    var url = Uri.parse(urlData);
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var data = response.body;
      return jsonDecode(data);
    } else {
      print('Error Occured\nCouldn\'t fetch data');
    }
  }
}
