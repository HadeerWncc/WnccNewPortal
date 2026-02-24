part of 'dispatch_details_cubit.dart';

sealed class DispatchDetailsState extends Equatable {
  const DispatchDetailsState();

  @override
  List<Object> get props => [];
}

final class DispatchDetailsInitial extends DispatchDetailsState {}
final class DispatchDetailsFailure extends DispatchDetailsState {
  final String error;

  const DispatchDetailsFailure({required this.error});
}
final class DispatchDetailsLoading extends DispatchDetailsState {}
final class DispatchDetailsSuccess extends DispatchDetailsState {
  
}
