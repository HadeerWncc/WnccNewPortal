import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/core/models/user_model.dart';
import 'package:wncc_portal/features/user/domain/entities/profile_entity.dart';
import 'package:wncc_portal/features/user/domain/usecases/update_profile_use_case.dart';

part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit(this.updateProfileUseCase) : super(UpdateProfileInitial());

  final UpdateProfileUseCase updateProfileUseCase;
  Future<void> updateProfile(ProfileEntity profileEntity) async {
    emit(UpdateProfileLoading());
    var result = await updateProfileUseCase.call(profileEntity);
    result.fold((error) {
      emit(UpdateProfileFailure(error: error.msg));
    }, (user) {
      emit(UpdateProfileSuccess(user: user));
    });
  }
}
