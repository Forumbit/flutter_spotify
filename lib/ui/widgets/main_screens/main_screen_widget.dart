import 'package:flutter/material.dart';
import 'package:flutter_spotify/resources/resources.dart';
import 'package:flutter_spotify/ui/components/bottomNavigationBarSpotify.dart';
import 'package:flutter_spotify/ui/widgets/main_screens/history/history_widget.dart';
import 'package:flutter_spotify/ui/widgets/main_screens/home/home_widget.dart';
import 'package:flutter_spotify/ui/widgets/main_screens/main_screen_model.dart';
import 'package:flutter_spotify/ui/widgets/main_screens/playlist_list/playlist_widget.dart';
import 'package:flutter_spotify/ui/widgets/main_screens/profil/profil_widget.dart';
import 'package:provider/provider.dart';

class MainScreenWidget extends StatelessWidget {
  const MainScreenWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final currentIndex = context.watch<MainScreenModel>().currentIndex;
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: IndexedStack(
        index: currentIndex,
        children: const [
          HomeWidget(),
          PlaylistListWidget(),
          HistoryWidget(),
          ProfilWidget(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBarSpotify(
        currentIndex: currentIndex,
        onChangedIndex: context.read<MainScreenModel>().changeCurrentIndex,
      ),
    );
  }
}
