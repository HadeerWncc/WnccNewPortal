import 'package:dartz/dartz.dart';
import 'package:wncc_portal/core/errors/failure.dart';
import 'package:wncc_portal/core/models/message_dto.dart';
import 'package:wncc_portal/features/complains/domain/entities/complain_details_entity.dart';
import 'package:wncc_portal/features/complains/domain/entities/complain_entity.dart';
import 'package:wncc_portal/features/complains/domain/entities/create_complain_entity.dart';
import 'package:wncc_portal/features/requests/data/models/forward_user.dart';

abstract class ComplainRepo {
  Future<Either<Failure, List<ComplainEntity>>> getAllComplains();
  Future<Either<Failure, String>> createNewComplain(
      CreateComplainEntity createComplainEntity);
  Future<Either<Failure, String>> editComplain(
      CreateComplainEntity createComplainEntity);
  Future<Either<Failure, String>> deleteComplain(String complainId);
  Future<Either<Failure, ComplainDetailsEntity>> getComplainById(
      String complainId);
  Future<Either<Failure, ComplainDetailsEntity>> openComplain(
      String complainId); //pending
  Future<Either<Failure, List<ForwardUser>>> getForwardedUser(
      String complainId);
  Future<Either<Failure, List<MessageDto>>> getComplaintReplies(
      String complainId);
  Future<Either<Failure, List<ForwardUser>>> forwardUsers({
    required String id,
    required String forwardReason,
    required List<String> forwardedUsers,
  });
}
