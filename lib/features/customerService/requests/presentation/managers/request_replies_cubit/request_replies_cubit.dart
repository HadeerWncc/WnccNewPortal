import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/core/models/message_dto.dart';
import 'package:wncc_portal/features/customerService/requests/domain/repos/requests_repo.dart';

part 'request_replies_state.dart';

class RequestRepliesCubit extends Cubit<RequestRepliesState> {
  RequestRepliesCubit(this.requestsRepo) : super(RequestRepliesInitial());
  final RequestsRepo requestsRepo;

  Future<void> getRequestReplies(String id) async {
    emit(RequestRepliesLoading());
    var result = await requestsRepo.getRequestRepliesById(id);
    result.fold((error) {
      emit(RequestRepliesFailure(error: error.msg));
    }, (replies) {
      emit(RequestRepliesSuccess(requestReplies: replies));
    });
  }
}
