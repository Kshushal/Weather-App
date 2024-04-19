import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:myweatherapp/weather/controller/weather_controller.dart';
import 'package:myweatherapp/weather/view/widgets/daily_forcast.dart';
import 'package:myweatherapp/weather/view/widgets/seleted_weather_data.dart';

class ForecastWeather extends StatelessWidget {
  const ForecastWeather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var weatherController = Get.put(WeatherController());
    var weather = weatherController.weather.value;
    var finalWeather = weather.list?.first;
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
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          weather.list!.length,
          (index) {
            var dt = weather.list![index].dt;
            var d12 = DateFormat('\t\t\t\t\tE\nhh:mm a').format(dt!);

            return Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: DailyForecast(
                context,
                d12,
                '${weather.list![index].main!.temp}°C',
                onTap: () {
                  // Show detailed information for the selected day
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor:
                            const Color.fromARGB(255, 22, 105, 220),
                        insetPadding: EdgeInsets.zero,
                        contentPadding: EdgeInsets.zero,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        scrollable: true,
                        content: WeatherInformation(
                          weatherInfo: weather.list![index],
                          cityInfo: weather.city!,
                        ),
                      );
                    },
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
