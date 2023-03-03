import 'package:flutter/material.dart';
import 'package:flutter_spotify/resources/resources.dart';

class SocialNetworkWidget extends StatelessWidget {
  const SocialNetworkWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 48,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey)),
            child: const Image(image: AssetImage(AppImages.facebook)),
          ),
        ),
        const SizedBox(width: 24),
        Expanded(
          child: Container(
            height: 48,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey)),
            child: const Image(image: AssetImage(AppImages.google)),
          ),
        ),
        const SizedBox(width: 24),
        Expanded(
          child: Container(
            height: 48,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey)),
            child: Image(
                image: const AssetImage(AppImages.apple),
                color: Theme.of(context).hintColor),
          ),
        ),
      ],
    );
  }
}