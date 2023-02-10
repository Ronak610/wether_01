import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Screen/Modal/wethar_modal.dart';

class ApiHttp {
  Future<WeatherModal?> getwether(String con) async {
    String apiwetherlink =
        "https://api.openweathermap.org/data/2.5/weather?q=$con,IN&appid=1177b1e3edcc54bc767e02d9b9806249";
    var response = await http.get(Uri.parse(apiwetherlink));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return WeatherModal.fromJson(json);
    }
    return null;
  }
}
