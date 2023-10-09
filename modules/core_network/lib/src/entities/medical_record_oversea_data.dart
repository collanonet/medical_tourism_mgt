import 'package:json_annotation/json_annotation.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'medical_record_oversea_data.g.dart';

@JsonSerializable()
class MedicalRecordOverseaData {
  @JsonKey(name: '_id')
  final String id;
  String medicalRecord;
  String note;
  final DateTime createdAt;
  final DateTime updatedAt;

  MedicalRecordOverseaData({
    required this.id,
    required this.medicalRecord,
    required this.note,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MedicalRecordOverseaData.fromJson(Map<String, dynamic> json) {
    return _$MedicalRecordOverseaDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MedicalRecordOverseaDataToJson(this);

  static FormGroup buildFormGroup(
      MedicalRecordOverseaData? medicalRecordOverseaData) {
    return FormGroup({
      'id': FormControl<String>(value: medicalRecordOverseaData?.id),
      'medicalRecord':
          FormControl<String>(value: medicalRecordOverseaData?.medicalRecord),
      'note': FormControl<String>(value: medicalRecordOverseaData?.note),
      'createdAt':
          FormControl<DateTime>(value: medicalRecordOverseaData?.createdAt),
      'updatedAt':
          FormControl<DateTime>(value: medicalRecordOverseaData?.updatedAt),
    });
  }
}
