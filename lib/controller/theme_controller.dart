// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfileScreen extends StatelessWidget {
  UserProfileScreen({Key? key}) : super(key: key);

  List<String> list = ['Light', 'Dark'];

  @override
  Widget build(BuildContext context) {
    final themeController = Get.put(ProfileController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Obx(
          () => Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListTile(
                    leading: const Icon(Icons.discount),
                    title: DropdownButton<String>(
                      value: themeController.selectedTheme.value,
                      underline: const SizedBox(),
                      iconSize: 55,
                      isExpanded: true,
                      icon: const Icon(Icons.arrow_drop_down_rounded),
                      elevation: 50,
                      iconDisabledColor: Colors.blue,
                      iconEnabledColor: Colors.blue,
                      onChanged: (String? value) {
                        themeController.changeTheme(value);
                      },
                      items: list.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileController extends GetxController {
  RxString selectedTheme = 'Light'.obs;

  void changeTheme(String? value) {
    selectedTheme.value = value!;
    if (value == 'Dark') {
      Get.changeTheme(ThemeData.dark());
    } else {
      Get.changeTheme(ThemeData.light());
    }
    update();
  }
}
