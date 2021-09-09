import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState(){
    super.initState();
    getLocation();
  }

  void getLocation() async{
    Position position;
    try {
        position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
    } catch (e){
      print(e);
    }
    print(position ?? "Dupa nie ma lokalizacji :(");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
