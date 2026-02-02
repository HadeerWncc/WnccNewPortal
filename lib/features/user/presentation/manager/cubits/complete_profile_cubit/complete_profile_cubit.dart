import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/core/models/user_model.dart';
import 'package:wncc_portal/features/user/domain/repositories/user_repo.dart';
import 'package:wncc_portal/features/user/domain/usecases/complete_profile_use_case.dart';

part 'complete_profile_state.dart';

class CompleteProfileCubit extends Cubit<CompleteProfileState> {
  // final UserUseCases userUseCases;
  final UserRepo userRepo;
  CompleteProfileCubit(this.userRepo) : super(CompleteProfileInitial());

  Future<void> completeProfile(String startupRoute) async {
    emit(CompleteProfileLoading());
    var result = await userRepo.completeProfile(startupRoute);
    result.fold((error) {
      emit(CompleteProfileFailure(error.msg));
    }, (user) {
      emit(CompleteProfileSuccess(user));
    });
  }
}
