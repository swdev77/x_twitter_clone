import 'package:flutter_test/flutter_test.dart';
import 'package:x_twitter_clone/features/auth/domain/usecases/register_use_case.dart';

import '../../data/repository/mock_auth_repository.dart';

void main() {
  group('Register Use Case', () {

    late RegisterUseCase registerUseCase;

    const String username = 'user';
    const String email = 'user@email.com';
    const String password = 'password';

    setUp(() {
      registerUseCase = RegisterUseCase(
        authRepository: MockAuthRepository(),
      );
    });

    test('should register user successfully and return token', () async {
      final result = await registerUseCase(
        username: username,
        email: email,
        password: password,
      );

      expect(result, 'token');
    });

    test('should return an error with empty email', () async {

      expect(
        () async => await registerUseCase(
          username: username,
          email: '',
          password: password,
        ),
        throwsA(isA<Exception>()),
      );
    });

    test('should return an error with empty password', () {
      expect(
        () async => await registerUseCase(
          username: username,
          email: email,
          password: '',
        ),
        throwsA(isA<Exception>()),
      );
    });
  });
}
