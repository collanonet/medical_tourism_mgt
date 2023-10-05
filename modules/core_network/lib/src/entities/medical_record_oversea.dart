import 'package:json_annotation/json_annotation.dart';

part 'medical_record_oversea.g.dart';

@JsonSerializable()
class MedicalRecordOversea {
  @JsonKey(name: '_id')
  final String id;
   String medicalRecord;
   String note;
  final DateTime createdAt;
  final DateTime updatedAt;

  MedicalRecordOversea({
    required this.id,
    required this.medicalRecord,
    required this.note,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MedicalRecordOversea.fromJson(Map<String, dynamic> json) {
    return _$MedicalRecordOverseaFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MedicalRecordOverseaToJson(this);
}
