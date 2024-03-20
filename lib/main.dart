import 'package:flutter/material.dart';
import 'package:myweatherapp/view/weather_home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
// test comment
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: WeatherPage());
  }
}
