import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/requests/domain/entities/request_details_entity.dart';
import 'package:wncc_portal/features/requests/domain/repos/requests_repo.dart';

part 'request_details_state.dart';

class RequestDetailsCubit extends Cubit<RequestDetailsState> {
  RequestDetailsCubit(this.requestsRepo) : super(RequestDetailsInitial());
  final RequestsRepo requestsRepo;
  Future<void> getRequestById(String id) async {
    emit(RequestDetailsLoading());
    var result = await requestsRepo.getRequestById(id);
    result.fold((error) {
      emit(RequestDetailsFailure(error: error.msg));
    }, (request) {
      emit(RequestDetailsSuccess(requestDetails: request));
    });
  }



  Future openRequest(String id)async {
    emit(RequestDetailsLoading());
    var result = await requestsRepo.openRequest(id);
    result.fold((error) {
      emit(RequestDetailsFailure(error: error.msg));
    }, (request) {
      emit(RequestDetailsSuccess(requestDetails: request));
    });
  }
}
