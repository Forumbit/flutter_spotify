import 'package:flutter/material.dart';
import 'package:flutter_spotify/resources/resources.dart';
import 'package:flutter_spotify/styles/app_colors.dart';
import 'package:flutter_spotify/ui/navigation/main_navigation.dart';
import 'package:flutter_spotify/ui/components/leading_widget.dart';
import 'package:flutter_spotify/ui/components/social_network_widget.dart';
import 'package:flutter_spotify/ui/components/support_widget.dart';
import 'package:flutter_spotify/ui/components/divider_widget.dart';
import 'package:flutter_spotify/ui/components/widget_styles/widget_styles.dart';
import 'package:flutter_spotify/ui/widgets/start_screens/log_in/log_in_model.dart';
import 'package:provider/provider.dart';

class LogInWidget extends StatelessWidget {
  const LogInWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 122,
        leading: const LeadingWidget(),
        title: const Image(image: AssetImage(AppImages.spotify)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Log In',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 16),
              SupportWidget(),
              SizedBox(height: 32),
              _UsernameFormWidget(),
              SizedBox(height: 16),
              _PasswordFormWidget(),
              _ForgotPasswordButton(),
              SizedBox(height: 16),
              _LogInWidgetButton(),
              SizedBox(height: 16),
              DividerWidget(),
              SizedBox(height: 24),
              SocialNetworkWidget(),
              SizedBox(height: 32),
              _RegisterButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _UsernameFormWidget extends StatelessWidget {
  const _UsernameFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: context.read<LogInModel>().email,
      cursorColor: AppColors.mainColor,
      decoration:
          WidgetStyles.nameAndEmailInputDecoration('Enter Username Or Email'),
    );
  }
}

class _PasswordFormWidget extends StatelessWidget {
  const _PasswordFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final modelRead = context.read<LogInModel>();
    final modelWatch = context.watch<LogInModel>();
    return TextFormField(
      controller: modelRead.password,
      obscureText: modelWatch.passwordHide,
      cursorColor: AppColors.mainColor,
      decoration: WidgetStyles.passwordInputDecoration(
        context,
        modelRead.passwordToggle,
        modelRead.passwordIcon(),
        'Password',
      ),
    );
  }
}

class _ForgotPasswordButton extends StatelessWidget {
  const _ForgotPasswordButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: TextButton(
        onPressed: () {},
        child: const Text(
          'Forgot password?',
          style: TextStyle(
            fontSize: 12,
            decoration: TextDecoration.underline,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class _LogInWidgetButton extends StatelessWidget {
  const _LogInWidgetButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<LogInModel>();
    return SizedBox(
      width: double.infinity,
      height: 72,
      child: ElevatedButton(
        onPressed: () => model.onLogInPressedButton(),
        style: WidgetStyles.mainColorButtonStyle,
        child: context.watch<LogInModel>().isRegisterProcessState(),
      ),
    );
  }
}

class _RegisterButton extends StatelessWidget {
  const _RegisterButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Don\'t Have An Account?',
          style: TextStyle(fontSize: 12),
        ),
        TextButton(
          onPressed: () =>
              Navigator.of(context).pushReplacementNamed(MainNavigationRouteNames.register),
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(
              const Color.fromARGB(255, 128, 115, 0),
            ),
          ),
          child: const Text(
            'Register',
            style: TextStyle(color: AppColors.secondaryColor, fontSize: 12),
          ),
        ),
      ],
    );
  }
}
