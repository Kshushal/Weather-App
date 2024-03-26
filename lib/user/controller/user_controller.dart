import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:myweatherapp/data/api_endpoint.dart';
import 'package:myweatherapp/data/network_api.dart';
import 'package:myweatherapp/user/model/user_model.dart';

class UserController extends GetxController {
  RxList<UserData> user = <UserData>[].obs;
  var isLoading = true.obs;
  Future<void> getProducts() async {
    try {
      isLoading(true);
      var netservice = NetworkApiServices();
      final res = await netservice.getApi(AppUrl.usersUrl);
      // print(res);
      // user.assignAll(res);
      // print("ttttttttttttttttt");
      // print(user);
      List<UserData> userDataList = List<UserData>.from(
        res.map((item) => UserData.fromJson(item)),
      );
      // Assign the list of UserData to user
      user.assignAll(userDataList);
    } catch (e) {
      if (kDebugMode) {
        print("Error in getting products data: $e");
      }
    } finally {
      isLoading(false);
    }
  }
}
