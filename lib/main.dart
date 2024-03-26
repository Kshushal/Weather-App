import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myweatherapp/products/product_home_screen.dart';
import 'package:myweatherapp/weather/view/weather_home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
// test comment
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        theme: ThemeData.light(),
        debugShowCheckedModeBanner: false,
        home: const Products());
  }
}
