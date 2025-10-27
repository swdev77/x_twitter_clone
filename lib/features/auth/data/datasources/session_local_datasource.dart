import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class SessionLocalDatasource {
  Future<void> saveToken({required String token});
  Future<String?> getToken();
  Future<void> deleteToken();
}

class SessionLocalDatasourceImpl implements SessionLocalDatasource {
  final FlutterSecureStorage secureStorage;
  SessionLocalDatasourceImpl({required this.secureStorage});

  static const _tokenKey = 'x_clone_app_auth_token';

  @override
  Future<void> saveToken({required String token}) async {
    secureStorage.write(key: _tokenKey, value: token);
  }

  @override
  Future<String?> getToken() async {
    return await secureStorage.read(key: _tokenKey);
  }

  @override
  Future<void> deleteToken() async {
    secureStorage.delete(key: _tokenKey);
  }
}
