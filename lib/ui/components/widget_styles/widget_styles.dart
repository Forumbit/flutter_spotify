import 'package:flutter/material.dart';
import 'package:flutter_spotify/styles/app_colors.dart';

abstract class WidgetStyles {
  // buttons
  static final mainColorButtonStyle = ButtonStyle(
    shape: MaterialStateProperty.all(const StadiumBorder()),
    backgroundColor: MaterialStateProperty.all(const Color(0xFF42C83C)),
  );

  // inputs
  static InputDecoration passwordInputDecoration(
    BuildContext context,
    Function passwordToggle,
    Widget passwordIcon,
    String hintText,
  ) {
    return InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.circular(24),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.mainColor),
        borderRadius: BorderRadius.circular(24),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      suffixIcon: IconButton(
        onPressed: () => passwordToggle(),
        icon: passwordIcon,
      ),
      hintText: hintText,
      hintStyle: const TextStyle(color: Colors.grey),
      contentPadding: const EdgeInsets.symmetric(vertical: 26, horizontal: 20),
    );
  }

  static InputDecoration nameAndEmailInputDecoration(String hintText) {
    return InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.circular(24),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.mainColor),
        borderRadius: BorderRadius.circular(24),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      hintText: hintText,
      hintStyle: const TextStyle(color: Colors.grey),
      contentPadding: const EdgeInsets.symmetric(vertical: 26, horizontal: 20),
    );
  }
}
