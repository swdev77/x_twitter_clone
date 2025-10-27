import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:x_twitter_clone/features/auth/domain/services/user_session_service.dart';
import 'package:x_twitter_clone/features/auth/domain/usecases/register_use_case.dart';
import 'package:x_twitter_clone/features/auth/presentation/register/bloc/register_bloc.dart';
import 'package:x_twitter_clone/features/auth/presentation/register/bloc/register_event.dart';
import 'package:x_twitter_clone/features/auth/presentation/register/bloc/register_state.dart';

import '../../data/repository/mock_auth_repository.dart';
import '../../domain/services/mock_local_datasource.dart';

void main() {
  group('Register Bloc test', () {
    late RegisterBloc registerBloc;
    late UserSessionService userSessionService;

    setUp(() {
      userSessionService = UserSessionService(
        sessionLocalDatasource: MockLocalDatasource(),
      );
      registerBloc = RegisterBloc(
        registerUseCase: RegisterUseCase(authRepository: MockAuthRepository()),
        userSessionService: userSessionService,
      );
    });
    blocTest(
      'emit [Loading, Success] when register is successful',
      build: () => registerBloc,
      act: (bloc) => bloc.add(
        RegisterSubmitted(
          email: 'username@mail.com',
          username: 'username',
          password: 'password',
        ),
      ),
      expect: () => [RegisterLoading(), RegisterSuccess()],
    );
    blocTest(
      'emit [Loading, Failure] when email is not valid',
      build: () => registerBloc,
      act: (bloc) => bloc.add(
        RegisterSubmitted(
          email: 'username',
          username: 'username',
          password: 'password',
        ),
      ),
      expect: () => [RegisterLoading(), isA<RegisterFailure>],
    );
  });
}
