import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'track.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Track {
  final String id;
  final String name;
  final int duration;
  final String artistId;
  final String artistName;
  final String artistIdstr;
  final String albumName;
  final String albumId;
  final String licenseCcurl;
  final int position;
  final String releasedate;
  final String albumImage;
  final String audio;
  final String audiodownload;
  final String prourl;
  final String shorturl;
  final String shareurl;
  final String image;
  Track({
    required this.id,
    required this.name,
    required this.duration,
    required this.artistId,
    required this.artistName,
    required this.artistIdstr,
    required this.albumName,
    required this.albumId,
    required this.licenseCcurl,
    required this.position,
    required this.releasedate,
    required this.albumImage,
    required this.audio,
    required this.audiodownload,
    required this.prourl,
    required this.shorturl,
    required this.shareurl,
    required this.image,
  });

  factory Track.fromJson(Map<String,dynamic> json) => _$TrackFromJson(json);
  Map<String, dynamic> toJson() => _$TrackToJson(this);
}