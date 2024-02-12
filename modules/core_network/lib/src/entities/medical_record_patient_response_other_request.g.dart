// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_record_patient_response_other_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalRecordPatientResponseOtherRequest
    _$MedicalRecordPatientResponseOtherRequestFromJson(
            Map<String, dynamic> json) =>
        MedicalRecordPatientResponseOtherRequest(
          doYouHaveAValidVisa: json['doYouHaveAValidVisa'] as bool?,
          visa: json['visa'] as String?,
          requestingAPersonalGuaranteeForObtainingAMedicalVisa:
              json['requestingAPersonalGuaranteeForObtainingAMedicalVisa']
                  as bool?,
          remarks: json['remarks'] as String?,
          companionDoYouHaveAValidVisa:
              json['companionDoYouHaveAValidVisa'] as bool?,
          companionVisa: json['companionVisa'] as String?,
          companionRequestingAPersonalGuaranteeForObtainingAMedicalVisa: json[
                  'companionRequestingAPersonalGuaranteeForObtainingAMedicalVisa']
              as bool?,
          medicalRecord: json['medicalRecord'] as String,
        );

Map<String, dynamic> _$MedicalRecordPatientResponseOtherRequestToJson(
        MedicalRecordPatientResponseOtherRequest instance) =>
    <String, dynamic>{
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
    };
