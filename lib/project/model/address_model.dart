import 'package:myweatherapp/project/model/geo_model.dart';

class AddressModel {
  String? street;
  String? city;
  String? zipcode;
  GeoModel? geoModel;

  AddressModel({this.street, this.city, this.zipcode, this.geoModel});

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
        street: json["street"],
        city: json["city"],
        zipcode: json["zipcode"],
        geoModel: GeoModel.fromJson(json["geo"]));
  }
}
