import 'package:json_annotation/json_annotation.dart';

part 'chat_group_request.g.dart';

@JsonSerializable()
class ChatGroupRequest {
  String name;
  List<String> userIds;

  ChatGroupRequest({
    required this.name,
    required this.userIds,
  });

  /// Factory method to parse JSON into a `ChatGroupRequest` object
  factory ChatGroupRequest.fromJson(Map<String, dynamic> json) => _$ChatGroupRequestFromJson(json);

  /// Converts a `ChatGroupRequest` object into JSON
  Map<String, dynamic> toJson() => _$ChatGroupRequestToJson(this);
}