import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'value')
enum Currency {
  usd('USD'),
  khr('KHR');

  const Currency(this.value);

  final String value;
}
