import 'package:json_annotation/json_annotation.dart';

part 'dicom_detail_response.g.dart';

@JsonSerializable()
class DicomDetailResponse {
  @JsonKey(name: 'FileSize')
  final int fileSize;
  @JsonKey(name: 'FileUuid')
  final String fileUuid;
  @JsonKey(name: 'ID')
  final String id;
  @JsonKey(name: 'IndexInSeries')
  final int? indexInSeries;
  @JsonKey(name: 'MainDicomTags')
  final MainDicomTags mainDicomTags;
  @JsonKey(name: 'ParentSeries')
  final String parentSeries;
  @JsonKey(name: 'Type')
  final String type;

  DicomDetailResponse({
    required this.fileSize,
    required this.fileUuid,
    required this.id,
    this.indexInSeries,
    required this.mainDicomTags,
    required this.parentSeries,
    required this.type,
  });

  factory DicomDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$DicomDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DicomDetailResponseToJson(this);
}

@JsonSerializable()
class MainDicomTags {
  @JsonKey(name: 'InstanceNumber')
  final String instanceNumber;
  @JsonKey(name: 'NumberOfFrames')
  final String numberOfFrames;
  @JsonKey(name: 'SOPInstanceUID')
  final String sopInstanceUID;

  MainDicomTags({
    required this.instanceNumber,
    required this.numberOfFrames,
    required this.sopInstanceUID,
  });

  factory MainDicomTags.fromJson(Map<String, dynamic> json) =>
      _$MainDicomTagsFromJson(json);

  Map<String, dynamic> toJson() => _$MainDicomTagsToJson(this);
}
