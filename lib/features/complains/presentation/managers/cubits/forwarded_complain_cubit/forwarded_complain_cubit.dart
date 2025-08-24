import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/complains/domain/repos/complain_repo.dart';
import 'package:wncc_portal/features/requests/data/models/forward_user.dart';

part 'forwarded_complain_state.dart';

class ForwardedComplainCubit extends Cubit<ForwardedComplainState> {
  ForwardedComplainCubit(this.compRepo) : super(ForwardedComplainInitial());

  final ComplainRepo compRepo;

  Future getForwardedUsers(String complainId) async {
    emit(ForwardedComplainLoading());
    var result = await compRepo.getForwardedUser(complainId);
    result.fold((error) {
      emit(ForwardedComplainFailure(error: error.msg));
    }, (forwardedUsers) {
      emit(ForwardedComplainSuccess(forwardUsers: forwardedUsers));
    });
  }

  Future forwardUsers({
    required String id,
    required String forwardReason,
    required List<String> forwardedUsers,
  }) async {
    emit(ForwardedComplainLoading());
    var result = await compRepo.forwardUsers(
      id: id,
      forwardReason: forwardReason,
      forwardedUsers: forwardedUsers,
    );
    result.fold((error) {
      emit(ForwardedComplainFailure(error: error.msg));
    }, (forwardedUsers) {
      emit(ForwardedComplainToUserSuccess(forwardedUser: forwardedUsers));
    });
  }
}
