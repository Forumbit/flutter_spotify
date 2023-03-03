import 'package:flutter_spotify/domain/data_providers/auth_api_provider.dart';
import 'package:flutter_spotify/domain/data_providers/session_data_provider.dart';

class AuthService {
  final _sessionDataProvider = SessionDataProvider();
  final _authApiProvider = AuthApiProvider();


  Future<bool> checkAuth() async {
    final apiKey = await _sessionDataProvider.apiKey();
    return apiKey != null;
  }

  Future<void> logIn(String email, String password) async {
    final apiKey = await _authApiProvider.logIn(email, password);
    await _sessionDataProvider.saveApiKey(apiKey);
  }

  Future<void> logOut() async {
    await _sessionDataProvider.removeApiKey();
  }
}
