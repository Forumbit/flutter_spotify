import 'package:flutter/material.dart';
import 'package:flutter_spotify/resources/resources.dart';

class PlaylistListWidget extends StatelessWidget {
  const PlaylistListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Image(
            image: AssetImage(AppImages.search),
          ),
        ),
        title: const Text('Playlist'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Image(
              image: AssetImage(AppImages.add),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: const Image(
              image: AssetImage(AppImages.playlistImage),
            ),
          ),
        ],
      ),
    );
  }
}
