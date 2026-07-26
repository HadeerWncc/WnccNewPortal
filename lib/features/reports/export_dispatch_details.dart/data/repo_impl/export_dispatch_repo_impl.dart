import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wncc_portal/core/errors/failure.dart';
import 'package:wncc_portal/features/reports/export_dispatch_details.dart/data/data_sources/export_dispatch_details_data_source.dart';
import 'package:wncc_portal/features/reports/export_dispatch_details.dart/data/models/export/export.dispatch.model.dart';
import 'package:wncc_portal/features/reports/export_dispatch_details.dart/domain/repo/export_dispatch_repo.dart';

class ExportDispatchRepoImpl extends ExportDispatchRepo {
  final ExportDispatchDetailsDataSource exportDataSource;

  ExportDispatchRepoImpl({required this.exportDataSource});
  @override
  Future<Either<Failure, List<Export>>> getExportDispatchDetails(
      DateTime date, int mode, int group) async {
    try {
      List<Export> exportDispatch =
          await exportDataSource.getExportDispatchDetails(date, mode, group);
      return Right(exportDispatch);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }
}
