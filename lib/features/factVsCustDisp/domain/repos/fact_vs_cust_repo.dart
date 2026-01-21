import 'package:dartz/dartz.dart';
import 'package:wncc_portal/core/errors/failure.dart';
import 'package:wncc_portal/features/factVsCustDisp/data/models/fact_vs_cust_compare_model/Fact_vs_cust_disp_compare.dart';
import 'package:wncc_portal/features/factVsCustDisp/data/models/fact_vs_cust_disp_model/fact_vs_cust_disp_model.dart';

abstract class FactVsCustRepo {
  Future<Either<Failure, List<FactVsCustDispModel>>> getFactVsCustDisp(int mode, DateTime date);
  Future<Either<Failure, List<FactVsCustDispCompare>>> getFactVsCustDispCompare(DateTime date);
  
}
