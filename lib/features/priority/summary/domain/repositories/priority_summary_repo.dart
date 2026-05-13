import 'package:dartz/dartz.dart';
import 'package:wncc_portal/core/errors/failure.dart';
import 'package:wncc_portal/features/priority/summary/data/models/summary_priority_model.dart';

abstract class PrioritySummaryRepo {
  Future<Either<Failure, List<SummaryPriorityModel>>> getPrioritySummary(DateTime fdate, DateTime todate);
}