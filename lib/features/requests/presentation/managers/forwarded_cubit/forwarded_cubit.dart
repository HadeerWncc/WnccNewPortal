import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/requests/data/models/forward_user.dart';
import 'package:wncc_portal/features/requests/domain/repos/requests_repo.dart';

part 'forwarded_state.dart';

class ForwardedCubit extends Cubit<ForwardedState> {
  ForwardedCubit(this.requestsRepo) : super(ForwardedInitial());

  final RequestsRepo requestsRepo;
  Future<void> getForwardedById(String id) async {
    emit(ForwardedILoading());
    var result = await requestsRepo.getForwardedUserById(id);
    result.fold((error) {
      emit(ForwardedFailure(error: error.msg));
    }, (forwarded) {
      emit(ForwardedSuccess(forwardedUser: forwarded));
    });
  }
}
