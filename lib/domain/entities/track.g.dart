// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Track _$TrackFromJson(Map<String, dynamic> json) => Track(
      id: json['id'] as String,
      name: json['name'] as String,
      duration: json['duration'] as int,
      artistId: json['artist_id'] as String,
      artistName: json['artist_name'] as String,
      artistIdstr: json['artist_idstr'] as String,
      albumName: json['album_name'] as String,
      albumId: json['album_id'] as String,
      licenseCcurl: json['license_ccurl'] as String,
      position: json['position'] as int,
      releasedate: json['releasedate'] as String,
      albumImage: json['album_image'] as String,
      audio: json['audio'] as String,
      audiodownload: json['audiodownload'] as String,
      prourl: json['prourl'] as String,
      shorturl: json['shorturl'] as String,
      shareurl: json['shareurl'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$TrackToJson(Track instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'duration': instance.duration,
      'artist_id': instance.artistId,
      'artist_name': instance.artistName,
      'artist_idstr': instance.artistIdstr,
      'album_name': instance.albumName,
      'album_id': instance.albumId,
      'license_ccurl': instance.licenseCcurl,
      'position': instance.position,
      'releasedate': instance.releasedate,
      'album_image': instance.albumImage,
      'audio': instance.audio,
      'audiodownload': instance.audiodownload,
      'prourl': instance.prourl,
      'shorturl': instance.shorturl,
      'shareurl': instance.shareurl,
      'image': instance.image,
    };
