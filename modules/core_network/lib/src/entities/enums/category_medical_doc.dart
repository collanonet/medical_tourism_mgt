import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'value')
enum CategoryMedicalDoc {
  imageDataDICOM('imageDataDICOM'),
  medicalConditionData('medicalConditionData');

  const CategoryMedicalDoc(this.value);

  final String value;
}
