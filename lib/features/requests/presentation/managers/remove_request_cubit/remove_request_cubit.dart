import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/requests/domain/repos/requests_repo.dart';

part 'remove_request_state.dart';

class RemoveRequestCubit extends Cubit<RemoveRequestState> {
  RemoveRequestCubit(this.requestsRepo) : super(RemoveRequestInitial());

  final RequestsRepo requestsRepo;

  Future removeRequest(String id) async {
    emit(RemoveRequestLoading());
    var result = await requestsRepo.removeRequest(id);
    result.fold((failure) {
      emit(RemoveRequestFailure(error: failure.msg));
    }, (msg) {
      emit(RemoveRequestSuccess(msg: msg));
    });
  }
}
