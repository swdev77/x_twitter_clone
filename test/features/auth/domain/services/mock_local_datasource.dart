import 'package:flutter_test/flutter_test.dart';
import 'package:x_twitter_clone/features/auth/data/datasources/session_local_datasource.dart';

class MockLocalDatasource implements SessionLocalDatasource {
  @override
  Future<void> deleteToken() {
    // TODO: implement deleteToken
    throw UnimplementedError();
  }

  @override
  Future<String?> getToken() {
    // TODO: implement getToken
    throw UnimplementedError();
  }

  @override
  Future<void> saveToken({required String token}) async {
    return;
  }
}
