import 'package:x_twitter_clone/features/auth/domain/repository/auth_repository.dart';

class FakeAuthRepository implements AuthRepository {
  @override
  Future<String> register() async {
    return 'fake_token';
  }

  @override
  Future<String> login({
    required String email,
    required String password,
  }) async {
    return 'fake_token';
  }
}
