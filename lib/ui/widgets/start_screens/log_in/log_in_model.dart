import 'package:flutter/material.dart';
import 'package:flutter_spotify/domain/data_providers/auth_api_provider.dart';
import 'package:flutter_spotify/domain/services/auth_service.dart';
import 'package:flutter_spotify/resources/resources.dart';
import 'package:flutter_spotify/styles/app_colors.dart';

class LogInModel extends ChangeNotifier {
  final _authService = AuthService();

  var _passwordHide = true;
  bool get passwordHide => _passwordHide;
  var _isAuthProgress = false;

  final email = TextEditingController(text: 'amirkharisov545@gmail.com');
  final password = TextEditingController(text: '12345678');

  void passwordToggle() {
    _passwordHide = !_passwordHide;
    notifyListeners();
  }

    Widget isRegisterProcessState() {
    if (_isAuthProgress) {
      return const CircularProgressIndicator(color: Colors.black);
    } else {
      return const Text(
        'Log In',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      );
    }
  }

  Widget passwordIcon() {
    Widget passwordIcon = _passwordHide == true
        ? const Image(
            image: AssetImage(AppImages.passwordHide),
            color: Colors.grey,
          )
        : const Icon(
            Icons.remove_red_eye,
            color: AppColors.mainColor,
          );
    return passwordIcon;
  }

  Future<void> onLogInPressedButton() async {
    if (email.text == '' || password.text == '') return;
    _isAuthProgress = true;
    notifyListeners();

    try {
        await _authService.logIn(email.text, password.text);
    } on AuthApiProviderIncorrectLoginError {
      // ignore: avoid_print
      print('Неправильный емейл или пароль!');
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  
    _isAuthProgress = false;
    notifyListeners();
  }
}
