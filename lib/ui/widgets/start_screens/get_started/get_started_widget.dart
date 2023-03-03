import 'package:flutter/material.dart';
import 'package:flutter_spotify/resources/resources.dart';
import 'package:flutter_spotify/styles/app_colors.dart';
import 'package:flutter_spotify/ui/navigation/main_navigation.dart';
import 'package:flutter_spotify/ui/components/widget_styles/widget_styles.dart';
import 'package:flutter_spotify/ui/widgets/start_screens/get_started/paths/backkground_body_paths.dart';

class GetStartedWidget extends StatelessWidget {
  const GetStartedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 124,
        centerTitle: true,
        title: const Image(image: AssetImage(AppImages.spotify)),
      ),
      body: Stack(
        children: const [
          Image(image: AssetImage(AppImages.backgroundGetStarted)),
          ShadowForBackgroundImageWidget(),
          _InfoWidget()
        ],
      ),
    );
  }
}

class _InfoWidget extends StatelessWidget {
  const _InfoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 42),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          Text(
            'Music for everyone',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: AppColors.mainColor,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Nulla Lorem mollit cupidatat irure. Laborum magna nulla duis ullamco cillum dolor. Voluptate exercitation incididunt aliquip deserunt reprehenderit elit laborum. ',
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 32),
          _InfoButtonWidget(),
          SizedBox(height: 48),
        ],
      ),
    );
  }
}

class _InfoButtonWidget extends StatelessWidget {
  const _InfoButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 72,
      child: ElevatedButton(
        onPressed: () =>
            Navigator.of(context).pushNamed(MainNavigationRouteNames.continueName),
        style: WidgetStyles.mainColorButtonStyle,
        child: const Text(
          'Get Started',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black),
        ),
      ),
    );
  }
}
