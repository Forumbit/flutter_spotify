import 'package:flutter/material.dart';
import 'package:flutter_spotify/resources/resources.dart';
import 'package:flutter_spotify/styles/app_colors.dart';
import 'package:flutter_spotify/ui/navigation/main_navigation.dart';
import 'package:flutter_spotify/ui/components/leading_widget.dart';
import 'package:flutter_spotify/ui/components/social_network_widget.dart';
import 'package:flutter_spotify/ui/components/support_widget.dart';
import 'package:flutter_spotify/ui/components/divider_widget.dart';
import 'package:flutter_spotify/ui/components/widget_styles/widget_styles.dart';
import 'package:flutter_spotify/ui/widgets/start_screens/register/register_model.dart';
import 'package:provider/provider.dart';


class RegisterWidget extends StatelessWidget {
  const RegisterWidget({
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
              Text('Register',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 16),
              SupportWidget(),
              SizedBox(height: 32),
              _FullNameFormWidget(),
              SizedBox(height: 16),
              _EmailFormWidget(),
              SizedBox(height: 16),
              _PasswordFormWidget(),
              SizedBox(height: 16),
              _RepeatPasswordFormWidget(),
              SizedBox(height: 16),
              _RegisterButton(),
              SizedBox(height: 16),
              DividerWidget(),
              SizedBox(height: 24),
              SocialNetworkWidget(),
              SizedBox(height: 32),
              _LogInButton(),
              SizedBox(height: 41),
            ],
          ),
        ),
      ),
    );
  }
}

class _FullNameFormWidget extends StatelessWidget {
  const _FullNameFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: context.read<RegisterModel>().fullname,
      cursorColor: AppColors.mainColor,
      decoration: WidgetStyles.nameAndEmailInputDecoration('Full Name'),
    );
  }
}

class _EmailFormWidget extends StatelessWidget {
  const _EmailFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: context.read<RegisterModel>().email,
      cursorColor: AppColors.mainColor,
      decoration: WidgetStyles.nameAndEmailInputDecoration('Enter Email'),
    );
  }
}

class _PasswordFormWidget extends StatelessWidget {
  const _PasswordFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final modelWatch = context.watch<RegisterModel>();
    final modelRead = context.read<RegisterModel>();
    return TextFormField(
      controller: modelRead.password,
      obscureText: modelWatch.passwordHideFirst,
      cursorColor: AppColors.mainColor,
      decoration: WidgetStyles.passwordInputDecoration(
        context,
        modelRead.passwordToggleFirst,
        modelRead.showIconPassword(modelRead.passwordHideFirst),
        'Password',
      ),
    );
  }
}

class _RepeatPasswordFormWidget extends StatelessWidget {
  const _RepeatPasswordFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final modelWatch = context.watch<RegisterModel>();
    final modelRead = context.read<RegisterModel>();
    return TextFormField(
      controller: modelRead.repeatPassword,
      obscureText: modelWatch.passwordHideSecond,
      cursorColor: AppColors.mainColor,
      decoration: WidgetStyles.passwordInputDecoration(
        context,
        modelRead.passwordToggleSecond,
        modelRead.showIconPassword(modelRead.passwordHideSecond),
        'Repeat Password',
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
    final model = context.read<RegisterModel>();
    return SizedBox(
      width: double.infinity,
      height: 72,
      child: ElevatedButton(
        onPressed: () => model.onPressedRegisterButton(),
        style: WidgetStyles.mainColorButtonStyle,
        child: context.watch<RegisterModel>().isRegisterProcessState(),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Have An Account?',
          style: TextStyle(fontSize: 12),
        ),
        TextButton(
          onPressed: () =>
              Navigator.of(context).pushReplacementNamed(MainNavigationRouteNames.logIn),
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(
              const Color.fromARGB(255, 128, 115, 0),
            ),
          ),
          child: const Text(
            'Log In',
            style: TextStyle(
              color: AppColors.secondaryColor,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
