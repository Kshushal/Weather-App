import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myweatherapp/weather/controller/weather_controller.dart';
import 'package:myweatherapp/weather/model/weather_model.dart';

class WeatherInformation extends StatelessWidget {
  final ListElement weatherInfo;
  final City cityInfo;

  const WeatherInformation(
      {Key? key, required this.weatherInfo, required this.cityInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var weatherController = Get.put(WeatherController());

    return Obx(
      () => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Jayesh Jordhar',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text('Date: ${weatherInfo.dt}'),
                Text(weatherInfo.weather![0].description!),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Temp: ${weatherInfo.main!.temp}°C'),
                Image.asset(
                  'assets/mainimg.png',
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: SizedBox(
                    height: 300,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: GridView(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, // Number of columns in the grid
                        crossAxisSpacing: 0.01, // Spacing between columns
                        mainAxisSpacing: 1.0, // Spacing between rows
                      ),
                      children: <Widget>[
                        cardWidget(
                          'Morning',
                          ' ${weatherInfo.sys!.pod!}',
                          const Icon(Icons.wb_sunny_sharp),
                        ),
                        cardWidget(
                          'Evening',
                          ' ${weatherInfo.sys!.pod!}',
                          const Icon(Icons.sunny_snowing),
                        ),
                        cardWidget(
                          'Night',
                          ' ${weatherInfo.sys!.pod!}',
                          const Icon(Icons.dark_mode),
                        ),
                        cardWidget(
                          'Clouds',
                          '${weatherInfo.clouds!.all}',
                          const Icon(Icons.cloud_sharp),
                        ),
                        cardWidget(
                          'UV Index',
                          '${weatherInfo.main!.pressure}',
                          const Icon(Icons.bolt_outlined),
                        ),
                        cardWidget(
                          'Humidity',
                          '${weatherInfo.main!.humidity}',
                          const Icon(Icons.h_mobiledata_outlined),
                        ),
                        cardWidget(
                          'Pressure',
                          '${weatherInfo.main!.pressure}',
                          const Icon(Icons.air),
                        ),
                        cardWidget(
                          'Wind / Speed',
                          '${weatherInfo.wind!.speed}km/h',
                          const Icon(Icons.air),
                        ),
                        cardWidget(
                          'Dew Point',
                          '${weatherController.weather.value.city!.sunrise}',
                          const Icon(Icons.wb_sunny_sharp),
                        ),

                        // List of widgets to display in the grid
                        // Add your widgets here
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget cardWidget(String title, String subtitle, Widget icon) {
    return Column(
      children: [
        icon,
        Text(title),
        Text(subtitle),
      ],
    );
  }
}
