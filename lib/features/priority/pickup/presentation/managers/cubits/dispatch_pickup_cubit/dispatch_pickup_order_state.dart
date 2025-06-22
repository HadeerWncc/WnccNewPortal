part of 'dispatch_pickup_order_cubit.dart';

sealed class DispatchPickupOrderState extends Equatable {
  const DispatchPickupOrderState();

  @override
  List<Object> get props => [];
}

final class DispatchPickupOrderInitial extends DispatchPickupOrderState {}
final class DispatchPickupOrderLoading extends DispatchPickupOrderState {}
final class DispatchPickupOrderFaliure extends DispatchPickupOrderState {
  final String error;

  const DispatchPickupOrderFaliure({required this.error});

}
final class DispatchPickupOrderSuccess extends DispatchPickupOrderState {
  final String message;

  const DispatchPickupOrderSuccess({required this.message});
}
