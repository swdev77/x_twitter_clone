import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_twitter_clone/features/auth/domain/services/user_session_service.dart';
import 'package:x_twitter_clone/features/auth/domain/usecases/login_use_case.dart';
import 'package:x_twitter_clone/features/auth/presentation/login/bloc/login_event.dart';
import 'package:x_twitter_clone/features/auth/presentation/login/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginUseCase loginUseCase;
  UserSessionService userSessionService;

  LoginBloc({
    required this.loginUseCase,
    required this.userSessionService,
  }) : super(LoginInitial()) {
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  Future<void> _onLoginSubmitted(LoginSubmitted event, emit) async {
    emit(LoginLoading());
    try {
      final token = await loginUseCase(
        email: event.email,
        password: event.password,
      );

      await userSessionService.saveUserSession(token);

      emit(LoginSuccess());
    } catch (e) {
      emit(LoginFailure(error: e.toString()));
    }
  }
}
