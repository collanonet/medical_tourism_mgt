// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'treatment_menu_tax.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaxModel _$TaxModelFromJson(Map<String, dynamic> json) => TaxModel(
      id: json['_id'] as String?,
      cost: (json['cost'] as num).toDouble(),
      tax: (json['tax'] as num).toInt(),
    );

Map<String, dynamic> _$TaxModelToJson(TaxModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', instance.id);
  val['cost'] = instance.cost;
  val['tax'] = instance.tax;
  return val;
}
