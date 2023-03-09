import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spotify/domain/entities/track.dart';
import 'package:flutter_spotify/resources/resources.dart';
import 'package:flutter_spotify/styles/app_colors.dart';

class TrackWidget extends StatefulWidget {
  final Track? track;
  const TrackWidget({Key? key, required this.track}) : super(key: key);

  @override
  State<TrackWidget> createState() => _TrackWidgetState(track);
}

class _TrackWidgetState extends State<TrackWidget> {
  final Track? track;
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  _TrackWidgetState(this.track);

  @override
  void initState() {
    super.initState();

    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });

    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });

    initPlayeer();
  }

  void initPlayeer() async {
    isPlaying = true;
    String url = track!.audio.replaceAll('\\/', '/');
    await audioPlayer.play(UrlSource(url));
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      track!.name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      track!.artistName,
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
              max: duration.inSeconds.toDouble(),
              value: position.inSeconds.toDouble(),
              onChanged: (value) async {
                final position = Duration(seconds: value.toInt());
                await audioPlayer.seek(position);
                await audioPlayer.resume();
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(position.inSeconds.toString()),
                  Text((duration - position).inSeconds.toString()),
                ],
              ),
            ),
            CircleAvatar(
              backgroundColor: isPlaying ? Colors.black : AppColors.mainColor,
              radius: 35,
              child: IconButton(
                iconSize: 50,
                onPressed: () async {
                  if (isPlaying) {
                    await audioPlayer.pause();
                  } else {
                    String url = track!.audio.replaceAll('\\/', '/');
                    await audioPlayer.play(UrlSource(url));
                  }
                },
                icon: isPlaying
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
