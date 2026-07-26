import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/home/data/models/home/home.summary.model.dart';
import 'package:wncc_portal/features/home/domain/repos/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());
  final HomeRepo homeRepo;

  Future<void> getHomeSummary(
      DateTime fromDate, DateTime toDate, String code) async {
    emit(HomeLoading());
    final result = await homeRepo.getHomeSummary(fromDate, toDate, code);
    result.fold(
      (failure) => emit(HomeFailure(errorMessage: failure.msg)),
      (data) => emit(HomeSuccess(homeSummary: data)),
    );
  }
}
