import 'package:dartz/dartz.dart';
import 'package:wncc_portal/core/errors/failure.dart';
import 'package:wncc_portal/features/reports/export_dispatch_details.dart/data/models/export/export.dispatch.model.dart';

abstract class ExportDispatchRepo {
  Future<Either<Failure, List<Export>>> getExportDispatchDetails(
      DateTime date, int mode, int group);
}
