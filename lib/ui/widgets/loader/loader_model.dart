import 'package:flutter/cupertino.dart';
import 'package:flutter_spotify/domain/services/auth_service.dart';
import 'package:flutter_spotify/ui/navigation/main_navigation.dart';

class LoaderModel {
  final BuildContext context;
  final _authService = AuthService();

  LoaderModel(this.context) {
    asyncInit();
  }

  Future<void> asyncInit() async {
    await checkAuth();
  }

  Future<void> checkAuth() async {
    final isAuth = await _authService.checkAuth();
    final screen = isAuth == true
        ? MainNavigationRouteNames.home
        : MainNavigationRouteNames.getStarted;

    _navigatorPushNamedOnScreen(screen);
  }

  void _navigatorPushNamedOnScreen(String screen) {
    Navigator.of(context).pushNamed(screen);
  }
}
