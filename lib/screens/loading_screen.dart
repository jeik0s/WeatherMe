import 'package:flutter/material.dart';
import 'package:weatherme/services/location.dart';
import 'package:weatherme/services/networking.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


  void getLocationData() async {
  Location location = Location();
  await location.getCurrentLocation();
  NetworkHelper networkHelper = NetworkHelper(latitude: location.latitude, longitude: location.longitude);
  var weatherData = await networkHelper.getData();
  print(weatherData);
  }

  @override
  void initState(){

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 200,
        height: 200,
        color: Colors.lightGreen,
        child: FlatButton(
          onPressed: (){
            getLocationData();
          },
        ),
      ),
    );
  }
}


//4f678fe256273c7c0f0930953f287ba6