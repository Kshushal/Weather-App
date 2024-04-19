import 'package:flutter/material.dart';

class TempHumidity extends StatelessWidget {
  final String title;
  final String imagePath;
  final String value;

  const TempHumidity(
      {super.key,
      required this.title,
      required this.imagePath,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      borderOnForeground: true,
      shadowColor: Colors.blueAccent,
      semanticContainer: true,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.8),
          border: Border.all(color: Colors.blue),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 20.0, right: 27, left: 27, bottom: 15),
          child: Column(
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all()),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Bad"),
                  Text(
                    value,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text("Good"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
