import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {

  //Property
  final String url;
  String data;

  //Constructor
  NetworkHelper(this.url);

  //Method
  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      data = response.body;

      return JsonDecoder().convert(data);
    }
    else {
      print(response.statusCode);
    }
  }
}