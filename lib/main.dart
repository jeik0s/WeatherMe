import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
                KulaSmierci(nameOfTheDay: "Yesterday", topValue: 25),
                Spacer(),
                KulaSmierci(nameOfTheDay: "Today", topValue: 50),
                Spacer(),
                KulaSmierci(nameOfTheDay: "Tomorrow", topValue: 25),
                Spacer(),
              ],
            ),
          ),
          Container(
            height: 200,
            child: new Row(
              children: <Widget>[
                Spacer(),
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.blueGrey[400],
                      borderRadius: new BorderRadius.all(Radius.circular(20))
                  ),
                  child: new Row(
                    children: <Widget>[
                      Spacer(),
                      Container(
                        child: Text(
                          '27°C',
                          style: TextStyle(
                              fontSize: 30
                          ),
                        ),
                      ),
                      Spacer(),
                      Image(image: NetworkImage('http://files.softicons.com/download/web-icons/vector-stylish-weather-icons-by-bartosz-kaszubowski/png/128x128/cloud.dark.multiple.lightning.png')),
                      Spacer(),
                    ],
                  ),
                  width: 400,
                  height: 150,
                ),
                Spacer(),
              ],
            ),
          ),
        ],
      ),
    ),
  ),
);

class KulaSmierci extends StatelessWidget {
  String nameOfTheDay;
  double topValue;
  KulaSmierci({
    this.nameOfTheDay,
    this.topValue
  });

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: topValue),
      child: Center(
        child: Text(nameOfTheDay),
      ),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blue[200],
      ),
      width: 100,
      height: 100,
    );
  }
}
