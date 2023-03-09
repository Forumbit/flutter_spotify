import 'package:flutter_spotify/domain/api_clients/api_client.dart';
import 'package:flutter_spotify/domain/entities/track.dart';

class TrackService {
  final apiClient = ApiClient();

  Future<List<Track>> getTracks() async {
    final tracks = await apiClient.getTracks();
    return tracks;
  }
}