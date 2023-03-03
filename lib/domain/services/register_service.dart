import 'package:flutter_spotify/domain/data_providers/register_api_provider.dart';
import 'package:flutter_spotify/domain/data_providers/user_data_provider.dart';

class RegisterService {
  final _registerApiProvider = RegisterApiProvider();
  final _userDataProvider = UserDataProvider();

  Future<void> register(String fullname, String email, String password) async {
    await _registerApiProvider.register(fullname, email, password);
    await _userDataProvider.saveUser(fullname, email, password);
  }
}