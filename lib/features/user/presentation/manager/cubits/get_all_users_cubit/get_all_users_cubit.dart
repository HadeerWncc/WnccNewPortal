import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/core/models/user_model.dart';
import 'package:wncc_portal/features/user/domain/repositories/user_repo.dart';

part 'get_all_users_state.dart';

class GetAllUsersCubit extends Cubit<GetAllUsersState> {
  GetAllUsersCubit(this.userRepo) : super(GetAllUsersInitial());

  final UserRepo userRepo;

  Future getAllUsers() async {
    emit(GetAllUsersLoading());
    var result = await userRepo.getAllUsers();
    result.fold((error) {
      emit(GetAllUsersFailure(error: error.msg));
    }, (users) {
      emit(GetAllUsersSuccess(users: users));
    });
  }
}
