import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class SessionDataProviderKeys {
  static const apiKey = 'api_key';
}

class SessionDataProvider {
  final _storage = const FlutterSecureStorage();

  Future<String?> apiKey() async {
    return await _storage.read(key: SessionDataProviderKeys.apiKey);
  }

  Future<void> saveApiKey(String apiKey) async {
    await _storage.write(key: SessionDataProviderKeys.apiKey, value: apiKey);
  }

  Future<void> removeApiKey() async {
    await _storage.delete(key: SessionDataProviderKeys.apiKey);
  }
}
