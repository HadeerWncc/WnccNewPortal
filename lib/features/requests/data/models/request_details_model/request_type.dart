import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/requests/data/models/mappers/request_status_mapper.dart';
import 'package:wncc_portal/features/requests/domain/entities/log_entity.dart';
import 'package:wncc_portal/features/requests/domain/entities/request_type_entity.dart';

import 'log.dart';

class RequestType extends Equatable {
  final String? id;
  final String? name;
  final int? status;
  final List<Log>? logs;

  const RequestType({this.id, this.name, this.status, this.logs});

  factory RequestType.fromJson(Map<String, dynamic> json) => RequestType(
        id: json['id'] as String?,
        name: json['name'] as String?,
        status: json['status'] as int?,
        logs: (json['logs'] as List<dynamic>?)
            ?.map((e) => Log.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'status': status,
        'logs': logs?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [id, name, status, logs];

  RequestTypeEntity toEntity() {
    List<LogEntity> logsEntity = [];
    for (var log in logs!) {
      logsEntity.add(log.toEntity());
    }
    return RequestTypeEntity(
      id: id ?? "",
      name: name ?? "",
      status: mapStatusFromInt(status!),
      logs: logsEntity,
    );
  }
}
