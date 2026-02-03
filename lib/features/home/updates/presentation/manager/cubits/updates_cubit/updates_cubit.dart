import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/home/updates/data/models/updates_model/updates_model.dart';
import 'package:wncc_portal/features/home/updates/domain/repos/updates_repo.dart';

part 'updates_state.dart';

class UpdatesCubit extends Cubit<UpdatesState> {
  UpdatesCubit(this.updatesRepo) : super(UpdatesInitial());

  final UpdatesRepo updatesRepo;

  Future<void> fetchAllUpdates() async {
    emit(UpdatesLoading());
    final result = await updatesRepo.getAllUpdates();
    result.fold(
      (failure) => emit(UpdatesFailure(errorMessage: failure.msg)),
      (updates) => emit(UpdatesSuccess(updates: updates)),
    );
  }
}
