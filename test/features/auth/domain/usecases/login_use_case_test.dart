import 'package:flutter_test/flutter_test.dart';
import 'package:x_twitter_clone/features/auth/domain/usecases/login_use_case.dart';

import '../../data/repository/mock_auth_repository.dart';

void main() {
  group('Login use case test', () {
    const String email = 'username@mail.com';
    const String password = 'password123';

    const String invalidEmail = 'username';
    const String invalidPassword = '123';

    late LoginUseCase loginUseCase;

    setUp(() {
      loginUseCase = LoginUseCase(authRepository: MockAuthRepository());
    });

    test('should login successfully and return token', () async {
      final result = await loginUseCase.call(email: email, password: password);

      expect(result, 'token');
    });

    test('should throw exception for invalid email', () async {
      expect(
        () async => await loginUseCase.call(
          email: invalidEmail,
          password: password,
        ),
        throwsA(isA<Exception>()),
      );
    });
  });
}
