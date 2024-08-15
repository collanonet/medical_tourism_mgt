import 'package:json_annotation/json_annotation.dart';

part 'patient_nationality_request.g.dart';

@JsonSerializable()
class PatientNationalityRequest {
  String? nationality;
  String? nativeLanguage;
  String? residentialArea;
  String? currentAddress;
  String? mobileNumber;
  String? email;
  List<String?>? chatToolLink;
  String? chatQrImage;
  String? patient;

  PatientNationalityRequest({
    this.nationality,
    this.nativeLanguage,
    this.residentialArea,
    this.currentAddress,
    this.mobileNumber,
    this.email,
    this.chatToolLink,
    this.patient,
    this.chatQrImage,
  });

  factory PatientNationalityRequest.fromJson(Map<String, dynamic> json) {
    return _$PatientNationalityRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PatientNationalityRequestToJson(this);
}
