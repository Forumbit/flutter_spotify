import 'package:flutter/material.dart';
import 'package:flutter_spotify/domain/entities/track.dart';
import 'package:flutter_spotify/domain/services/track_service.dart';

class HomeModel extends ChangeNotifier {

  HomeModel () {
    _loadTracks();
  }

  var _tracks = <Track>[];
  List<Track> get tracks => _tracks;

  void _loadTracks() async {
    final trackService = TrackService();
    _tracks = await trackService.getTracks();
    notifyListeners();
  }
}