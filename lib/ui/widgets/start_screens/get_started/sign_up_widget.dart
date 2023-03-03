import 'package:flutter/material.dart';
import 'package:flutter_spotify/resources/resources.dart';
import 'package:flutter_spotify/ui/navigation/main_navigation.dart';
import 'package:flutter_spotify/ui/components/widget_styles/widget_styles.dart';
import 'package:flutter_spotify/ui/widgets/start_screens/get_started/paths/backkground_body_paths.dart';
import 'package:flutter_spotify/ui/components/leading_widget.dart';

class SignUpWidget extends StatelessWidget {
  const SignUpWidget({Key? key}) : super(key: key);

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
          Image(
            image: AssetImage(AppImages.backgroundGetStarted),
          ),
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
          _SignUpButton(),
          SizedBox(height: 12),
          _PhoneButton(),
          SizedBox(height: 12),
          _GoogleButton(),
          SizedBox(height: 12),
          _FacebookButton(),
          SizedBox(height: 12),
          _LogInButton(),
          SizedBox(height: 46),
        ],
      ),
    );
  }
}

class _SignUpButton extends StatelessWidget {
  const _SignUpButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: () => Navigator.of(context).pushNamed(MainNavigationRouteNames.register),
        style: WidgetStyles.mainColorButtonStyle,
        child: const Text(
          'Sign up free',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

class _PhoneButton extends StatelessWidget {
  const _PhoneButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          shape: MaterialStateProperty.all(const StadiumBorder()),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
          overlayColor: MaterialStateProperty.all(Colors.grey),
          side: MaterialStateProperty.all(
            BorderSide(color: Theme.of(context).hintColor),
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Image(
                image: const AssetImage(AppImages.phoneIcon),
                color: Theme.of(context).hintColor,
              ),
            ),
            const SizedBox(width: 17),
            const FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                'Continue with phone number',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GoogleButton extends StatelessWidget {
  const _GoogleButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          shape: MaterialStateProperty.all(const StadiumBorder()),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
          overlayColor: MaterialStateProperty.all(Colors.grey),
          side: MaterialStateProperty.all(
            BorderSide(color: Theme.of(context).hintColor),
          ),
        ),
        child: Row(
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Image(image: AssetImage(AppImages.google)),
            ),
            SizedBox(width: 17),
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                'Continue with Google',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FacebookButton extends StatelessWidget {
  const _FacebookButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          shape: MaterialStateProperty.all(const StadiumBorder()),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
          overlayColor: MaterialStateProperty.all(Colors.grey),
          side: MaterialStateProperty.all(
            BorderSide(color: Theme.of(context).hintColor),
          ),
        ),
        child: Row(
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Image(image: AssetImage(AppImages.facebook)),
            ),
            SizedBox(width: 17),
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                'Continue with facebook',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LogInButton extends StatelessWidget {
  const _LogInButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style:
          ButtonStyle(overlayColor: MaterialStateProperty.all(Colors.white24)),
      onPressed: () => Navigator.of(context).pushNamed(MainNavigationRouteNames.logIn),
      child: const Text(
        'Log in',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
