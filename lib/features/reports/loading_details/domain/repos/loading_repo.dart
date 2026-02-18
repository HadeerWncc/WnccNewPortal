import 'package:dartz/dartz.dart';
import 'package:wncc_portal/core/errors/failure.dart';
import 'package:wncc_portal/features/reports/loading_details/data/models/loading_details_model.dart';

abstract class LoadingRepo {
Future<Either<Failure,List<LoadingDetailsModel>>> getLoadingDetails();

}