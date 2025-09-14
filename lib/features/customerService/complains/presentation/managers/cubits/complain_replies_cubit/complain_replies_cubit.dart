import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/core/models/message_dto.dart';
import 'package:wncc_portal/features/customerService/complains/domain/repos/complain_repo.dart';

part 'complain_replies_state.dart';

class ComplainRepliesCubit extends Cubit<ComplainRepliesState> {
  ComplainRepliesCubit(this.complainRepo) : super(ComplainRepliesInitial());

  final ComplainRepo complainRepo;

  Future getComplainReplies(String complainId) async {
    emit(ComplainRepliesLoading());
    var result = await complainRepo.getComplaintReplies(complainId);
    result.fold((error) {
      emit(ComplainRepliesFailure(error: error.msg));
    }, (messages) {
      emit(ComplainRepliesSuccess(messages: messages));
    });
  }
}
