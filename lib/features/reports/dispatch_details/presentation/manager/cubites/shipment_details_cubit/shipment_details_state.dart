part of 'shipment_details_cubit.dart';

sealed class ShipmentDetailsState extends Equatable {
  const ShipmentDetailsState();

  @override
  List<Object> get props => [];
}

final class ShipmentDetailsInitial extends ShipmentDetailsState {}

final class ShipmentDetailsFailure extends ShipmentDetailsState {
  final String error;

  const ShipmentDetailsFailure({required this.error});
}

final class ShipmentDetailsLoading extends ShipmentDetailsState {}

final class ShipmentDetailsSuccess extends ShipmentDetailsState {}
