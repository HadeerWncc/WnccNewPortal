class StateModel {
  final String? id;
  final String? state;

  StateModel({this.id, this.state});

  factory StateModel.fromJson(Map<String, dynamic> json) => StateModel(
      id: json['id'] as String?, state: json['governorate_name_en'] as String?);
}
