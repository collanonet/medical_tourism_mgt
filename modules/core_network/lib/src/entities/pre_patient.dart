import 'package:json_annotation/json_annotation.dart';
import 'package:reactive_forms/reactive_forms.dart';
part 'pre_patient.g.dart';

@JsonSerializable()
class PrePatient {
  @JsonKey(name: '_id')
  final String id;
  String? agents;
  String? patient;
  DateTime? dateOfBirth;
  String? gender;
  String? nationality;
  String? classification;
  String? nameOfDisease;
  bool isDeleted;
  final DateTime createdAt;
  final DateTime updatedAt;

  PrePatient({
    required this.id,
    this.agents,
    this.patient,
    this.dateOfBirth,
    this.gender,
    this.nationality,
    this.classification,
    this.nameOfDisease,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PrePatient.fromJson(Map<String, dynamic> json) {
    return _$PrePatientFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PrePatientToJson(this);

  static FormGroup buildFormGroup(PrePatient? prePatient) {
    return FormGroup({
      'id': FormControl<String>(value: prePatient?.id),
      'agents': FormControl<String>(value: prePatient?.agents),
      'patient': FormControl<String>(value: prePatient?.patient),
      'dateOfBirth': FormControl<DateTime>(value: prePatient?.dateOfBirth),
      'gender': FormControl<String>(value: prePatient?.gender),
      'nationality': FormControl<String>(value: prePatient?.nationality),
      'classification': FormControl<String>(value: prePatient?.classification),
      'nameOfDisease': FormControl<String>(value: prePatient?.nameOfDisease),
      'isDeleted': FormControl<bool>(value: prePatient?.isDeleted),
      'createdAt': FormControl<DateTime>(value: prePatient?.createdAt),
      'updatedAt': FormControl<DateTime>(value: prePatient?.updatedAt),
    });
  }
}
