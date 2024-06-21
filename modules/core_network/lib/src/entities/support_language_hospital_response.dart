import 'package:json_annotation/json_annotation.dart';

part 'support_language_hospital_response.g.dart';

@JsonSerializable()
class SupportLanguageHospitalResponse {
  @JsonKey(name: '_id')
  String? id;
  String? hospital;
  String supportLanguage;
  bool foreignStaff;
  bool medicalInterpretationSupport;

  SupportLanguageHospitalResponse({
    this.id,
    this.hospital,
    required this.supportLanguage,
    required this.foreignStaff,
    required this.medicalInterpretationSupport,
  });

  factory SupportLanguageHospitalResponse.fromJson(Map<String, dynamic> json) =>
      _$SupportLanguageHospitalResponseFromJson(json);
  Map<String, dynamic> toJson() =>
      _$SupportLanguageHospitalResponseToJson(this);
}

extension SupportLanguageHospitalResponseExt
    on SupportLanguageHospitalResponse {
  SupportLanguageHospitalResponse copyWith({
    String? id,
    String? hospital,
    String? supportLanguage,
    bool? foreignStaff,
    bool? medicalInterpretationSupport,
  }) {
    return SupportLanguageHospitalResponse(
      id: id ?? this.id,
      hospital: hospital ?? this.hospital,
      supportLanguage: supportLanguage ?? this.supportLanguage,
      foreignStaff: foreignStaff ?? this.foreignStaff,
      medicalInterpretationSupport:
          medicalInterpretationSupport ?? this.medicalInterpretationSupport,
    );
  }
}
