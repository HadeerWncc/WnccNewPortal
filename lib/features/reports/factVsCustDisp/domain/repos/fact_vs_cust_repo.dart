import 'package:dartz/dartz.dart';
import 'package:wncc_portal/core/errors/failure.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/data/models/compare_model/compare_model.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/data/models/fact_vs_cust_disp_model/fact_vs_cust_disp_model.dart';

abstract class FactVsCustRepo {
  Future<Either<Failure, List<FactVsCustDispModel>>> getFactVsCustDisp(
      int mode, DateTime date);
  Future<Either<Failure, CompareModel>> getFactVsCustDispCompare(
      DateTime selectedDate, DateTime compareDate);
}
