import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppModel extends ChangeNotifier {
  final _storage = const FlutterSecureStorage();
  ThemeMode _themeMode = ThemeMode.dark;
  bool _isDark = true;
  ThemeMode get themeMode => _themeMode;
  bool get isDark => _isDark;


  AppModel() {
    loadValue();
  }

  void loadValue() async {
    await readModeTheme();
    _themeMode = _isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  void toggleTheme() {
    _isDark = !_isDark;
    _themeMode = _isDark ? ThemeMode.dark : ThemeMode.light;
    saveModeTheme();
    notifyListeners();
  }

  void saveModeTheme() async {
    await _storage.write(key: 'theme_mode', value: _isDark.toString());
  }

  Future<void> readModeTheme() async {
    final isDarkStorage = await _storage.read(key: 'theme_mode');
    isDarkStorage == 'false' ? _isDark = false : _isDark = true;
  }
}
