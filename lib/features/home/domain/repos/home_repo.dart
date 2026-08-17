import 'package:dartz/dartz.dart';
import 'package:wncc_portal/core/errors/failure.dart';
import 'package:wncc_portal/features/home/data/models/home_summary/home_summary.dart';

abstract class HomeRepo {
  Future<Either<Failure, HomeSummary>> getHomeSummary(
      DateTime fromDate, DateTime toDate, String? code);
}
