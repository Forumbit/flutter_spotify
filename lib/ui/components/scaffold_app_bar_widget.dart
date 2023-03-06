import 'package:flutter/material.dart';
import 'package:flutter_spotify/resources/resources.dart';
import 'package:flutter_spotify/styles/app_colors.dart';

abstract class ScaffoldAppBar {
  static PreferredSizeWidget scaffoldAppBarFunction(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return AppBar(
          toolbarHeight: 75,
          automaticallyImplyLeading: false,
          title: const Image(image: AssetImage(AppImages.spotify)),
          centerTitle: true,
          leadingWidth: 100,
          leading: IconButton(
            onPressed: () {},
            icon: const Image(
              image: AssetImage(AppImages.search),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: IconButton(
                onPressed: () {},
                icon: const Image(image: AssetImage(AppImages.settings)),
              ),
            ),
          ],
        );
      case 1:
        return AppBar(
          toolbarHeight: 75,
          automaticallyImplyLeading: false,
          title: const Text(
            'Playlist',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          centerTitle: true,
          leadingWidth: 100,
          leading: IconButton(
            onPressed: () {},
            icon: const Image(
              image: AssetImage(AppImages.search),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: IconButton(
                onPressed: () {},
                icon: const Image(
                  image: AssetImage(AppImages.add),
                ),
              ),
            ),
          ],
        );
      case 2:
        return AppBar(
          toolbarHeight: 75,
          automaticallyImplyLeading: false,
          title: const Text(
            'History',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          centerTitle: true,
          leadingWidth: 100,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: IconButton(
                onPressed: () {},
                icon: const Image(
                  image: AssetImage(AppImages.ellipsis),
                ),
              ),
            ),
          ],
        );
      case 3:
        return AppBar(
          backgroundColor: AppColors.neutralGrey,
          toolbarHeight: 75,
          automaticallyImplyLeading: false,
          title: const Text(
            'Profil',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          centerTitle: true,
          leadingWidth: 100,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: IconButton(
                onPressed: () {},
                icon: const Image(
                  image: AssetImage(AppImages.ellipsis),
                ),
              ),
            ),
          ],
        );
      default:
        return AppBar(
          title: const Text('Content are developing'),
        );
    }
  }
}
