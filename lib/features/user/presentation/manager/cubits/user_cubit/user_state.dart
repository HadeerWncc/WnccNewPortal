part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserFailure extends UserState {
  final String error;

  const UserFailure({required this.error});
}

class UserSuccess extends UserState {
  final UserModel user;
  final List<String> states;
  final List<String> cities;
  const UserSuccess(
      {required this.states, required this.user, required this.cities});
}

// class UserGetCities extends UserState {
//   final List<String> cities;

//   const UserGetCities({required this.cities});

// }
