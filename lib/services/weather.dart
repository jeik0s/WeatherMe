import 'package:weatherme/services/location.dart';
import 'package:weatherme/services/networking.dart';

class WeatherModel {

   Future<dynamic> getLocationWeather() async{
     Location location = Location();
     await location.getCurrentLocation();
     NetworkHelper networkHelper = NetworkHelper();
     var weatherData = await networkHelper.getCoordData(longitude: location.longitude, latitude: location.latitude);
     return weatherData;
   }

   Future<dynamic> getCityWeather(String cityName) async {
     NetworkHelper networkHelper = NetworkHelper();
     var weatherData = await networkHelper.getCityData(cityName: cityName);
     return weatherData;
   }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
