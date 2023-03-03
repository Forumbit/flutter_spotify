import 'package:flutter/material.dart';
import 'package:flutter_spotify/resources/resources.dart';

class LeadingWidget extends StatelessWidget {
  const LeadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: MaterialStateProperty.all(Colors.grey),
      borderRadius: BorderRadius.circular(50),
      onTap: () => Navigator.of(context).pop(),
      child: Theme.of(context).hintColor == Colors.white
          ? const Image(
              image: AssetImage(AppImages.chevronLeft),
            )
          : const Icon(Icons.chevron_left, color: Colors.black),
    );
  }
}
