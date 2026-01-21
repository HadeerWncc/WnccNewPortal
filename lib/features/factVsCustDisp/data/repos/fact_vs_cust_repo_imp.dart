import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wncc_portal/core/errors/failure.dart';
import 'package:wncc_portal/features/factVsCustDisp/data/data_sources/fact_vs_cust_data_source.dart';
import 'package:wncc_portal/features/factVsCustDisp/data/models/fact_vs_cust_compare_model/Fact_vs_cust_disp_compare.dart';
import 'package:wncc_portal/features/factVsCustDisp/data/models/fact_vs_cust_disp_model/fact_vs_cust_disp_model.dart';
import 'package:wncc_portal/features/factVsCustDisp/domain/repos/fact_vs_cust_repo.dart';

class Factvscustrepoimp extends FactVsCustRepo {
  final FactVsCustDatasourse factVsCustDatasourse;

  Factvscustrepoimp({required this.factVsCustDatasourse});
  @override
  Future<Either<Failure, List<FactVsCustDispModel>>> getFactVsCustDisp(
      int mode, DateTime date) async {
    try {
      List<FactVsCustDispModel> factVsCustList =
          await factVsCustDatasourse.getFactVsCustDisp(mode, date);
      return Right(factVsCustList);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<FactVsCustDispCompare>>> getFactVsCustDispCompare(DateTime date) {
    // TODO: implement getFactVsCustDispCompare
    throw UnimplementedError();
  }
}
