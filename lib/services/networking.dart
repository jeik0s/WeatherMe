import 'package:flutter/cupertino.dart';
import 'package:weatherme/utilities/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper();

  Future getCoordData({@required final latitude, @required final longitude}) async {
    var url = Uri.https('api.openweathermap.org', '/data/2.5/weather', {
      'lat': latitude.toString(),
      'lon': longitude.toString(),
      'appid': kkApiKey,
      'units': "metric"
    });
    print(url);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return jsonDecode(response.body);
    } else {
      print("We occure problem: ${response.statusCode}");
    }
  }

  Future getCityData({@required final cityName}) async{
    var url = Uri.https('api.openweathermap.org', '/data/2.5/weather', {
      'q': cityName,
      'appid': kkApiKey,
      'units': 'metric'
    });
    var response = await http.get(url);
    if(response.statusCode == 200){
      return jsonDecode(response.body);
    } else {
      print('We occure problem ${response.statusCode}');
    }
  }

}
