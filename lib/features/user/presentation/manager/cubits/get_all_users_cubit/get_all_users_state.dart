part of 'get_all_users_cubit.dart';

sealed class GetAllUsersState extends Equatable {
  const GetAllUsersState();

  @override
  List<Object> get props => [];
}

final class GetAllUsersInitial extends GetAllUsersState {}

final class GetAllUsersLoading extends GetAllUsersState {}

final class GetAllUsersFailure extends GetAllUsersState {
  final String error;

  const GetAllUsersFailure({required this.error});
}

final class GetAllUsersSuccess extends GetAllUsersState {
  final List<UserModel> users;

  const GetAllUsersSuccess({required this.users});
}
