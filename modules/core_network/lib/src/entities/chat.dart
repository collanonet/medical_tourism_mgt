import 'package:json_annotation/json_annotation.dart';
import 'message.dart';
import 'user.dart';

part 'chat.g.dart';

@JsonSerializable()
class Chat {
  @JsonKey(name: '_id')
  final String id;
  final String? name;
  final bool isGroupChat;
  final List<User> users;
  final Message? latestMessage;

  Chat({
    required this.id,
     this.name,
    required this.isGroupChat,
    required this.users,
    this.latestMessage,
  });

  /// Factory method to parse JSON into a `Chat` object
  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);

  /// Converts a `Chat` object into JSON
  Map<String, dynamic> toJson() => _$ChatToJson(this);
}