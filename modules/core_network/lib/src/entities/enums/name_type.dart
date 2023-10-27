import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'value')
enum NameType {
  romanized('romanized'),
  chineseOrVietnamese('chineseOrVietnamese'),
  japaneseForChinese('japaneseForChinese'),
  japaneseForNonChinese('japaneseForNonChinese');

  const NameType(this.value);

  final String value;
}
