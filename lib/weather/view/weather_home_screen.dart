// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors

import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myweatherapp/project/controller/project_controller.dart';
import 'package:myweatherapp/weather/controller/theme_controller.dart';
import 'package:myweatherapp/weather/controller/weather_controller.dart';
import 'package:myweatherapp/weather/view/widgets/current_data.dart';
import 'package:myweatherapp/weather/view/widgets/weather_forcast.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  var weatherController = Get.put(WeatherController());
  var projectController = Get.put(ProjectController());
  @override
  void initState() {
    super.initState();
    weatherController.fetchWeatherData(19.9975, 73.7898);
    projectController.fetchAllUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "MY APP",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() {
            var user = projectController.users;
            if (user.isEmpty) {
              return const CircularProgressIndicator();
            } else {
              return ListView.builder(
                itemCount: user.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text("${user[index].name}"),
                    title: Column(
                      children: [
                        Text("${user[index].email}"),
                        Image(image: NetworkImage("${user[index].username}")),
                      ],
                    ),
                    trailing: Text("${user[index].addressModel!.city}"),
                  );
                },
              );
            }
          }),
          ElevatedButton(
              onPressed: () {
                projectController.fetchAllUser();
              },
              child: Text("ddd")),
          Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 5,
            margin: EdgeInsets.all(10),
          ),
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
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Card(
                      elevation: 2,
                      child: Container(
                          height: MediaQuery.of(context).size.height * 0.28,
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
                                                left: 13.0),
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
                                          right: 8.0, top: 10),
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
                ),
              ],
            );
          }),
          SizedBox(height: 50, child: UserProfileScreen()),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: OutlinedButton(
                onPressed: () {}, child: const Text("Show Data")),
          ),
        ],
      ),
    );
  }
}

//               DateFormat('hh:mm a').format(now.add(Duration(hours: index * 3))),

