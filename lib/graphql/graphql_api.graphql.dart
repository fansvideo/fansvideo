// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:meta/meta.dart';
import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'graphql_api.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class VideosData$query_root$videos$users with EquatableMixin {
  VideosData$query_root$videos$users();

  factory VideosData$query_root$videos$users.fromJson(
          Map<String, dynamic> json) =>
      _$VideosData$query_root$videos$usersFromJson(json);

  String name;

  String profile;

  @override
  List<Object> get props => [name, profile];
  Map<String, dynamic> toJson() =>
      _$VideosData$query_root$videos$usersToJson(this);
}

@JsonSerializable(explicitToJson: true)
class VideosData$query_root$videos with EquatableMixin {
  VideosData$query_root$videos();

  factory VideosData$query_root$videos.fromJson(Map<String, dynamic> json) =>
      _$VideosData$query_root$videosFromJson(json);

  int id;

  String title;

  String url;

  int likes;

  String song_name;

  int students;

  VideosData$query_root$videos$users user;

  String uuid;

  @override
  List<Object> get props =>
      [id, title, url, likes, song_name, students, user, uuid];
  Map<String, dynamic> toJson() => _$VideosData$query_root$videosToJson(this);
}

@JsonSerializable(explicitToJson: true)
class VideosData$query_root with EquatableMixin {
  VideosData$query_root();

  factory VideosData$query_root.fromJson(Map<String, dynamic> json) =>
      _$VideosData$query_rootFromJson(json);

  List<VideosData$query_root$videos> videos;

  @override
  List<Object> get props => [videos];
  Map<String, dynamic> toJson() => _$VideosData$query_rootToJson(this);
}

class VideosDataQuery
    extends GraphQLQuery<VideosData$query_root, JsonSerializable> {
  VideosDataQuery();

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.query,
        name: NameNode(value: 'VideosData'),
        variableDefinitions: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'videos'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'limit'),
                    value: IntValueNode(value: '10')),
                ArgumentNode(
                    name: NameNode(value: 'offset'),
                    value: IntValueNode(value: '0')),
                ArgumentNode(
                    name: NameNode(value: 'order_by'),
                    value: ObjectValueNode(fields: [
                      ObjectFieldNode(
                          name: NameNode(value: 'id'),
                          value: EnumValueNode(name: NameNode(value: 'desc')))
                    ]))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'title'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'url'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'likes'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'song_name'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'students'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'user'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                          name: NameNode(value: 'name'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'profile'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null)
                    ])),
                FieldNode(
                    name: NameNode(value: 'uuid'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null)
              ]))
        ]))
  ]);

  @override
  final String operationName = 'VideosData';

  @override
  List<Object> get props => [document, operationName];
  @override
  VideosData$query_root parse(Map<String, dynamic> json) =>
      VideosData$query_root.fromJson(json);
}
