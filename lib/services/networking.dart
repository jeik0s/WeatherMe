import 'package:flutter/cupertino.dart';
import 'package:weatherme/utilities/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper({@required this.latitude, @required this.longitude});

  final double latitude;
  final double longitude;

  Future getData() async {
    var url = Uri.https('api.openweathermap.org', '/data/2.5/weather', {
      'lat': latitude.toString(),
      'lon': longitude.toString(),
      'appid': kkApiKey,
      'units': "metric"
    });
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print("We occure problem: ${response.statusCode}");
    }
  }
}
