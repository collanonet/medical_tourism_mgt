// Package imports:
import 'package:json_annotation/json_annotation.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'medical_record_interpreter.g.dart';

@JsonSerializable()
class MedicalRecordInterpreter {
  @JsonKey(name: '_id')
  final String id;
  bool? requiredOrUnnnecessary;
  String? interpreter;
  String medicalRecord;
  final DateTime createdAt;
  final DateTime updatedAt;

  MedicalRecordInterpreter({
    required this.id,
    required this.requiredOrUnnnecessary,
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
      '_id': FormControl<String>(value: medicalRecordInterpreter?.id),
      'requiredOrUnnnecessary': FormControl<bool>(
          value: medicalRecordInterpreter?.requiredOrUnnnecessary),
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
