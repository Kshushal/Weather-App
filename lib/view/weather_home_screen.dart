// ignore_for_file: unnecessary_null_comparison

import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myweatherapp/controller/theme_controller.dart';
import 'package:myweatherapp/controller/weather_controller.dart';
import 'package:myweatherapp/view/widgets/current_data.dart';
import 'package:myweatherapp/view/widgets/weather_forcast.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  var weatherController = Get.put(WeatherController());

  @override
  void initState() {
    super.initState();
    weatherController.fetchWeatherData(19.997454, 73.789803);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              var weatherData = weatherController.weather.value;

              if (weatherData == null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                      elevation: 2,
                      child: Container(
                          height: MediaQuery.of(context).size.height * 0.28,
                          // color: Colors.amber,
                          decoration: BoxDecoration(
                            // color: const Color.fromARGB(255, 70, 53, 53),
                            gradient: const LinearGradient(colors: [
                              Color.fromARGB(255, 83, 162, 192),
                              Color.fromARGB(255, 78, 170, 189),
                              Color.fromARGB(255, 85, 150, 211),
                              Color.fromARGB(255, 120, 171, 208)
                            ]),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.blueAccent,
                                blurRadius: 5,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          // ignore: prefer_const_constructors
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    weatherController.cardSwitch.value
                                        ? Padding(
                                            padding: const EdgeInsets.only(
                                                left: 25.0),
                                            child: Text(
                                              "Current Weather at ${weatherData.city?.name ?? "Loading.."}",
                                              style:
                                                  const TextStyle(fontSize: 15),
                                            ),
                                          )
                                        : const Padding(
                                            padding:
                                                EdgeInsets.only(left: 25.0),
                                            child: Text(
                                              "5 Days Weather Forecast",
                                              style: TextStyle(fontSize: 15),
                                            ),
                                          ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 18.0, top: 10),
                                      child: AnimatedToggleSwitch<bool>.dual(
                                        current:
                                            weatherController.cardSwitch.value,
                                        first: false,
                                        second: true,
                                        spacing: 25.0,
                                        style: const ToggleStyle(
                                          borderColor: Colors.transparent,
                                          backgroundColor: Colors.black,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color.fromARGB(
                                                  66, 24, 178, 205),
                                              spreadRadius: 1,
                                              blurRadius: 2,
                                              offset: Offset(0, 1.5),
                                            ),
                                          ],
                                        ),
                                        borderWidth: 3.0,
                                        height: 40,
                                        onChanged: (bool value) {
                                          weatherController.toggleSwitch();
                                        },
                                        styleBuilder: (b) => ToggleStyle(
                                            indicatorColor: b
                                                ? const Color.fromARGB(
                                                    255, 241, 244, 54)
                                                : const Color.fromARGB(
                                                    255, 56, 239, 62)),
                                        iconBuilder: (value) => value
                                            ? const Icon(
                                                Icons.coronavirus_rounded)
                                            : const Icon(
                                                Icons.tag_faces_rounded),
                                        textBuilder: (value) => value
                                            ? const Center(
                                                child: Text(
                                                'current',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ))
                                            : const Center(
                                                child: Text('5 Days',
                                                    style: TextStyle(
                                                        color: Colors.white))),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                weatherController.cardSwitch.value
                                    ? const CurrentDataCard()
                                    : const ForecastWeather(),
                              ]))),
                ],
              );
            }),
            SizedBox(height: 50, child: UserProfileScreen()),
          ],
        ),
      ),
    );
  }
}

//               DateFormat('hh:mm a').format(now.add(Duration(hours: index * 3))),

