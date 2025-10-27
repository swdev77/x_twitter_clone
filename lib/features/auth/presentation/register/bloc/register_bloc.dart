import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_twitter_clone/features/auth/domain/services/user_session_service.dart';
import 'package:x_twitter_clone/features/auth/domain/usecases/register_use_case.dart';
import 'package:x_twitter_clone/features/auth/presentation/register/bloc/register_event.dart';
import 'package:x_twitter_clone/features/auth/presentation/register/bloc/register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterUseCase registerUseCase;
  UserSessionService userSessionService;

  RegisterBloc({
    required this.registerUseCase,
    required this.userSessionService,
  }) : super(RegisterInitial()) {
    on<RegisterSubmitted>(_onRegisterSubmitted);
  }

  _onRegisterSubmitted(RegisterSubmitted event, emit) async {
    emit(RegisterLoading());
    try {
      final token = await registerUseCase(
        username: event.username,
        email: event.email,
        password: event.password,
      );
      await userSessionService.saveUserSession(token);
    } catch (e) {
      emit(RegisterFailure(error: e.toString()));
    }
    emit(RegisterSuccess());
  }
}
