import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/requests/domain/repos/requests_repo.dart';

part 'close_request_state.dart';

class CloseRequestCubit extends Cubit<CloseRequestState> {
  CloseRequestCubit(this.requestsRepo) : super(CloseRequestInitial());

  final RequestsRepo requestsRepo;

  Future closeRequest(String id, String commentResult) async {
    emit(CloseRequestLoading());
    var result = await requestsRepo.closeRequest(id, commentResult);
    result.fold((error) {
      emit(CloseRequestFailure(error: error.msg));
    }, (request) {
      emit(const CloseRequestSuccess(msg: 'Request Closed Successfully'));
    });
  }
}
