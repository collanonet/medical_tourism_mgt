// Package imports:
import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'value')
enum Gender {
  male('male'),
  female('female');

  const Gender(this.value);

  final String value;
}
