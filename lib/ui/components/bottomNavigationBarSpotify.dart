import 'package:flutter/material.dart';
import 'package:flutter_spotify/resources/resources.dart';
import 'package:flutter_spotify/styles/app_colors.dart';

class BottomNavigationBarSpotify extends StatelessWidget {
  final int currentIndex;
  final Function onChangedIndex;
  const BottomNavigationBarSpotify({
    Key? key,
    required this.currentIndex,
    required this.onChangedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (value) => onChangedIndex(value),
      currentIndex: currentIndex,
      showUnselectedLabels: true,
      selectedFontSize: 12,
      selectedItemColor: AppColors.mainColor,
      unselectedItemColor: AppColors.neutralWhite,
      items: const [
        BottomNavigationBarItem(
            icon: Image(
              image: AssetImage(AppImages.homeDisable),
            ),
            activeIcon: Image(
              image: AssetImage(AppImages.homeActive),
            ),
            label: 'Home',
            backgroundColor: AppColors.neutralGrey),
        BottomNavigationBarItem(
          icon: Image(
            image: AssetImage(AppImages.libraryDisable),
          ),
          activeIcon: Image(
            image: AssetImage(AppImages.libraryActive),
          ),
          label: 'Playlist',
        ),
        BottomNavigationBarItem(
          icon: Image(
            image: AssetImage(AppImages.clockDisable),
          ),
          activeIcon: Image(
            image: AssetImage(AppImages.clockActive),
          ),
          label: 'History',
        ),
        BottomNavigationBarItem(
          icon: Image(
            image: AssetImage(AppImages.userDiasble),
          ),
          activeIcon: Image(
            image: AssetImage(AppImages.userActive),
          ),
          label: 'Profil',
        ),
      ],
    );
  }
}
