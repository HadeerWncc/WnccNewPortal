part of 'fact_vs_cust_cubit.dart';

sealed class FactVsCubitState extends Equatable {
  const FactVsCubitState();

  @override
  List<Object> get props => [];
}

final class FactVsCustCubitInitial extends FactVsCubitState {}
final class FactVsCustCubitLoading extends FactVsCubitState {}
final class FactVsCustCubitFailure extends FactVsCubitState {
  final String error;

  const FactVsCustCubitFailure({required this.error});
}
final class FactVsCustCubitSuccess extends FactVsCubitState {
  final List<FactVsCustDispModel> factVsCustList;

  const FactVsCustCubitSuccess({required this.factVsCustList});
}
