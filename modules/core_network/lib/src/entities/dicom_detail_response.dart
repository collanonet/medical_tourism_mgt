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

  // Getters for MainDicomTags properties
  int? get numberOfFrames => mainDicomTags.numberOfFrames != null 
      ? int.tryParse(mainDicomTags.numberOfFrames!) 
      : null;
  String? get instanceNumber => mainDicomTags.instanceNumber;
  String? get instanceCreationDate => mainDicomTags.instanceCreationDate;
  String? get instanceCreationTime => mainDicomTags.instanceCreationTime;
  String? get sopInstanceUID => mainDicomTags.sopInstanceUID;

  // Placeholder getters for patient and study information
  // These should be populated from actual DICOM metadata when available
  String? get patientName => null;
  String? get patientId => null;
  String? get patientSex => null;
  DateTime? get patientBirthDate => null;
  DateTime? get acquisitionDate => _parseDate(instanceCreationDate);
  String? get acquisitionTime => instanceCreationTime;
  int? get acquisitionNumber => null;
  String? get seriesDescription => null;
  int? get seriesNumber => null;
  String? get studyDescription => null;
  String? get studyId => null;
  String? get institutionName => null;
  double? get sliceThickness => null;
  String? get imagePositionPatient => null;

  // Helper method to parse DICOM date format (YYYYMMDD) to DateTime
  DateTime? _parseDate(String? dateString) {
    if (dateString == null || dateString.isEmpty) return null;
    try {
      if (dateString.length >= 8) {
        final year = int.parse(dateString.substring(0, 4));
        final month = int.parse(dateString.substring(4, 6));
        final day = int.parse(dateString.substring(6, 8));
        return DateTime(year, month, day);
      }
    } catch (e) {
      // If parsing fails, return null
    }
    return null;
  }
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
