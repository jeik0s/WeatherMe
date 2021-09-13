import 'package:flutter/material.dart';
import 'package:weatherme/screens/location_screen.dart';
import 'package:weatherme/services/location.dart';
import 'package:weatherme/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        latitude: location.latitude, longitude: location.longitude);
    var weatherData = await networkHelper.getData();

    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(locationWeather: weatherData);
    }));
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child:
          SpinKitDoubleBounce(
            color: Colors.white,
            size: 100.0,
          )
      ),
    );
  }
}

//4f678fe256273c7c0f0930953f287ba6
