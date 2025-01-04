// Package imports:
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

  DicomDetailResponse({
    required this.fileSize,
    required this.fileUuid,
    required this.id,
    this.indexInSeries,
    required this.mainDicomTags,
    required this.parentSeries,
  });

  factory DicomDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$DicomDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DicomDetailResponseToJson(this);
}

@JsonSerializable()
class MainDicomTags {
  @JsonKey(name: 'InstanceNumber')
  final String? instanceNumber;
  @JsonKey(name: 'InstanceCreationDate')
  final String? instanceCreationDate;
  @JsonKey(name: 'InstanceCreationTime')
  final String? instanceCreationTime;
  @JsonKey(name: 'NumberOfFrames')
  final String? numberOfFrames;
  @JsonKey(name: 'SOPInstanceUID')
  final String? sopInstanceUID;

  MainDicomTags({
    this.instanceNumber,
    this.instanceCreationDate,
    this.instanceCreationTime,
    this.numberOfFrames,
    this.sopInstanceUID,
  });

  factory MainDicomTags.fromJson(Map<String, dynamic> json) =>
      _$MainDicomTagsFromJson(json);

  Map<String, dynamic> toJson() => _$MainDicomTagsToJson(this);
}
