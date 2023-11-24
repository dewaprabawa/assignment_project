import 'package:assignment_project/core/preference/token_manager.dart';
import 'package:assignment_project/features/authentication/domain/usecase/auth_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authUseCase, this._tokenManager) : super(const AuthState());

  final AuthUseCase _authUseCase;
  final TokenManager _tokenManager;

  Future<void> login({required String email, required String password}) async {
    emit(state.copyWith(authProgressStatus: AuthProgressStatus.loading));
    final either = await _authUseCase.loginUser(email, password);
    either.fold((failure) {
      emit(state.copyWith(authProgressStatus: AuthProgressStatus.failure, message: failure.message));
    }, (success) {
      _tokenManager.saveToken(success.token ?? '');
      emit(state.copyWith(
          authProgressStatus: AuthProgressStatus.success,
          loggedInStatus: LoggedInStatus.authenticated));
    });
  }

  void logout() {
    _tokenManager.clearToken();
    emit(state.copyWith(loggedInStatus: LoggedInStatus.unauthenticated));
  }

  void isLoggin() async {
    emit(state.copyWith(loggedInStatus: LoggedInStatus.starting));
    final token = await _tokenManager.getToken();
    if (token != null) {
      emit(state.copyWith(loggedInStatus: LoggedInStatus.authenticated));
    } else {
      emit(state.copyWith(loggedInStatus: LoggedInStatus.unauthenticated));
    }
  }

  void isSecurityPassword(){
    emit(state.copyWith(isSecure: !state.isSecure));
  }
}
