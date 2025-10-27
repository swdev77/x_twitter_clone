import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:x_twitter_clone/features/auth/domain/services/user_session_service.dart';
import 'package:x_twitter_clone/features/auth/domain/usecases/login_use_case.dart';
import 'package:x_twitter_clone/features/auth/presentation/login/bloc/login_bloc.dart';
import 'package:x_twitter_clone/features/auth/presentation/login/bloc/login_event.dart';
import 'package:x_twitter_clone/features/auth/presentation/login/bloc/login_state.dart';

import '../../data/repository/mock_auth_repository.dart';
import '../../domain/services/mock_local_datasource.dart';

void main() {
  group('Logout test', () {
    late LoginBloc loginBloc;
    late UserSessionService userSessionService;

    setUp(() {
      
      userSessionService = UserSessionService(sessionLocalDatasource: MockLocalDatasource());

      loginBloc = LoginBloc(
        loginUseCase: LoginUseCase(authRepository: MockAuthRepository()),
        userSessionService: userSessionService,
      );
      
    });

    blocTest(
      'Login successfully',
      build: () => loginBloc,
      act: (bloc) {
        bloc.add(
          LoginSubmitted(email: 'user@mail.com', password: 'password123'),
        );
      },
      expect: () => [isA<LoginLoading>(), isA<LoginSuccess>()],
    );
  });
}
