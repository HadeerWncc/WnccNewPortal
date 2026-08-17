part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSuccess extends HomeState {
  final List<SalesDatum> homeSummary;
  final List<String> sales;
  const HomeSuccess(this.sales, {required this.homeSummary});

  @override
  List<Object> get props => [homeSummary];
}

final class HomeFailure extends HomeState {
  final String errorMessage;
  const HomeFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
