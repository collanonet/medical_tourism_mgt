import 'package:json_annotation/json_annotation.dart';

part 'material_hospital_response.g.dart';

@JsonSerializable()
class MaterialHospitalResponse {
  @JsonKey(name: '_id')
  final String? id;
   String? file;
   String? brochureName;
   String? author;
   DateTime? dateOfIssue;
   String? share;

  MaterialHospitalResponse({
    this.id,
    this.file,
    this.brochureName,
    this.author,
    this.dateOfIssue,
    this.share,
  });

  factory MaterialHospitalResponse.fromJson(Map<String, dynamic> json) =>
      _$MaterialHospitalResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MaterialHospitalResponseToJson(this);
}
