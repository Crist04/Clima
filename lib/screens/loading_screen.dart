import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mausam/screens/location_screen.dart';
import 'package:mausam/services/location.dart';
import 'package:http/http.dart' as http;
import 'package:mausam/services/networking.dart';
import 'package:mausam/services/weather.dart';
import 'package:mausam/utilities/constants.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double? lat;
  double? lon;
  @override
  void initState() {
    super.initState();
    getLocation();
    print("startewd");
  }

  void getLocation() async {
   
   var weatherData= await WeatherModel().getLocationWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(locationWeather: weatherData);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(color: Colors.white),
      ),
    );
  }
}
