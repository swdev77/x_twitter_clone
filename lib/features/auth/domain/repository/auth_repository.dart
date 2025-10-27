abstract class AuthRepository {
  Future<String> register();

  Future<String> login({required String email, required String password});
}
