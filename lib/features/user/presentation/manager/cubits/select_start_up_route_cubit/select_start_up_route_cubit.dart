import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/user/domain/repositories/user_repo.dart';

part 'select_start_up_route_state.dart';

class SelectStartUpRouteCubit extends Cubit<SelectStartUpRouteState> {
  SelectStartUpRouteCubit(this.userRepo) : super(SelectStartUpRouteInitial());

  final UserRepo userRepo;

  Future<void> selectStartUpRoute(String id, String routeName) async {
    emit(SelectStartUpRouteLoading());
    final result = await userRepo.selectStartUpRoute(id, routeName);
    result.fold(
      (failure) {
        emit(SelectStartUpRouteFailure(errorMessage: failure.msg));
      },
      (status) {
        emit(SelectStartUpRouteSuccess(status: status));
      },
    );
  }
}
