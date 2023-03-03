
import 'package:flutter/material.dart';
import 'package:flutter_spotify/styles/app_colors.dart';

class SupportWidget extends StatelessWidget {
  const SupportWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'If You Need Any Support',
          style: TextStyle(fontSize: 12),
        ),
        TextButton(
          onPressed: () {},
          style: ButtonStyle(
            overlayColor:
                MaterialStateProperty.all(const Color.fromARGB(255, 0, 121, 4)),
          ),
          child: const Text(
            'Click here',
            style: TextStyle(color: AppColors.mainColor, fontSize: 12),
          ),
        ),
      ],
    );
  }
}