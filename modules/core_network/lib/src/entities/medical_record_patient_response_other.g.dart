// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_record_patient_response_other.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalRecordPatientResponseOther _$MedicalRecordPatientResponseOtherFromJson(
        Map<String, dynamic> json) =>
    MedicalRecordPatientResponseOther(
      id: json['_id'] as String,
      doYouHaveAValidVisa: json['doYouHaveAValidVisa'] as bool?,
      visa: json['visa'] as String?,
      requestingAPersonalGuaranteeForObtainingAMedicalVisa:
          json['requestingAPersonalGuaranteeForObtainingAMedicalVisa'] as bool?,
      remarks: json['remarks'] as String?,
      companionDoYouHaveAValidVisa:
          json['companionDoYouHaveAValidVisa'] as bool?,
      companionVisa: json['companionVisa'] as String?,
      companionRequestingAPersonalGuaranteeForObtainingAMedicalVisa:
          json['companionRequestingAPersonalGuaranteeForObtainingAMedicalVisa']
              as bool?,
      medicalRecord: json['medicalRecord'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$MedicalRecordPatientResponseOtherToJson(
        MedicalRecordPatientResponseOther instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'doYouHaveAValidVisa': instance.doYouHaveAValidVisa,
      'visa': instance.visa,
      'requestingAPersonalGuaranteeForObtainingAMedicalVisa':
          instance.requestingAPersonalGuaranteeForObtainingAMedicalVisa,
      'remarks': instance.remarks,
      'companionDoYouHaveAValidVisa': instance.companionDoYouHaveAValidVisa,
      'companionVisa': instance.companionVisa,
      'companionRequestingAPersonalGuaranteeForObtainingAMedicalVisa': instance
          .companionRequestingAPersonalGuaranteeForObtainingAMedicalVisa,
      'medicalRecord': instance.medicalRecord,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
