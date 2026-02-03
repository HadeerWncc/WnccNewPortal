import 'package:dartz/dartz.dart';
import 'package:wncc_portal/core/errors/failure.dart';
import 'package:wncc_portal/features/home/updates/data/models/updates_model/updates_model.dart';

abstract class UpdatesRepo {
  Future<Either<Failure, List<UpdatesModel>>> getAllUpdates();
  Future<Either<Failure, bool>> createUpdate(
      String content, List<int>? attachment);
}
