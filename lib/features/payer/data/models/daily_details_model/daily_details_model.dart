import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/payer/data/models/date_details_model/date_details_model.dart';

class DailyDetailsModel extends Equatable {
  final String? id;
  final String? month;
  final List<DateDetailsModel>? details;

  const DailyDetailsModel({this.id, this.month, this.details});

  factory DailyDetailsModel.fromJson(Map<String, dynamic> json) {
    return DailyDetailsModel(
      id: json['id'] as String?,
      month: json['month'] as String?,
      details: (json['details'] as List<dynamic>?)
          ?.map((e) => DateDetailsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'month': month,
        'details': details?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [id, month, details];
}
