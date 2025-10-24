import 'package:x_twitter_clone/features/auth/domain/repository/auth_repository.dart';

class MockAuthRepository implements AuthRepository {
  @override
  Future<String> register() async {
    return 'token';
  }
}
