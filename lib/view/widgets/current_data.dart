// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:myweatherapp/controller/weather_controller.dart';

class CurrentDataCard extends StatelessWidget {
  const CurrentDataCard({Key? key});

  @override
  Widget build(BuildContext context) {
    var weatherController = Get.put(WeatherController());
    var now = DateTime.now();

    return Obx(() {
      var weatherData = weatherController.weather.value;
      var finalWeather = weatherData.list?.first;
      if (finalWeather == null ||
          finalWeather.main == null ||
          finalWeather.wind == null) {
        return const Center(
          child: Text(
            'Loading.......',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        );
      }
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    weatherData.city?.name ?? '',
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 145.0),
            child: Text(DateFormat().format(now)),
          ),
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.95,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    currentWeatherData(
                      title: 'Feels Like',
                      value: '${finalWeather.main!.feelsLike}°c',
                      imagePath: 'assets/wind.png',
                    ),
                    currentWeatherData(
                      title: 'Humidity',
                      value: '${finalWeather.main!.humidity}°c',
                      imagePath: 'assets/wind.png',
                    ),
                    currentWeatherData(
                      title: 'Wind',
                      value: '${finalWeather.wind!.speed} km/h',
                      imagePath: 'assets/wind.png',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      );
    });
  }

  Widget currentWeatherData({
    required String title,
    required String value,
    required String imagePath,
  }) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          Image(
            height: 40,
            image: AssetImage(imagePath),
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 14, color: Colors.black),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 14, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
