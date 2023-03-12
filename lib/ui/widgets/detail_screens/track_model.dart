import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spotify/domain/entities/track.dart';

class TrackModel extends ChangeNotifier {
  final _audioPlayer = AudioPlayer();

  final Track? _track;
  Track? get track => _track;

  bool _isPlaying = false;
  bool get isPlaying => _isPlaying;

  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  Duration get duration => _duration;
  Duration get position => _position;

  TrackModel(this._track) {
    initialize();
  }

  String filterDurationToString(Duration duration) {
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds - duration.inMinutes * 60;
    return '$minutes:${seconds ~/ 10}${seconds - seconds ~/ 10 * 10}';
  }

  void initialize() {
    _audioPlayer.onPlayerStateChanged.listen((state) {
      _isPlaying = state == PlayerState.playing;
      notifyListeners();
    });

    _audioPlayer.onDurationChanged.listen((newDuration) {
      _duration = newDuration;
      notifyListeners();
    });

    _audioPlayer.onPositionChanged.listen((newPosition) {
      _position = newPosition;
      notifyListeners();
    });

    initPlayeer();
  }

  void initPlayeer() async {
    _isPlaying = true;
    String url = _track!.audio.replaceAll('\\/', '/');
    await _audioPlayer.play(UrlSource(url));
  }

  Future<void> onChangedSlider(double value) async {
    final position = Duration(seconds: value.toInt());
    await _audioPlayer.seek(position);
    await _audioPlayer.resume();
  }

  Future<void> onPressedButton() async {
    if (_isPlaying) {
      await _audioPlayer.pause();
    } else {
      String url = _track!.audio.replaceAll('\\/', '/');
      await _audioPlayer.play(UrlSource(url));
    }
  }

  @override
  dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}
