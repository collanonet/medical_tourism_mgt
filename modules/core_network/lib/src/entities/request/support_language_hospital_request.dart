import 'package:json_annotation/json_annotation.dart';

part 'support_language_hospital_request.g.dart';

@JsonSerializable()
class SupportLanguageHospitalRequest {
  @JsonKey(name: '_id')
  String? id;
  String? hospital;
  String supportLanguage;
  bool foreignStaff;
  bool medicalInterpretationSupport;

  SupportLanguageHospitalRequest({
    this.id,
    this.hospital,
    required this.supportLanguage,
    required this.foreignStaff,
    required this.medicalInterpretationSupport,
  });

  factory SupportLanguageHospitalRequest.fromJson(Map<String, dynamic> json) =>
      _$SupportLanguageHospitalRequestFromJson(json);
  Map<String, dynamic> toJson() => _$SupportLanguageHospitalRequestToJson(this);
}

extension SupportLanguageHospitalRequestExtension
    on SupportLanguageHospitalRequest {
  SupportLanguageHospitalRequest copyWith({
    String? hospital,
    String? supportLanguage,
    bool? foreignStaff,
    bool? medicalInterpretationSupport,
  }) {
    return SupportLanguageHospitalRequest(
      id: id,
      hospital: hospital ?? this.hospital,
      supportLanguage: supportLanguage ?? this.supportLanguage,
      foreignStaff: foreignStaff ?? this.foreignStaff,
      medicalInterpretationSupport:
          medicalInterpretationSupport ?? this.medicalInterpretationSupport,
    );
  }
}
