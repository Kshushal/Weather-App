import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:myweatherapp/weather/model/weather_model.dart';

class WeatherController extends GetxController {
  var cardSwitch = true.obs;
  void toggleSwitch() => cardSwitch.value = !cardSwitch.value;

  var weather = WeatherResponse().obs;

  void fetchWeatherData(double lat, double lon) async {
    final url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lon&units=metric&appid=faf9ce9e7548a7c827e31ef71735d687');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      try {
        weather.value = WeatherResponse.fromJson(data);
        print(weather.value.city?.name);
        ;
      } catch (e) {
        // Handle error response
        print("weather is not avaiable ${e}");
      }
    }
  }
}
