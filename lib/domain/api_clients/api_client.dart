import 'dart:convert' as convert;
import 'package:flutter_spotify/domain/entities/track.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  static const hostUrl = 'https://api.jamendo.com/v3.0/';
  static const clientId = '6cb0444f';

  Future<List<Track>> getTracks() async {
    const limit = 10;
    final url = Uri.parse(
        '$hostUrl/tracks/?client_id=$clientId&format=jsonpretty&limit=$limit');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
      final jsonList = jsonResponse['results'] as List<dynamic>;
      final tracks = jsonList.map((e) => Track.fromJson(e)).toList() as List<Track>;
      return tracks;
    } else {
      print(response.statusCode);
      throw Error();
    }
  } 
}
