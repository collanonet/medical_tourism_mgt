import 'package:json_annotation/json_annotation.dart';

part 'patient_name_request.g.dart';

@JsonSerializable()
class PatientNameRequest {
   String? familyName;
   String? middleName;
   String? firstName;
   String? nameType;
   String? patient;

  PatientNameRequest({
     this.familyName,
     this.middleName,
     this.firstName,
     this.nameType,
     this.patient,
  });

  factory PatientNameRequest.fromJson(Map<String, dynamic> json) {
    return _$PatientNameRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PatientNameRequestToJson(this);
}