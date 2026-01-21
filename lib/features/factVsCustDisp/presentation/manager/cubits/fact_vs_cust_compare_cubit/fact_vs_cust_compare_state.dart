part of 'fact_vs_cust_compare_cubit.dart';

sealed class FactVsCustCompareState extends Equatable {
  const FactVsCustCompareState();

  @override
  List<Object> get props => [];
}

final class FactVsCustCompareInitial extends FactVsCustCompareState {}
final class FactVsCustCompareLoading extends FactVsCustCompareState {}
final class FactVsCustCompareFailure extends FactVsCustCompareState {
  final String errorMessage;

  const FactVsCustCompareFailure({required this.errorMessage});

}
final class FactVsCustCompareSuccess extends FactVsCustCompareState {
  final List<FactVsCustDispCompare> factVsCustDispCompareList;

  const FactVsCustCompareSuccess({required this.factVsCustDispCompareList});
}
