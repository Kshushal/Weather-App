import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myweatherapp/user/controller/user_controller.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({Key? key}) : super(key: key);

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  final userController = Get.put(UserController());
  @override
  void initState() {
    userController.getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
        centerTitle: true,
        backgroundColor: Colors.indigoAccent.shade100,
      ),
      // ignore: prefer_const_constructors
      body: Obx(() {
        if (userController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: userController.user.length,
            itemBuilder: (context, index) {
              final user = userController.user[index];
              return ListTile(
                title: Text('${user.name}'),
                subtitle: Text('${user.email}'),
                trailing: Text('Password: \$${user.password}'),
                // You can add more details here if needed
                // onTap: () {
                //   // Handle tap on product
                // },
              );
            },
          );
        }
      }),
    );
  }
}
