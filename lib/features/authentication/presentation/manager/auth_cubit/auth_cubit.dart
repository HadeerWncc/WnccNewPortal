import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/authentication/data/models/login_model.dart';
import 'package:wncc_portal/features/authentication/domain/entities/login_entity.dart';
import 'package:wncc_portal/features/authentication/domain/use_cases/check_auth_use_case.dart';
import 'package:wncc_portal/features/authentication/domain/use_cases/login_use_case.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.loginUseCase, this.checkAuthUseCase) : super(AuthInitial());
  final LoginUseCase loginUseCase;
  final CheckAuthUseCase checkAuthUseCase;

  Future<void> login({LoginEntity? loginEntity}) async {
    emit(AuthLoading());
    var result = await loginUseCase.call(loginEntity);
    result.fold((failure) {
      emit(AuthFailure(error: failure.msg));
    }, (loginModel) {
      emit(AuthSuccess(loginModel: loginModel));
    });
  }

  Future<void> checkAuthStatus() async {
    final isAuthenticated = await checkAuthUseCase();
    if (isAuthenticated) {
      emit(Authenticated());
    } else {
      emit(Unauthenticated());
    }
  }
}
