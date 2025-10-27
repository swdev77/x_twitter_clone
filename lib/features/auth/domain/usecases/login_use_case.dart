import 'package:x_twitter_clone/features/auth/domain/repository/auth_repository.dart';

class LoginUseCase {
  
  final AuthRepository authRepository;
  
  LoginUseCase({required this.authRepository});
  
  Future<String> call({required String email, required String password}) async {
    return await authRepository.login(email: email, password: password);
  }
}
