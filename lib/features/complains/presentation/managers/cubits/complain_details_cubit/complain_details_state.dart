part of 'complain_details_cubit.dart';

sealed class ComplainDetailsState extends Equatable {
  const ComplainDetailsState();

  @override
  List<Object> get props => [];
}

final class ComplainDetailsInitial extends ComplainDetailsState {}
final class ComplainDetailsLoading extends ComplainDetailsState {}
final class ComplainDetailsFailure extends ComplainDetailsState {
  final String error;

  const ComplainDetailsFailure({required this.error});
}
final class ComplainDetailsSuccess extends ComplainDetailsState {
  final ComplainDetailsEntity complain;

  const ComplainDetailsSuccess({required this.complain});
}
