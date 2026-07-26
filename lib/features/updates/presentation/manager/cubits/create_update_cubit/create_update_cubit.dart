import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/updates/domain/repos/updates_repo.dart';

part 'create_update_state.dart';

class CreateUpdateCubit extends Cubit<CreateUpdateState> {
  CreateUpdateCubit(this.updatesRepo) : super(CreateUpdateInitial());
  final UpdatesRepo updatesRepo;

  Future<void> createUpdate(String content, List<int>? attachment) async {
    emit(CreateUpdateLoading());
    final result = await updatesRepo.createUpdate(content, attachment);
    result.fold(
      (failure) => emit(CreateUpdateFailure(errorMessage: failure.msg)),
      (isCreated) => emit(CreateUpdateSuccess(isCreated: isCreated)),
    );
  }
}
