part of 'request_details_cubit.dart';

sealed class RequestDetailsState extends Equatable {
  const RequestDetailsState();

  @override
  List<Object> get props => [];
}

final class RequestDetailsInitial extends RequestDetailsState {}

final class RequestDetailsLoading extends RequestDetailsState {}

final class RequestDetailsFailure extends RequestDetailsState {
  final String error;

  const RequestDetailsFailure({required this.error});
}

final class RequestChangeLogFailure extends RequestDetailsState {
  final String error;

  const RequestChangeLogFailure({required this.error});
}

final class RequestDetailsSuccess extends RequestDetailsState {
  final RequestDetailsEntity requestDetails;
  const RequestDetailsSuccess({
    required this.requestDetails,
  });
}

final class RequestChangeLogSuccess extends RequestDetailsState {
  final RequestDetailsEntity requestDetails;
  final String msg;
  const RequestChangeLogSuccess({
    required this.requestDetails,
    required this.msg,
  });
}

