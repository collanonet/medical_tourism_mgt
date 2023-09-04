import 'package:json_annotation/json_annotation.dart';

import '../../core_network.dart';
import '../../entities.dart';

part 'invitation.g.dart';

@JsonSerializable()
class Invitation {
  String id;
  String code;
  String? name;
  String? expiredIn;
  InvitationRole? invitingRole;
  InvitationStatus? status;
  Business? business;
  Shop? shop;

  Invitation({
    required this.id,
    required this.code,
    this.name,
    this.expiredIn,
    this.invitingRole,
    this.status,
    this.business,
    this.shop,
  });

  factory Invitation.fromJson(Map<String, dynamic> json) =>
      _$InvitationFromJson(json);

  Map<String, dynamic> toJson() => _$InvitationToJson(this);
}
