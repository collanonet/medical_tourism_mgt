import 'package:json_annotation/json_annotation.dart';

enum InvitationStatus {
  @JsonValue('PENDING')
  pending,
  @JsonValue('ACCEPTED')
  accepted,
  @JsonValue('CANCELLED')
  cancelled,
}
