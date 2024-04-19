import 'package:myweatherapp/project/model/address_model.dart';
import 'package:myweatherapp/project/model/company_modle.dart';

class UserModel {
  String? name;
  String? email;
  String? username;
  AddressModel? addressModel;
  CompanyModel? companyModel;

  UserModel(
      {this.name,
      this.email,
      this.username,
      this.addressModel,
      this.companyModel});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        name: json["name"],
        email: json["email"],
        username: json["username"],
        addressModel: AddressModel.fromJson(json["address"]),
        companyModel: CompanyModel.fromJson(json["company"]));
  }
}
