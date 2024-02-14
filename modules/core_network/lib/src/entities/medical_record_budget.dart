import 'package:json_annotation/json_annotation.dart';
part 'medical_record_budget.g.dart';

@JsonSerializable()
class MedicalRecordBudget {
  @JsonKey(name: '_id')
  final String id;
  int? budget;
  String? remarks;
  String medicalRecord;
  final DateTime createdAt;
  final DateTime updatedAt;

  MedicalRecordBudget({
    required this.id,
    this.budget,
    this.remarks,
    required this.medicalRecord,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MedicalRecordBudget.fromJson(Map<String, dynamic> json) {
    return _$MedicalRecordBudgetFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MedicalRecordBudgetToJson(this);
}
