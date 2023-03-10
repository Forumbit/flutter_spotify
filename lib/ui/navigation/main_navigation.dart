import 'package:flutter/material.dart';
import 'package:flutter_spotify/domain/entities/track.dart';
import 'package:flutter_spotify/domain/factories/screen_factory.dart';
import 'package:flutter_spotify/ui/widgets/start_screens/get_started/sign_up_widget.dart';
import 'package:flutter_spotify/ui/widgets/start_screens/get_started/continue_widget.dart';
import 'package:flutter_spotify/ui/widgets/start_screens/get_started/get_started_widget.dart';

abstract class MainNavigationRouteNames {
  static const loader = '/';
  static const home = '/home';
  static const getStarted = '/get-started';
  static const continueName = '/get-started/continue';
  static const signUp = '/get-started/continue/sign-up';
  static const register = '/get-started/continue/sign-up/register';
  static const logIn = '/get-started/continue/sign-up/log-in';
  static const playlist = '/home/playlist';
  static const history = '/home/history';
  static const profil = '/home/profil';

  static const trackDetail = '/home/track_detail/';
}

class MainNavigation {
  static final _screenFactory = ScreenFactory();
  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.loader: (_) => _screenFactory.makeLoader(),
    MainNavigationRouteNames.getStarted: (_) => const GetStartedWidget(),
    MainNavigationRouteNames.continueName: (_) => const ContinueWidget(),
    MainNavigationRouteNames.signUp: (_) => const SignUpWidget(),
    MainNavigationRouteNames.register: (_) => _screenFactory.makeRegister(),
    MainNavigationRouteNames.logIn: (_) => _screenFactory.makeLogIn(),
    MainNavigationRouteNames.home: (_) => _screenFactory.makeMainScreen(),
  };

  Route<Object>? onGenerateRoute(settings) {
    switch (settings.name) {
      case MainNavigationRouteNames.trackDetail:
        final arguments = settings.arguments;
        final track = arguments is Track ? arguments : null;
        return MaterialPageRoute(
          builder: (_) => _screenFactory.makeTrack(track),
        );
      default:
        const widget = Text('Navigation error!!!');
        return MaterialPageRoute(builder: (_) => widget);
    }
  }
}
