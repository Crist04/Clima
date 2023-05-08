import 'package:flutter/material.dart';
import 'package:mausam/screens/city_screen.dart';
import 'package:mausam/services/weather.dart';
import 'package:mausam/utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});
  final locationWeather;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  late int temperature;
  late String conditionIcon;
  late String cityName;
  late String message;

  @override
  void initState() {
    super.initState();

    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        conditionIcon = 'error';
        message = 'Unable to get weather Data';
        cityName = ' ';
        return;
      }
      temperature = weatherData['main']['temp'].toInt();
      var condition = weatherData['weather'][0]['id'];
      cityName = weatherData['name'];
      conditionIcon = weather.getWeatherIcon(condition);
      message = weather.getMessage(temperature);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    onPressed: () async {
                      var weatherData =
                          await WeatherModel().getLocationWeather();
                      updateUI(weatherData);
                    },
                    icon: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  IconButton(
                    onPressed: () async{
                      var typedName = await Navigator.push(context,
                          MaterialPageRoute(builder: ((context) {
                        return CityScreen();
                      })));
                      if(typedName != null)
                      {
                        var weatherData = await WeatherModel().getCityWeather(typedName);
                        updateUI(weatherData);
                      }
                    },
                    icon: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '$conditionIcon',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$message in $cityName!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
