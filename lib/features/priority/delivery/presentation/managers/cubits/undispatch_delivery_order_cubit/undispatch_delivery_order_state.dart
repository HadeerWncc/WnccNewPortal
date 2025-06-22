part of 'undispatch_delivery_order_cubit.dart';

sealed class UndispatchDeliveryOrderState extends Equatable {
  const UndispatchDeliveryOrderState();

  @override
  List<Object> get props => [];
}

final class UndispatchDeliveryOrderInitial
    extends UndispatchDeliveryOrderState {}

final class UndispatchDeliveryOrderLoading
    extends UndispatchDeliveryOrderState {}

final class UndispatchDeliveryOrderFailure
    extends UndispatchDeliveryOrderState {
  final String error;

  const UndispatchDeliveryOrderFailure({required this.error});
}

final class UndispatchDeliveryOrderSuccess
    extends UndispatchDeliveryOrderState {
  final String msg;

  const UndispatchDeliveryOrderSuccess({required this.msg});
}
