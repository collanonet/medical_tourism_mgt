import 'package:json_annotation/json_annotation.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'patient.g.dart';

@JsonSerializable()
class Patient {
  @JsonKey(name: '_id')
  final String id;
  DateTime? dateOfBirth;
  int? age;
  String? gender;
  String? familyName;
  String? middleName;
  String? firstName;
  final DateTime createdAt;
  final DateTime updatedAt;

  Patient({
    required this.id,
    this.dateOfBirth,
    this.age,
    this.gender,
    this.familyName,
    this.middleName,
    this.firstName,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return _$PatientFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PatientToJson(this);

  static FormGroup buildFormGroup(Patient? patient) {
    return FormGroup({
      'id': FormControl<String>(value: patient?.id),
      'dateOfBirth': FormControl<DateTime>(value: patient?.dateOfBirth),
      'age': FormControl<int>(value: patient?.age),
      'gender': FormControl<String>(value: patient?.gender),
      'familyName': FormControl<String>(value: patient?.familyName),
      'middleName': FormControl<String>(value: patient?.middleName),
      'firstName': FormControl<String>(value: patient?.firstName),
      'createdAt': FormControl<DateTime>(value: patient?.createdAt),
      'updatedAt': FormControl<DateTime>(value: patient?.updatedAt),
    });
  }
}
