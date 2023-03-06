import 'package:flutter/material.dart';
import 'package:flutter_spotify/resources/resources.dart';

class PlaylistListWidget extends StatelessWidget {
  const PlaylistListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
      ),
      itemCount: 11,
      itemBuilder: (BuildContext context, int index) {
        return const PlayListItemWidget();
      },
    );
  }
}

class PlayListItemWidget extends StatelessWidget {
  const PlayListItemWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: const Image(
                  image: AssetImage(AppImages.playlistImage),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Happiers',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                '45 songs',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {},
              ),
            ),
          )
        ],
      ),
    );
  }
}
