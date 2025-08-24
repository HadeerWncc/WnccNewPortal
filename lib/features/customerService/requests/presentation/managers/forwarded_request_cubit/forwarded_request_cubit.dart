import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/customerService/requests/data/models/forward_user.dart';
import 'package:wncc_portal/features/customerService/requests/domain/repos/requests_repo.dart';

part 'forwarded_request_state.dart';

class ForwardedRequestCubit extends Cubit<ForwardedRequestState> {
  ForwardedRequestCubit(this.requestsRepo) : super(ForwardedRequestInitial());

  final RequestsRepo requestsRepo;
  Future<void> getForwardedById(String id) async {
    emit(ForwardedRequestLoading());
    var result = await requestsRepo.getForwardedUserById(id);
    result.fold((error) {
      emit(ForwardedRequestFailure(error: error.msg));
    }, (forwarded) {
      emit(ForwardedRequestSuccess(forwardedUser: forwarded));
    });
  }

  Future forwardUsers({
    required String id,
    required String forwardReason,
    required List<String> forwardedUsers,
  }) async {
    emit(ForwardedRequestLoading());
    var result = await requestsRepo.forwardToUsers(
      id: id,
      forwardReason: forwardReason,
      forwardedUsers: forwardedUsers,
    );
    result.fold((error) {
      emit(ForwardedRequestFailure(error: error.msg));
    }, (forwardUsers) {
      emit(ForwardedRequestToUserSuccess(forwardedUser: forwardUsers));
    });
  }
}
