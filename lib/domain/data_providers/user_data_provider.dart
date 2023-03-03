import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_spotify/domain/entities/user.dart';

abstract class UserDataProviderKey {
  static const fullname = 'fullname';
  static const email = 'email';
  static const password = 'password';
}

class UserDataProvider {
  final _storage = const FlutterSecureStorage();

  Future<String?> _storageRead(String key) async {
    return await _storage.read(key: key);
  }

  Future<void> _storageWrite(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  Future<void> _storageDelete(String key) async {
    await _storage.delete(key: key);
  }

  Future<User?> loadUser() async {
    final fullname = await _storageRead(UserDataProviderKey.fullname) ?? '';
    final email = await _storageRead(UserDataProviderKey.email) ?? '';
    final password = await _storageRead(UserDataProviderKey.password) ?? '';
    return User(fullname, '', email, password);
  }

  Future<void> saveUser(String fullname, String email, String password) async {
    await _storageWrite(UserDataProviderKey.fullname, fullname);
    await _storageWrite(UserDataProviderKey.email, email);
    await _storageWrite(UserDataProviderKey.password, email);
  }

  Future<void> removeUser() async {
    await _storageDelete(UserDataProviderKey.fullname);
    await _storageDelete(UserDataProviderKey.email);
    await _storageDelete(UserDataProviderKey.password);
  }
}
