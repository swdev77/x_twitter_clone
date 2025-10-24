import 'package:x_twitter_clone/features/auth/domain/repository/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository authRepository;

  RegisterUseCase({required this.authRepository});

  Future<String> call({
    required String username,
    required String email,
    required String password,
  }) async {
    if (email.isEmpty) {
      throw Exception('Email cannot be empty');
    }

    if (password.isEmpty) {
      throw Exception('Password cannot be empty');
    }

    final token = await authRepository.register();

    return token;
  }
}
