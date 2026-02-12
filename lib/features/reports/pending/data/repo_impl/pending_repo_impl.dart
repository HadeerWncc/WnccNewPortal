import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wncc_portal/core/errors/failure.dart';
import 'package:wncc_portal/features/reports/pending/data/data_sources/pending_data_source.dart';
import 'package:wncc_portal/features/reports/pending/data/models/pending_model/pending_model.dart';
import 'package:wncc_portal/features/reports/pending/domain/repos/pending_repo.dart';

class PendingRepoImpl extends PendingRepo {
  final PendingDataSource pendingDataSource;

  PendingRepoImpl({required this.pendingDataSource});
  @override
  Future<Either<Failure, List<PendingModel>>> getPendingDelivery() async {
    try {
      List<PendingModel> pendingDeliveryList =
          await pendingDataSource.getPendingDelivery();
      return Right(pendingDeliveryList);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }
}
