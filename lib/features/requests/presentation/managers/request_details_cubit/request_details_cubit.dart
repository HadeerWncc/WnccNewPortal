import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/requests/domain/entities/change_request_log_entity.dart';
import 'package:wncc_portal/features/requests/domain/entities/request_details_entity.dart';
import 'package:wncc_portal/features/requests/domain/repos/requests_repo.dart';

part 'request_details_state.dart';

class RequestDetailsCubit extends Cubit<RequestDetailsState> {
  RequestDetailsCubit(this.requestsRepo) : super(RequestDetailsInitial());
  final RequestsRepo requestsRepo;
  // Future<void> getRequestById(String id) async {
  //   emit(RequestDetailsLoading());
  //   var result = await requestsRepo.getRequestById(id);
  //   result.fold((error) {
  //     emit(RequestDetailsFailure(error: error.msg));
  //   }, (request) {
  //     emit(RequestDetailsSuccess(requestDetails: request));
  //   });
  // }

  Future openRequest(String id) async {
    emit(RequestDetailsLoading());
    var result = await requestsRepo.openRequest(id);
    result.fold((error) {
      emit(RequestDetailsFailure(error: error.msg));
    }, (request) {
      emit(RequestDetailsSuccess(requestDetails: request));
    });
  }

  Future changeLogRequest(ChangeRequestLogEntity changeLogRequest) async {
    emit(RequestDetailsLoading());
    var result = await requestsRepo.changeRequestLog(changeLogRequest);
    result.fold((error) {
      emit(RequestChangeLogFailure(error: error.msg));
    }, (request) {
      msgPendingOnStatus(changeLogRequest.status, request);
    });
  }

  void msgPendingOnStatus(int status, RequestDetailsEntity request) {
    switch (status) {
      case 2:
        emit(RequestChangeLogSuccess(
            requestDetails: request, msg: 'Request Forwarded Successfully'));
      case 3:
        emit(RequestChangeLogSuccess(
            requestDetails: request, msg: 'Request FollowUp Successfully'));
      case 4:
        emit(RequestChangeLogSuccess(
            requestDetails: request, msg: 'Request Resolved Successfully'));
      case 5:
        emit(RequestChangeLogSuccess(
            requestDetails: request, msg: 'Request Rejected Successfully'));
      case 6:
        emit(RequestChangeLogSuccess(
            requestDetails: request, msg: 'Request Cancelled Successfully'));
      case 7:
        emit(RequestChangeLogSuccess(
            requestDetails: request, msg: 'Request Approved Successfully'));
      case 8:
        emit(RequestChangeLogSuccess(
            requestDetails: request, msg: 'Request Completed Successfully'));
      case 9:
        emit(RequestChangeLogSuccess(
            requestDetails: request, msg: 'Request Overdue Successfully'));
    }
  }
}
