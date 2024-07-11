import 'package:json_annotation/json_annotation.dart';
part 'material_hospital_request.g.dart';

@JsonSerializable()
class MaterialHospitalRequest {
  final String? file;
  String? brochureName;
  String? author;
  DateTime? dateOfIssue;
  String? share;
  String hospitalRecord;

  MaterialHospitalRequest({
    this.file,
    this.brochureName,
    this.author,
    this.dateOfIssue,
    this.share,
    required this.hospitalRecord,
  });

  factory MaterialHospitalRequest.fromJson(Map<String, dynamic> json) =>
      _$MaterialHospitalRequestFromJson(json);

  Map<String, dynamic> toJson() => _$MaterialHospitalRequestToJson(this);
}
