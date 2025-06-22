part of 'dispatch_delivery_order_cubit.dart';

sealed class DispatchDeliveryOrderState extends Equatable {
  const DispatchDeliveryOrderState();

  @override
  List<Object> get props => [];
}

final class DispatchDeliveryOrderInitial extends DispatchDeliveryOrderState {}

final class DispatchDeliveryOrderLoading extends DispatchDeliveryOrderState {}

final class DispatchDeliveryOrderFailure extends DispatchDeliveryOrderState {
  final String error;

  const DispatchDeliveryOrderFailure({required this.error});
}

final class DispatchDeliveryOrderSuccess extends DispatchDeliveryOrderState {
  final String msg;

  const DispatchDeliveryOrderSuccess({required this.msg});
}
