import 'package:flutter/material.dart';

class DailyForecast extends StatelessWidget {
  final BuildContext context;
  final String title;
  final String subtitle;
  final Function()? onTap;

  const DailyForecast(this.context, this.title, this.subtitle,
      {super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.20,
        width: MediaQuery.of(context).size.width * 0.18,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 143, 173, 225),
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: const Color.fromARGB(255, 2, 25, 90)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Image.asset(
                'assets/moon.png',
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.width * 0.2,
              ),
              Text(
                subtitle,
                style: const TextStyle(fontSize: 14, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
