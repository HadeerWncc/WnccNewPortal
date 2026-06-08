import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wncc_portal/core/errors/failure.dart';
import 'package:wncc_portal/features/priority/summary/data/data_sources/priority_summary_data_source.dart';
import 'package:wncc_portal/features/priority/summary/data/models/summary_priority_model/summary_priority_model.dart';
import 'package:wncc_portal/features/priority/summary/domain/repositories/priority_summary_repo.dart';

class PrioritySummaryRepoImpl extends PrioritySummaryRepo {
  final PrioritySummaryDataSource prioritySummaryDataSource;

  PrioritySummaryRepoImpl({required this.prioritySummaryDataSource});
  @override
  Future<Either<Failure, List<SummaryPriorityModel>>> getPrioritySummary(
      DateTime fdate, DateTime todate) async {
    try {
      List<SummaryPriorityModel> summary =
          await prioritySummaryDataSource.getPrioritySummary(fdate, todate);
      return Right(summary);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }
}
