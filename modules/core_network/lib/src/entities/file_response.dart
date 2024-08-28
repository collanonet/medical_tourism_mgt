// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'file_response.g.dart';

@JsonSerializable()
class FileResponse {
  final String filename;

  FileResponse({required this.filename});

  factory FileResponse.fromJson(Map<String, dynamic> json) {
    return _$FileResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FileResponseToJson(this);
}
