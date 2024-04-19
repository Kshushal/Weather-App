import 'package:get/get.dart';
import 'package:myweatherapp/data/api_endpoint.dart';
import 'package:myweatherapp/data/network_api.dart';
import 'package:myweatherapp/project/model/user_model.dart';

class ProjectController extends GetxController {
  var isLoading = true.obs;
  var users = <UserModel>[].obs;

  Future<void> fetchAllUser() async {
    try {
      isLoading(true); // Activate loading state
      var netservice = NetworkApiServices();
      final response = await netservice.getApi(AppUrl.projectUrl);
      List<UserModel> users =
          (response as List).map((item) => UserModel.fromJson(item)).toList();

      // print(users[1].name);
      // print(usermodel[2].companyModel);
    } catch (e) {
      // Handle errors
      print("Error fetching users: $e");
    } finally {
      isLoading(false);
    }
  }
}
