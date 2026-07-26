import 'package:dartz/dartz.dart';
import 'package:wncc_portal/core/errors/failure.dart';
import 'package:wncc_portal/features/home/data/models/home/home.summary.model.dart';

abstract class HomeRepo {
  Future<Either<Failure, Home>> getHomeSummary(DateTime fromDate, DateTime toDate, String code);
}