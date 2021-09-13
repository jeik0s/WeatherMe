import 'package:flutter/material.dart';
import 'package:weatherme/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  void getLocation() async {
  Location location = Location();
  await location.getCurrentLocation();
  print(location.latitude);
  print(location.longitude);
//  getData(location.latitude, location.longitude);
  }

  void getData(double lat, double lon) async{
    var url = Uri.https('api.openweathermap.org', '/data/2.5/weather',{'lat':lat.toString(), 'lon':lon.toString(), 'appid': '4f678fe256273c7c0f0930953f287ba6'});
    print(url);
    var response = await http.get(url);
    if(response.statusCode == 200){

      var decodedJsonData = jsonDecode(response.body);

      double temperature = decodedJsonData["main"]["temp"];
      int condition = decodedJsonData["weather"][0]["id"];
      String cityName = decodedJsonData["name"];
      print("City: $cityName, temp: $temperature, condition: $condition");
    }
  }


  @override
  void initState(){
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    getData(37.33233141, -122.0312186);
    return Scaffold(
      body: Container(
        width: 200,
        height: 200,
        color: Colors.lightGreen,
        child: FlatButton(
          onPressed: (){
            getData(37.33233141, -122.0312186);
          },
        ),
      ),
    );
  }
}


//4f678fe256273c7c0f0930953f287ba6