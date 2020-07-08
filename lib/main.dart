import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DaySphere extends StatelessWidget {
  String nameOfTheDay;
  double topValue;
  String photoLink;
  DaySphere({
    this.nameOfTheDay,
    this.topValue,
    this.photoLink,
  });

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: topValue),
      child: Center(child: Image(image: NetworkImage(photoLink))),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blue[200],
      ),
      width: 100,
      height: 100,
    );
  }
}
class additionalInfoBox extends StatelessWidget {
  String infoName;
  String infoUnit;
  int infoValue;

  additionalInfoBox({
    this.infoName,
    this.infoUnit,
    this.infoValue,
  });

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: Center(child: Text(infoName)),
          height: 20,
          width: 200,
          decoration: BoxDecoration(
            color: Colors.blueGrey[400],
          ),
        ),
        Container(
          child: Center(
              child: Text(
            "$infoValue " + infoUnit,
            style: TextStyle(fontSize: 20),
          )),
          width: 200,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.blueGrey[400],
            borderRadius: new BorderRadius.vertical(bottom: Radius.circular(20))
          ),
        ),
      ],
    );
  }
}


void main() => runApp(
      MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.blueGrey[300],
          appBar: AppBar(
            backgroundColor: Colors.blueGrey[100],
            title: Text("Weather me"),
            leading: Image(
              image: NetworkImage(
                  'http://files.softicons.com/download/web-icons/vector-stylish-weather-icons-by-bartosz-kaszubowski/png/64x64/sun.rays.small.png'),
            ),
            actions: <Widget>[
              Image(
                image: NetworkImage(
                    'http://files.softicons.com/download/web-icons/vector-stylish-weather-icons-by-bartosz-kaszubowski/png/64x64/cloud.dark.rain.png'),
              ),
              Image(
                image: NetworkImage(
                    'http://files.softicons.com/download/web-icons/vector-stylish-weather-icons-by-bartosz-kaszubowski/png/64x64/cloud.dark.fog.png'),
              ),
              Image(
                image: NetworkImage(
                    'http://files.softicons.com/download/web-icons/vector-stylish-weather-icons-by-bartosz-kaszubowski/png/64x64/cloud.dark.png'),
              )
            ],
          ),
          body: new Column(
            children: <Widget>[
              Container(
                color: Colors.blueGrey[400],
                height: 200,
                child: new Row(
                  children: <Widget>[
                    Spacer(),
                    new Column(
                      children: <Widget>[
                        DaySphere(
                            nameOfTheDay: 'Yesterday',
                            topValue: 25,
                            photoLink:
                                'http://files.softicons.com/download/web-icons/vector-stylish-weather-icons-by-bartosz-kaszubowski/png/64x64/sun.rays.small.png'),
                        Text('Yesterday')
                      ],
                    ),
                    Spacer(),
                    new Column(
                      children: <Widget>[
                        DaySphere(
                            nameOfTheDay: 'Today',
                            topValue: 50,
                            photoLink:
                                'http://files.softicons.com/download/web-icons/vector-stylish-weather-icons-by-bartosz-kaszubowski/png/64x64/sun.rays.small.png'),
                        Text('Today')
                      ],
                    ),
                    Spacer(),
                    new Column(
                      children: <Widget>[
                        DaySphere(
                            nameOfTheDay: 'Tomorrow',
                            topValue: 25,
                            photoLink:
                                'http://files.softicons.com/download/web-icons/vector-stylish-weather-icons-by-bartosz-kaszubowski/png/64x64/cloud.dark.rain.png'),
                        Text('Tomorrow')
                      ],
                    ),
                    Spacer(),
                  ],
                ),
              ),
              Container(
                child: Center(
                  child: Text(
                    'Now',
                    style: TextStyle(height: 2, fontSize: 30),
                  ),
                ),
              ),
              Container(
//                height: 200,
                child: new Column(
                  children: <Widget>[
                    new Row(
                      children: <Widget>[
                        Spacer(),
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Colors.blueGrey[400],
                              borderRadius: new BorderRadius.vertical(
                                  top: Radius.circular(20))),
                          child: new Row(
                            children: <Widget>[
                              Spacer(),
                              Container(
                                child: Text(
                                  '27°C',
                                  style: TextStyle(fontSize: 30),
                                ),
                              ),
                              Spacer(),
                              Image(
                                  image: NetworkImage(
                                      'http://files.softicons.com/download/web-icons/vector-stylish-weather-icons-by-bartosz-kaszubowski/png/128x128/cloud.dark.multiple.lightning.png')),
                              Spacer(),
                            ],
                          ),
                          width: 400,
                          height: 150,
                        ),
                        Spacer(),
                      ],
                    ),
                    new Row(
                      children: <Widget>[
                        Spacer(),
                        additionalInfoBox(
                            infoName: 'Rain', infoUnit: '%', infoValue: 50),
                        additionalInfoBox(
                            infoName: 'Wind', infoUnit: 'km/h', infoValue: 10),
                        Spacer(),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                child: (Center(
                  child: Text(
                    'Time',
                    style: TextStyle(fontSize: 30),
                  ),
                )),
                height: 70,
              ),
              Container(
                child: Center(
                  child: Slider(
                    value: 17,
                    min: 7,
                    max: 23,
                    divisions: 16,
                  ),
                ),
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
