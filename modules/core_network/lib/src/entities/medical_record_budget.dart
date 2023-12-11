import 'package:json_annotation/json_annotation.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'medical_record_budget.g.dart';

@JsonSerializable()
class MedicalRecordBudget {
  @JsonKey(name: '_id')
  final String id;
   int budget;
   String? remarks;
   String medicalRecord;
  final DateTime createdAt;
  final DateTime updatedAt;

  MedicalRecordBudget({
    required this.id,
    required this.budget,
    this.remarks,
    required this.medicalRecord,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MedicalRecordBudget.fromJson(Map<String, dynamic> json) {
    return _$MedicalRecordBudgetFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MedicalRecordBudgetToJson(this);

  static FormGroup buildFormGroup(MedicalRecordBudget? medicalRecordBudget) {
    return FormGroup({
      'id': FormControl<String>(value: medicalRecordBudget?.id),
      'budget': FormControl<int>(value: medicalRecordBudget?.budget),
      'remarks': FormControl<String>(value: medicalRecordBudget?.remarks),
      'medicalRecord':
      FormControl<String>(value: medicalRecordBudget?.medicalRecord),
      'createdAt': FormControl<DateTime>(value: medicalRecordBudget?.createdAt),
      'updatedAt': FormControl<DateTime>(value: medicalRecordBudget?.updatedAt),
    });
  }
}
