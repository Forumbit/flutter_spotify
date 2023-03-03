import 'package:flutter_spotify/domain/data_providers/user_data_provider.dart';
import 'package:flutter_spotify/domain/entities/user.dart';

class UserService {
  final _userDataProvider = UserDataProvider();
  var _user = User('', '', '', '');
  User get user => _user;

  Future<void> initialize() async {
    _user = await _userDataProvider.loadUser() ?? _user;
  }

  Future<void> removeUser() async {
    await _userDataProvider.removeUser();
  }
  
}