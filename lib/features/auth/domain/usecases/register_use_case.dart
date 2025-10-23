class RegisterUseCase {
  Future<String> call(
    {required String username,
    required String email,
    required String password}
  ) async {

    if (email.isEmpty) {
      throw Exception('Email cannot be empty');
    }

    if (password.isEmpty) {
      throw Exception('Password cannot be empty');
    }

    return 'token';
  }
}