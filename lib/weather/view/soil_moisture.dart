// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MoistureWidget extends StatelessWidget {
  final String title;
  final String imagePath;
  final String moisturePercentage;

  MoistureWidget({
    Key? key,
    required this.title,
    required this.imagePath,
    required this.moisturePercentage,
  }) : super(key: key);

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
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                moisturePercentage,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
