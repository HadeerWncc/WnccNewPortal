import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/requests/data/models/forward_user.dart';
import 'package:wncc_portal/features/requests/domain/repos/requests_repo.dart';

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


  
}
