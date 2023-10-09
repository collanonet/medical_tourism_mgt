import 'package:json_annotation/json_annotation.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'medical_record_interpreter.g.dart';

@JsonSerializable()
class MedicalRecordInterpreter {
  @JsonKey(name: '_id')
  final String id;
  bool requiredOrUnnecessary;
  String interpreter;
  String medicalRecord;
  final DateTime createdAt;
  final DateTime updatedAt;

  MedicalRecordInterpreter({
    required this.id,
    required this.requiredOrUnnecessary,
    required this.interpreter,
    required this.medicalRecord,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MedicalRecordInterpreter.fromJson(Map<String, dynamic> json) {
    return _$MedicalRecordInterpreterFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MedicalRecordInterpreterToJson(this);

  static FormGroup buildFormGroup(
      MedicalRecordInterpreter? medicalRecordInterpreter) {
    return FormGroup({
      'id': FormControl<String>(value: medicalRecordInterpreter?.id),
      'requiredOrUnnecessary': FormControl<bool>(
          value: medicalRecordInterpreter?.requiredOrUnnecessary),
      'interpreter':
          FormControl<String>(value: medicalRecordInterpreter?.interpreter),
      'medicalRecord':
          FormControl<String>(value: medicalRecordInterpreter?.medicalRecord),
      'createdAt':
          FormControl<DateTime>(value: medicalRecordInterpreter?.createdAt),
      'updatedAt':
          FormControl<DateTime>(value: medicalRecordInterpreter?.updatedAt),
    });
  }
}
