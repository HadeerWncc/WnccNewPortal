import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wncc_portal/core/errors/failure.dart';
import 'package:wncc_portal/features/home/data/data_sources/home_data_sources.dart';
import 'package:wncc_portal/features/home/data/models/home_summary/home_summary.dart';
import 'package:wncc_portal/features/home/domain/repos/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeDataSources homeDataSources;

  HomeRepoImpl({required this.homeDataSources});
  @override
  Future<Either<Failure, HomeSummary>> getHomeSummary(
      DateTime fromDate, DateTime toDate, String? code) async {
    try {
      HomeSummary result =
          await homeDataSources.getHomeSummary(fromDate, toDate, code);
      return Right(result);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }
}
