// Package imports:
import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'value')
enum PassportType {
  medicalGuarantee('medicalGuarantee'),
  other('other');

  const PassportType(this.value);

  final String value;
}
