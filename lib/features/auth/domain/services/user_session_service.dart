import 'package:x_twitter_clone/features/auth/data/datasources/session_local_datasource.dart';

class UserSessionService {
  final SessionLocalDatasource sessionLocalDatasource;

  UserSessionService({required this.sessionLocalDatasource});

  Future<void> saveUserSession(String token) async {
    await sessionLocalDatasource.saveToken(token: token);
  }

  Future<String?> getUserSession() async {
    return await sessionLocalDatasource.getToken();
  }

  Future<void> logout() {
    return sessionLocalDatasource.deleteToken();
  }

  Future<bool> isUserLoggedIn() async {
    Future.delayed(const Duration(seconds: 5));
    final token = await getUserSession();
    return token != null;
  }
}
