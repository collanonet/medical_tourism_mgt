// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'medical_record_budget_request.g.dart';

@JsonSerializable()
class MedicalRecordBudgetRequest {
   int? budget;
   String? remarks;
   String medicalRecord;

  MedicalRecordBudgetRequest({
     this.budget,
    this.remarks,
     required this.medicalRecord,
  });

  factory MedicalRecordBudgetRequest.fromJson(Map<String, dynamic> json) {
    return _$MedicalRecordBudgetRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MedicalRecordBudgetRequestToJson(this);
}
