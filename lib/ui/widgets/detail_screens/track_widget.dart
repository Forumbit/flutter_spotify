import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spotify/domain/entities/track.dart';
import 'package:flutter_spotify/resources/resources.dart';
import 'package:flutter_spotify/styles/app_colors.dart';
import 'package:flutter_spotify/ui/widgets/detail_screens/track_model.dart';
import 'package:provider/provider.dart';

class TrackWidget extends StatelessWidget {
  const TrackWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final track = context.read<TrackModel>().track;
    final modelWatch = context.watch<TrackModel>();
    final modelRead = context.read<TrackModel>();
    if (track == null) Navigator.pop(context);
    return Scaffold(
      backgroundColor: AppColors.neutralGrey,
      appBar: AppBar(
        toolbarHeight: 82,
        backgroundColor: AppColors.neutralGrey,
        automaticallyImplyLeading: false,
        title: const Text(
          'Now Playing',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Image(
            image: AssetImage(
              AppImages.chevronLeft,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: Image.network(track!.image.replaceAll('\\/', '/')),
            ),
            const SizedBox(height: 70),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 150,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        child: Text(
                          track.name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      track.artistName,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const Image(image: AssetImage(AppImages.heartFill)),
              ],
            ),
            Slider(
              thumbColor: Colors.grey,
              inactiveColor: const Color(0xFF474747),
              activeColor: Colors.grey,
              min: 0,
              max: modelWatch.duration.inSeconds.toDouble(),
              value: modelWatch.position.inSeconds.toDouble(),
              onChanged: (value) => modelRead.onChangedSlider(value),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(modelRead.filterDurationToString(modelWatch.position)),
                  Text(modelRead.filterDurationToString(modelWatch.duration)),
                ],
              ),
            ),
            CircleAvatar(
              backgroundColor: modelWatch.isPlaying ? Colors.black : AppColors.mainColor,
              radius: 35,
              child: IconButton(
                iconSize: 50,
                onPressed: () => modelRead.onPressedButton(),
                icon: modelWatch.isPlaying
                    ? const Icon(Icons.pause)
                    : const Image(
                        image: AssetImage(AppImages.play),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
