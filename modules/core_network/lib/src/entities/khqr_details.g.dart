// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'khqr_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KhqrDetails _$KhqrDetailsFromJson(Map<String, dynamic> json) => KhqrDetails(
      id: json['id'] as String,
      content: json['content'] as String,
      expireAt: json['expireAt'] as int,
      status: $enumDecode(_$KhqrStatusEnumMap, json['status']),
      transaction: json['transaction'] == null
          ? null
          : Transaction.fromJson(json['transaction'] as Map<String, dynamic>),
      bankAccount:
          BankAccount.fromJson(json['bankAccount'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$KhqrDetailsToJson(KhqrDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'expireAt': instance.expireAt,
      'status': _$KhqrStatusEnumMap[instance.status]!,
      'transaction': instance.transaction,
      'bankAccount': instance.bankAccount,
    };

const _$KhqrStatusEnumMap = {
  KhqrStatus.active: 'ACTIVE',
  KhqrStatus.paid: 'PAID',
  KhqrStatus.unpublished: 'UNPUBLISHED',
};
