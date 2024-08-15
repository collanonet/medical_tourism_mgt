import 'package:json_annotation/json_annotation.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'patient_nationality.g.dart';

@JsonSerializable()
class PatientNationality {
  @JsonKey(name: '_id')
  final String id;
  String? nationality;
  String? nativeLanguage;
  String? residentialArea;
  String? currentAddress;
  String? mobileNumber;
  String? email;
  List<String?>? chatToolLink;
  List<String?>? chatQr;
  String? chatQrImage;
  String? patient;
  final DateTime createdAt;
  final DateTime updatedAt;

  PatientNationality({
    required this.id,
    this.nationality,
    this.nativeLanguage,
    this.residentialArea,
    this.currentAddress,
    this.mobileNumber,
    this.email,
    this.chatToolLink,
    this.chatQr,
    this.chatQrImage,
    this.patient,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PatientNationality.fromJson(Map<String, dynamic> json) {
    return _$PatientNationalityFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PatientNationalityToJson(this);

  static FormGroup buildFormGroup(PatientNationality? patientNationality) {
    return FormGroup({
      'id': FormControl<String>(value: patientNationality?.id),
      'nationality':
          FormControl<String>(value: patientNationality?.nationality),
      'nativeLanguage':
          FormControl<String>(value: patientNationality?.nativeLanguage),
      'residentialArea':
          FormControl<String>(value: patientNationality?.residentialArea),
      'currentAddress':
          FormControl<String>(value: patientNationality?.currentAddress),
      'mobileNumber':
          FormControl<String>(value: patientNationality?.mobileNumber),
      'patient': FormControl<String>(value: patientNationality?.patient),
      'createdAt': FormControl<DateTime>(value: patientNationality?.createdAt),
      'updatedAt': FormControl<DateTime>(value: patientNationality?.updatedAt),
    });
  }
}
