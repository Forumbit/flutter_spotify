import 'package:flutter/material.dart';
import 'package:flutter_spotify/resources/resources.dart';
import 'package:flutter_spotify/styles/app_colors.dart';
import 'package:flutter_spotify/ui/navigation/main_navigation.dart';
import 'package:flutter_spotify/ui/widgets/app/app_model.dart';
import 'package:flutter_spotify/ui/components/widget_styles/widget_styles.dart';
import 'package:flutter_spotify/ui/widgets/start_screens/get_started/paths/backkground_body_paths.dart';
import 'package:flutter_spotify/ui/components/leading_widget.dart';
import 'package:provider/provider.dart';

class ContinueWidget extends StatelessWidget {
  const ContinueWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: const LeadingWidget(),
        automaticallyImplyLeading: false,
        toolbarHeight: 124,
        title: const Image(image: AssetImage(AppImages.spotify)),
        centerTitle: true,
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
            'Choose Mode',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 32),
          _InfoWidgetMode(),
          SizedBox(height: 32),
          _InfoWidgetButton(),
          SizedBox(height: 48),
        ],
      ),
    );
  }
}

class _InfoWidgetMode extends StatelessWidget {
  const _InfoWidgetMode({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final darkTheme = Provider.of<AppModel>(context, listen: true).isDark;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Material(
                color: darkTheme == true
                    ? const Color(0xFF42C83C)
                    : AppColors.neutralBlack,
                child: InkWell(
                  overlayColor: MaterialStateProperty.all(Colors.grey),
                  onTap: () => {
                    if (darkTheme == false)
                      Provider.of<AppModel>(context, listen: false)
                          .toggleTheme()
                  },
                  child: const SizedBox(
                    width: 73,
                    height: 73,
                    child: Image(
                      image: AssetImage(AppImages.moon),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 18),
            const Text('Dark Mode')
          ],
        ),
        const SizedBox(width: 62),
        Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Material(
                color: darkTheme == false
                    ? const Color(0xFF42C83C)
                    : AppColors.neutralBlack,
                child: InkWell(
                  overlayColor: MaterialStateProperty.all(Colors.grey),
                  onTap: () {
                    if (darkTheme == true) {
                      Provider.of<AppModel>(context, listen: false)
                          .toggleTheme();
                    }
                  },
                  child: const SizedBox(
                    width: 73,
                    height: 73,
                    child: Image(
                      image: AssetImage(AppImages.sun),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 18),
            const Text('Light Mode')
          ],
        ),
      ],
    );
  }
}

class _InfoWidgetButton extends StatelessWidget {
  const _InfoWidgetButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 72,
      child: ElevatedButton(
        onPressed: () => Navigator.of(context).pushNamed(MainNavigationRouteNames.signUp),
        style: WidgetStyles.mainColorButtonStyle,
        child: const Text(
          'Continue',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black),
        ),
      ),
    );
  }
}
