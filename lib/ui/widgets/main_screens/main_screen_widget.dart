import 'package:flutter/material.dart';
import 'package:flutter_spotify/resources/resources.dart';
import 'package:flutter_spotify/ui/components/bottomNavigationBarSpotify.dart';
import 'package:flutter_spotify/ui/components/scaffold_app_bar_widget.dart';
import 'package:flutter_spotify/ui/widgets/main_screens/history/history_widget.dart';
import 'package:flutter_spotify/ui/widgets/main_screens/home/home_model.dart';
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
      appBar: ScaffoldAppBar.scaffoldAppBarFunction(currentIndex),
      body: IndexedStack(
        index: currentIndex,
        children: [
          ChangeNotifierProvider(
            create: (_) => HomeModel(),
            child: const HomeWidget(),
          ),
          const PlaylistListWidget(),
          const HistoryWidget(),
          const ProfilWidget(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBarSpotify(
        currentIndex: currentIndex,
        onChangedIndex: context.read<MainScreenModel>().changeCurrentIndex,
      ),
    );
  }
}
