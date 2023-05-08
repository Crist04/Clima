import 'package:mausam/services/location.dart';
import 'package:http/http.dart' as http;
import 'package:mausam/services/networking.dart';
import 'package:mausam/utilities/constants.dart';
import 'package:geolocator/geolocator.dart';
class WeatherModel {


  Future<dynamic> getCityWeather(String cityName)async {
    Location location = new Location();
    await location.getcurrentLocation();
    double? lat = location.latitude;
    double? lon = location.longitude;
    NetworkHelper networkHelper = NetworkHelper(
        '$kUrl?q=$cityName&appid=$kApiKey&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather()async{
     Location location = new Location();
    await location.getcurrentLocation();
    double? lat = location.latitude;
    double? lon = location.longitude;
    NetworkHelper networkHelper = NetworkHelper(
        '$kUrl?lat=$lat&lon=$lon&appid=$kApiKey&units=metric');
    var weatherData = await networkHelper.getData();
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
