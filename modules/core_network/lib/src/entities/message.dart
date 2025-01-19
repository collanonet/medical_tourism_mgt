import 'package:json_annotation/json_annotation.dart';

import '../../core_network.dart';

part 'message.g.dart';

@JsonSerializable()
class Message {
  @JsonKey(name: '_id')
  final String id;
  final String chatId;
  final String sender;
  final String content;
  final DateTime timestamp;

  Message({
    required this.id,
    required this.chatId,
    required this.sender,
    required this.content,
    required this.timestamp,
  });

  /// Factory method to parse JSON into a `Message` object
  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  /// Converts a `Message` object into JSON
  Map<String, dynamic> toJson() => _$MessageToJson(this);
}