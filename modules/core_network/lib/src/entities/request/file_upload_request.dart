// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'file_upload_request.g.dart';

@JsonSerializable()
class FileUploadRequest {
  final String filename;
  final String file;

  FileUploadRequest({
    required this.filename,
    required this.file,
  });

  factory FileUploadRequest.fromJson(Map<String, dynamic> json) {
    return _$FileUploadRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FileUploadRequestToJson(this);
}
