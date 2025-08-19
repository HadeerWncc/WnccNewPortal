import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/requests/domain/entities/create_request_entity.dart';
import 'package:wncc_portal/features/requests/domain/repos/requests_repo.dart';

part 'create_request_state.dart';

class CreateRequestCubit extends Cubit<CreateRequestState> {
  CreateRequestCubit(this.requestsRepo) : super(CreateRequestInitial());

  final RequestsRepo requestsRepo;

  Future createNewRequest(CreateRequestEntity requestEntity) async {
    emit(CreateRequestLoading());
    var result = await requestsRepo.createNewRequest(requestEntity);
    result.fold((error) {
      emit(CreateRequestFailure(error: error.msg));
    }, (msg) {
      emit(CreateRequestSuccess(msg: msg));
    });
  }

  Future editRequest(CreateRequestEntity requestEntity) async {
    emit(CreateRequestLoading());
    var result = await requestsRepo.editRequest(requestEntity);
    result.fold((error) {
      emit(CreateRequestFailure(error: error.msg));
    }, (msg) {
      emit(CreateRequestSuccess(msg: msg));
    });
  }
}
