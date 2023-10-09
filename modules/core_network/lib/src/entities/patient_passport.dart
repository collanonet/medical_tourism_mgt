import 'package:json_annotation/json_annotation.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'patient_passport.g.dart';

@JsonSerializable()
class PatientPassport {
  @JsonKey(name: '_id')
  final String id;
   String passportNumber;
   DateTime issueDate;
   DateTime expirationDate;
   String visaType;
   String visaCategory;
   bool underConfirmation;
   String patient;
  final DateTime createdAt;
  final DateTime updatedAt;

  PatientPassport({
    required this.id,
    required this.passportNumber,
    required this.issueDate,
    required this.expirationDate,
    required this.visaType,
    required this.visaCategory,
    required this.underConfirmation,
    required this.patient,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PatientPassport.fromJson(Map<String, dynamic> json) {
    return _$PatientPassportFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PatientPassportToJson(this);

  static FormGroup buildFormGroup(PatientPassport? patientPassport) {
    return FormGroup({
      'id': FormControl<String>(value: patientPassport?.id),
      'passportNumber': FormControl<String>(
          value: patientPassport?.passportNumber),
      'issueDate': FormControl<DateTime>(value: patientPassport?.issueDate),
      'expirationDate':
      FormControl<DateTime>(value: patientPassport?.expirationDate),
      'visaType': FormControl<String>(value: patientPassport?.visaType),
      'visaCategory': FormControl<String>(
          value: patientPassport?.visaCategory),
      'underConfirmation':
      FormControl<bool>(value: patientPassport?.underConfirmation),
      'patient': FormControl<String>(value: patientPassport?.patient),
      'createdAt': FormControl<DateTime>(value: patientPassport?.createdAt),
      'updatedAt': FormControl<DateTime>(value: patientPassport?.updatedAt),
    });
  }
}