import 'package:flutter/material.dart';
import 'package:flutter_spotify/domain/services/register_service.dart';
import 'package:flutter_spotify/resources/resources.dart';
import 'package:flutter_spotify/styles/app_colors.dart';
import 'package:flutter_spotify/ui/navigation/main_navigation.dart';

class RegisterModel extends ChangeNotifier {
  final BuildContext context;
  final _registerService = RegisterService();
  RegisterModel(this.context);

  bool _passwordHideFirst = true;
  bool _passwordHideSecond = true;

  bool get passwordHideFirst => _passwordHideFirst;
  bool get passwordHideSecond => _passwordHideSecond;

  final fullname = TextEditingController(text: '');
  final email = TextEditingController(text: '');
  final password = TextEditingController(text: '');
  final repeatPassword = TextEditingController(text: '');

  var _isRegisterProcess = false;

  Widget isRegisterProcessState() {
    if (_isRegisterProcess) {
      return const CircularProgressIndicator(color: Colors.black);
    } else {
      return const Text(
        'Register',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      );
    }
  }

  void passwordToggleFirst() {
    _passwordHideFirst = !_passwordHideFirst;
    notifyListeners();
  }

  void passwordToggleSecond() {
    _passwordHideSecond = !_passwordHideSecond;
    notifyListeners();
  }

  Widget showIconPassword(bool hide) {
    return hide == true
        ? const Image(
            image: AssetImage(AppImages.passwordHide),
            color: Colors.grey,
          )
        : const Icon(
            Icons.remove_red_eye,
            color: AppColors.mainColor,
          );
  }

  Future<void> onPressedRegisterButton() async {
    if (fullname.text == '' || email.text == '' || password.text == '') return;
    if (password.text != repeatPassword.text) return;
    _isRegisterProcess = true;
    notifyListeners();
    await _registerService.register(fullname.text, email.text, password.text);
    _isRegisterProcess = false;
    notifyListeners();
    _navigatorPushNamedOnScreen();
  }

  void _navigatorPushNamedOnScreen() {
    Navigator.of(context).pushReplacementNamed(MainNavigationRouteNames.logIn);
  }
}
