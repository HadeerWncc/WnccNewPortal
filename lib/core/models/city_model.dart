class CityModel {
  final String? id;
  final String? stateId;
  final String? city;

  CityModel({required this.id, required this.stateId, required this.city});

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
        id: json['id'],
        stateId: json['governorate_id'],
        city: json['city_name_en'],
      );
}
