part of 'loading_details_cubit.dart';

sealed class LoadingDetailsState extends Equatable {
  const LoadingDetailsState();

  @override
  List<Object> get props => [];
}

final class LoadingDetailsInitial extends LoadingDetailsState {}
final class LoadingDetailsFailure extends LoadingDetailsState {
  final String errorMsg;

  const LoadingDetailsFailure({required this.errorMsg});
}
final class LoadingDetailsLoading extends LoadingDetailsState {}
final class LoadingDetailsSuccess extends LoadingDetailsState {
  final List<LoadingDetailsModel> loadingDetails;

  const LoadingDetailsSuccess({required this.loadingDetails});
}
