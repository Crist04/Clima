import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const String kApiKey = 'e2455b3cba20b5c4de92d8d6a279bd91';

const String kUrl = 'https://api.openweathermap.org/data/2.5/weather';

const kTextFieldInputDecoration = InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Enter City Name',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide.none),
                      icon: Icon(
                        Icons.location_city,
                        color: Colors.white,
                      ));
