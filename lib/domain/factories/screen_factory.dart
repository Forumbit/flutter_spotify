import 'package:flutter/cupertino.dart';
import 'package:flutter_spotify/ui/widgets/app/app.dart';
import 'package:flutter_spotify/ui/widgets/app/app_model.dart';
import 'package:flutter_spotify/ui/widgets/loader/loader_model.dart';
import 'package:flutter_spotify/ui/widgets/loader/loader_widget.dart';
import 'package:flutter_spotify/ui/widgets/main_screens/home/home_model.dart';
import 'package:flutter_spotify/ui/widgets/main_screens/home/home_widget.dart';
import 'package:flutter_spotify/ui/widgets/main_screens/main_screen_model.dart';
import 'package:flutter_spotify/ui/widgets/main_screens/main_screen_widget.dart';
import 'package:flutter_spotify/ui/widgets/start_screens/log_in/log_in_model.dart';
import 'package:flutter_spotify/ui/widgets/start_screens/log_in/log_in_widget.dart';
import 'package:flutter_spotify/ui/widgets/start_screens/register/register_model.dart';
import 'package:flutter_spotify/ui/widgets/start_screens/register/register_widget.dart';
import 'package:provider/provider.dart';

class ScreenFactory {
  // APPLICATION ----------------
  Widget makeApp() {
    return ChangeNotifierProvider(
      create: (_) => AppModel(),
      child: const App(),
    );
  }
  // ----------------------------

  Widget makeLoader() {
    return Provider(
      create: (context) => LoaderModel(context),
      lazy: false,
      child: const LoaderWidget(),
    );
  }

  Widget makeLogIn() {
    return ChangeNotifierProvider(
      create: (_) => LogInModel(),
      child: const LogInWidget(),
    );
  }

  Widget makeRegister() {
    return ChangeNotifierProvider(
      create: (context) => RegisterModel(context),
      child: const RegisterWidget(),
    );
  }

  Widget makeMainScreen() {
    return ChangeNotifierProvider(
      create: (_) => MainScreenModel(),
      child: const MainScreenWidget(),
    );
  }
}
