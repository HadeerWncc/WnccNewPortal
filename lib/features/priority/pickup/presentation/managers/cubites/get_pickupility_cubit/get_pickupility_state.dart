part of 'get_pickupility_cubit.dart';

sealed class GetPickupilityState extends Equatable {
  const GetPickupilityState();

  @override
  List<Object> get props => [];
}

final class GetPickupilityInitial extends GetPickupilityState {}

final class GetPickupilityLoading extends GetPickupilityState {}

final class GetPickupilitySuccess extends GetPickupilityState {
  final List<PickupModel> pickupList;

  const GetPickupilitySuccess({required this.pickupList});
}

final class GetPickupilityFailure extends GetPickupilityState {
  final String errorMsg;

  const GetPickupilityFailure({required this.errorMsg});
}
