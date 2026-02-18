import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wncc_portal/core/errors/failure.dart';
import 'package:wncc_portal/features/reports/loading_details/data/data_sources/loading_data_sourse.dart';
import 'package:wncc_portal/features/reports/loading_details/data/models/loading_details_model.dart';
import 'package:wncc_portal/features/reports/loading_details/domain/repos/loading_repo.dart';

class LoadingRepoImpl extends LoadingRepo {
  final LoadingDetailsDataSourse loadingDetailsDataSourse;

  LoadingRepoImpl({required this.loadingDetailsDataSourse});
  @override
  Future<Either<Failure, List<LoadingDetailsModel>>> getLoadingDetails() async {
    try {
      List<LoadingDetailsModel> loadingDetailsList =
          await loadingDetailsDataSourse.getLoadingDetails();
      return Right(loadingDetailsList);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }
}
