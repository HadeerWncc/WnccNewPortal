import 'package:dartz/dartz.dart';
import 'package:wncc_portal/core/errors/failure.dart';

abstract class UseCase<Type, Param> {
  //Generic use case
  Future<Either<Failure, Type>> call([Param param]); //optional
}
