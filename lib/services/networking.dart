import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mausam/utilities/constants.dart';

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;
  getData() async {
    final response = await http.get(Uri.parse(
        url));

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
