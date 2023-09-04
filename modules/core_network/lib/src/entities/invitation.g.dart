// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invitation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Invitation _$InvitationFromJson(Map<String, dynamic> json) => Invitation(
      id: json['id'] as String,
      code: json['code'] as String,
      name: json['name'] as String?,
      expiredIn: json['expiredIn'] as String?,
      invitingRole:
          $enumDecodeNullable(_$InvitationRoleEnumMap, json['invitingRole']),
      status: $enumDecodeNullable(_$InvitationStatusEnumMap, json['status']),
      business: json['business'] == null
          ? null
          : Business.fromJson(json['business'] as Map<String, dynamic>),
      shop: json['shop'] == null
          ? null
          : Shop.fromJson(json['shop'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InvitationToJson(Invitation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'expiredIn': instance.expiredIn,
      'invitingRole': _$InvitationRoleEnumMap[instance.invitingRole],
      'status': _$InvitationStatusEnumMap[instance.status],
      'business': instance.business,
      'shop': instance.shop,
    };

const _$InvitationRoleEnumMap = {
  InvitationRole.owner: 'OWNER',
  InvitationRole.coMerchant: 'CO_MERCHANT',
  InvitationRole.supervisor: 'SUPERVISOR',
  InvitationRole.cashier: 'CASHIER',
};

const _$InvitationStatusEnumMap = {
  InvitationStatus.pending: 'PENDING',
  InvitationStatus.accepted: 'ACCEPTED',
  InvitationStatus.cancelled: 'CANCELLED',
};
