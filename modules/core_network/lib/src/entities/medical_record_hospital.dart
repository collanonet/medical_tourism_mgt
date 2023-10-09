import 'package:json_annotation/json_annotation.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'medical_record_hospital.g.dart';

@JsonSerializable()
class MedicalRecordHospital {
  @JsonKey(name: '_id')
  final String id;
   String hospitalName;
   String medicalCardNumber;
   String medicalRecord;
  final DateTime createdAt;
  final DateTime updatedAt;

  MedicalRecordHospital({
    required this.id,
    required this.hospitalName,
    required this.medicalCardNumber,
    required this.medicalRecord,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MedicalRecordHospital.fromJson(Map<String, dynamic> json) {
    return _$MedicalRecordHospitalFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MedicalRecordHospitalToJson(this);

  static FormGroup buildFormGroup(MedicalRecordHospital? medicalRecordHospital) {
    return FormGroup({
      'id': FormControl<String>(value: medicalRecordHospital?.id),
      'hospitalName':
      FormControl<String>(value: medicalRecordHospital?.hospitalName),
      'medicalCardNumber': FormControl<String>(
          value: medicalRecordHospital?.medicalCardNumber),
      'medicalRecord':
      FormControl<String>(value: medicalRecordHospital?.medicalRecord),
      'createdAt': FormControl<DateTime>(value: medicalRecordHospital?.createdAt),
      'updatedAt': FormControl<DateTime>(value: medicalRecordHospital?.updatedAt),
    });
  }
}
