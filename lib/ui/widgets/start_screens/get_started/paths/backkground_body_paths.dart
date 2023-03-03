import 'package:flutter/material.dart';

class ShadowForBackgroundImageWidget extends StatelessWidget {
  const ShadowForBackgroundImageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 4,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).scaffoldBackgroundColor,
                Theme.of(context).appBarTheme.backgroundColor ?? Colors.transparent,
              ],
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height / 3,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Theme.of(context).scaffoldBackgroundColor,
                Theme.of(context).appBarTheme.backgroundColor ?? Colors.transparent,
              ],
            ),
          ),
        ),
      ],
    );
  }
}