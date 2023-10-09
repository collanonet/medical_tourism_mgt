import 'package:json_annotation/json_annotation.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'patient_name.g.dart';

@JsonSerializable()
class PatientName {
  @JsonKey(name: '_id')
  final String id;
  String familyName;
  String middleName;
  String firstName;
  String nameType;
  String patient;
  final DateTime createdAt;
  final DateTime updatedAt;

  PatientName({
    required this.id,
    required this.familyName,
    required this.middleName,
    required this.firstName,
    required this.nameType,
    required this.patient,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PatientName.fromJson(Map<String, dynamic> json) {
    return _$PatientNameFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PatientNameToJson(this);

  static FormGroup buildFormGroup(PatientName? patientName) {
    return FormGroup({
      'id': FormControl<String>(value: patientName?.id),
      'familyName': FormControl<String>(value: patientName?.familyName),
      'middleName': FormControl<String>(value: patientName?.middleName),
      'firstName': FormControl<String>(value: patientName?.firstName),
      'nameType': FormControl<String>(value: patientName?.nameType),
      'patient': FormControl<String>(value: patientName?.patient),
      'createdAt': FormControl<DateTime>(value: patientName?.createdAt),
      'updatedAt': FormControl<DateTime>(value: patientName?.updatedAt),
    });
  }
}
