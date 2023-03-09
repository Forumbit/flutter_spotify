import 'package:flutter/material.dart';
import 'package:flutter_spotify/ui/navigation/main_navigation.dart';
import 'package:flutter_spotify/ui/widgets/app/app_model.dart';
import 'package:flutter_spotify/ui/widgets/app/app_theme_mode.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  static final mainNavigation = MainNavigation();
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeMode = context.watch<AppModel>().themeMode;
    return MaterialApp(
      theme: AppThemeMode.lightTheme,
      darkTheme: AppThemeMode.darkTheme,
      themeMode: themeMode,
      debugShowCheckedModeBanner: false,
      routes: mainNavigation.routes,
      initialRoute: MainNavigationRouteNames.loader,
      onGenerateRoute: mainNavigation.onGenerateRoute,
    );
  }
}
