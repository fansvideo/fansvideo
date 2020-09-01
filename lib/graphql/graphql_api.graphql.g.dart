// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'graphql_api.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideosData$query_root$videos$users _$VideosData$query_root$videos$usersFromJson(
    Map<String, dynamic> json) {
  return VideosData$query_root$videos$users()
    ..name = json['name'] as String
    ..profile = json['profile'] as String;
}

Map<String, dynamic> _$VideosData$query_root$videos$usersToJson(
        VideosData$query_root$videos$users instance) =>
    <String, dynamic>{
      'name': instance.name,
      'profile': instance.profile,
    };

VideosData$query_root$videos _$VideosData$query_root$videosFromJson(
    Map<String, dynamic> json) {
  return VideosData$query_root$videos()
    ..id = json['id'] as int
    ..title = json['title'] as String
    ..url = json['url'] as String
    ..likes = json['likes'] as int
    ..song_name = json['song_name'] as String
    ..students = json['students'] as int
    ..user = json['user'] == null
        ? null
        : VideosData$query_root$videos$users.fromJson(
            json['user'] as Map<String, dynamic>)
    ..uuid = json['uuid'] as String;
}

Map<String, dynamic> _$VideosData$query_root$videosToJson(
        VideosData$query_root$videos instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'url': instance.url,
      'likes': instance.likes,
      'song_name': instance.song_name,
      'students': instance.students,
      'user': instance.user?.toJson(),
      'uuid': instance.uuid,
    };

VideosData$query_root _$VideosData$query_rootFromJson(
    Map<String, dynamic> json) {
  return VideosData$query_root()
    ..videos = (json['videos'] as List)
        ?.map((e) => e == null
            ? null
            : VideosData$query_root$videos.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$VideosData$query_rootToJson(
        VideosData$query_root instance) =>
    <String, dynamic>{
      'videos': instance.videos?.map((e) => e?.toJson())?.toList(),
    };
