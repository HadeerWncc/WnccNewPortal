import 'package:dartz/dartz.dart';
import 'package:wncc_portal/core/errors/failure.dart';
import 'package:wncc_portal/features/reports/pending/data/models/pending_model/pending_model.dart';

abstract class PendingRepo {
  Future<Either<Failure, List<PendingModel>>> getPendingDelivery();
}
