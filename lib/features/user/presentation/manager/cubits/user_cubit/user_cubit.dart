import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/core/models/user_model.dart';
import 'package:wncc_portal/core/repos/base_repos.dart';
import 'package:wncc_portal/features/user/domain/usecases/get_current_user_use_case.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.getCurrentUserUseCase, this.baseRepos) : super(UserInitial());
  final GetCurrentUserUseCase getCurrentUserUseCase;
  final BaseRepos baseRepos;
  Future<void> getCurrentUser() async {
    emit(UserLoading());
    var result = await getCurrentUserUseCase.call();
    result.fold(
      (error) {
        emit(UserFailure(error: error.msg));
      },
      (user) async {
        List<String> states = await baseRepos.getStates();
        String stateId = await baseRepos.getStatesId(user.government!);
        List<String> cities = await baseRepos.getCities(stateId);
        emit(
          UserSuccess(
            user: user,
            states: states,
            cities: cities,
          ),
        );
      },
    );
  }
}
