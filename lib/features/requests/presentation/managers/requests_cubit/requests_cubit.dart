import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/requests/domain/entities/request_entity.dart';
import 'package:wncc_portal/features/requests/domain/repos/requests_repo.dart';

part 'requests_state.dart';

class RequestsCubit extends Cubit<RequestsState> {
  RequestsCubit(this.requestsRepo) : super(RequestsInitial());
  final RequestsRepo requestsRepo;
  Future<void> getAllRequests() async {
    emit(RequestsLoading());
    var result = await requestsRepo.getAllRequests();
    result.fold((failure) {
      emit(RequestsFailure(error: failure.msg));
    }, (requests) {
      emit(RequestsSuccess(requests: requests));
    });
  }
}
