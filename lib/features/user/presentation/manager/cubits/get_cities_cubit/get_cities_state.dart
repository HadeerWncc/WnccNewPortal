part of 'get_cities_cubit.dart';

sealed class GetCitiesState extends Equatable {
  const GetCitiesState();

  @override
  List<Object> get props => [];
}

final class GetCitiesInitial extends GetCitiesState {}

final class GetCitiesSuccess extends GetCitiesState {
  final List<String> cities;

  const GetCitiesSuccess({required this.cities});
}
