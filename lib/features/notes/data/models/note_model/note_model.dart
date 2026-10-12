import 'package:equatable/equatable.dart';

import 'datum.dart';

class NoteModel extends Equatable {
  final int? total;
  final List<Datum>? data;

  const NoteModel({this.total, this.data});

  factory NoteModel.fromJson(Map<String, dynamic> json) => NoteModel(
        total: json['total'] as int?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'total': total,
        'data': data?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [total, data];
}
