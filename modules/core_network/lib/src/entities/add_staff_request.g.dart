// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_staff_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddStaffRequest _$AddStaffRequestFromJson(Map<String, dynamic> json) =>
    AddStaffRequest(
      userId: json['userId'] as String,
      shopId: json['shopId'] as String,
      counterId: json['counterId'] as String?,
    );

Map<String, dynamic> _$AddStaffRequestToJson(AddStaffRequest instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'shopId': instance.shopId,
      'counterId': instance.counterId,
    };
