// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facility_photo_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FacilityRequest _$FacilityRequestFromJson(Map<String, dynamic> json) =>
    FacilityRequest(
      facilityFile: json['facilityFile'] as String?,
      nameOfHospital: json['nameOfHospital'] as String?,
      photograph: json['photograph'] as String?,
      shootingDate: json['shootingDate'] == null
          ? null
          : DateTime.parse(json['shootingDate'] as String),
      share: json['share'] as String?,
      uploadedPhoto: json['uploadedPhoto'] as String?,
    );

Map<String, dynamic> _$FacilityRequestToJson(FacilityRequest instance) =>
    <String, dynamic>{
      'facilityFile': instance.facilityFile,
      'nameOfHospital': instance.nameOfHospital,
      'photograph': instance.photograph,
      'shootingDate': instance.shootingDate?.toIso8601String(),
      'share': instance.share,
      'uploadedPhoto': instance.uploadedPhoto,
    };
