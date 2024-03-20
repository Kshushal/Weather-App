import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:myweatherapp/controller/weather_controller.dart';

class CurrentDataCard extends StatelessWidget {
  const CurrentDataCard({super.key});

  @override
  Widget build(BuildContext context) {
    var weatherController = Get.put(WeatherController());
    var now = DateTime.now();

    return Obx(() {
      var weatherData = weatherController.weather.value;
      if (weatherData == null) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      return Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8),
                child: Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Text(
                    'Nashik',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 160.0),
            child: Text(DateFormat().format(now)),
          ),
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.97,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    currentWeatherData(
                      title: 'Feels Like',
                      value: '${weatherData.list!.first.main!.feelsLike}°c',
                      imagePath: 'assets/wind.png',
                    ),
                    currentWeatherData(
                      title: 'Humidity',
                      value: '${weatherData.list!.first.main!.humidity}°c',
                      imagePath: 'assets/wind.png',
                    ),
                    currentWeatherData(
                      title: 'Wind',
                      value: '${weatherData.list!.first.wind!.speed} km/h',
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
      padding: const EdgeInsets.only(top: 18.0),
      child: Column(
        children: [
          Image(
            height: 40,
            image: AssetImage(imagePath),
          ),
          Text(
            title,
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
