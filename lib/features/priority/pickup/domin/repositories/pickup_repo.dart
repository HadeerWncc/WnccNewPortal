import 'package:dartz/dartz.dart';
import 'package:wncc_portal/core/errors/failure.dart';
import 'package:wncc_portal/features/priority/comm/entities/get_summary_entity.dart';
import 'package:wncc_portal/features/priority/comm/models/priority_summary_model.dart';
import 'package:wncc_portal/features/priority/pickup/data/models/pickup_model/pickup_model.dart';
import 'package:wncc_portal/features/priority/pickup/domin/entities/make_pickupility_entity.dart';

abstract class PickupRepo {
  Future<Either<Failure, List<PickupModel>>> getPickUpPriority(DateTime date);
  Future<Either<Failure, String>> makePickupility(
      MakePickupilityEntity makePickupility);
  Future<Either<Failure, PrioritySummaryModel>> getPickupSummary(
      GetSummaryEntity getpicSummaryEntity);
}
