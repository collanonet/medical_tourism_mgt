// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_upload_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileUploadRequest _$FileUploadRequestFromJson(Map<String, dynamic> json) =>
    FileUploadRequest(
      filename: json['filename'] as String,
      file: json['file'] as String,
    );

Map<String, dynamic> _$FileUploadRequestToJson(FileUploadRequest instance) =>
    <String, dynamic>{
      'filename': instance.filename,
      'file': instance.file,
    };
