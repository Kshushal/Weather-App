class CompanyModel {
  String? name;
  String? catchPhrase;

  CompanyModel({this.name, this.catchPhrase});

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(name: json["name"], catchPhrase: json["catchPhrase"]);
  }
}
