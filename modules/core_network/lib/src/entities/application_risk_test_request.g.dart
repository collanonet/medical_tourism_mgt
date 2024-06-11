// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_risk_test_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplicationRiskTestRequest _$ApplicationRiskTestRequestFromJson(
        Map<String, dynamic> json) =>
    ApplicationRiskTestRequest(
      date1: json['date1'] == null
          ? null
          : DateTime.parse(json['date1'] as String),
      date2: json['date2'] == null
          ? null
          : DateTime.parse(json['date2'] as String),
      date3: json['date3'] == null
          ? null
          : DateTime.parse(json['date3'] as String),
      noDate: json['noDate'] as bool?,
      remark: json['remark'] as String?,
      people: json['people'] as int?,
      age: json['age'] as int?,
      sex: json['sex'] as bool?,
      relationship: json['relationship'] as String?,
      menu1: json['menu1'] as bool?,
      menu2: json['menu2'] as bool?,
      menu3: json['menu3'] as bool?,
      menu4: json['menu4'] as bool?,
      menu5: json['menu5'] as bool?,
      menu6: json['menu6'] as bool?,
      menu7: json['menu7'] as bool?,
      menu8: json['menu8'] as bool?,
      menu9: json['menu9'] as bool?,
      menu10: json['menu10'] as bool?,
      menu11: json['menu11'] as bool?,
      menu12: json['menu12'] as bool?,
      menu13: json['menu13'] as bool?,
      others: json['others'] as String?,
      concern: json['concern'] as String?,
      introducer: json['introducer'] as String?,
      historyCancer: json['historyCancer'] as bool?,
      cancerSite: json['cancerSite'] as String?,
      treatmentDetail: json['treatmentDetail'] as bool?,
      detail: json['detail'] as String?,
      treatmentDetail1: json['treatmentDetail1'] as bool?,
      detail1: json['detail1'] as String?,
      drugName: (json['drugName'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      privetcy: json['privetcy'] as bool?,
      ifwoman: json['ifwoman'] as String?,
      medicalRecord: json['medicalRecord'] as String?,
    );

Map<String, dynamic> _$ApplicationRiskTestRequestToJson(
        ApplicationRiskTestRequest instance) =>
    <String, dynamic>{
      'date1': instance.date1?.toIso8601String(),
      'date2': instance.date2?.toIso8601String(),
      'date3': instance.date3?.toIso8601String(),
      'noDate': instance.noDate,
      'remark': instance.remark,
      'people': instance.people,
      'age': instance.age,
      'sex': instance.sex,
      'relationship': instance.relationship,
      'menu1': instance.menu1,
      'menu2': instance.menu2,
      'menu3': instance.menu3,
      'menu4': instance.menu4,
      'menu5': instance.menu5,
      'menu6': instance.menu6,
      'menu7': instance.menu7,
      'menu8': instance.menu8,
      'menu9': instance.menu9,
      'menu10': instance.menu10,
      'menu11': instance.menu11,
      'menu12': instance.menu12,
      'menu13': instance.menu13,
      'others': instance.others,
      'concern': instance.concern,
      'introducer': instance.introducer,
      'historyCancer': instance.historyCancer,
      'cancerSite': instance.cancerSite,
      'treatmentDetail': instance.treatmentDetail,
      'detail': instance.detail,
      'treatmentDetail1': instance.treatmentDetail1,
      'detail1': instance.detail1,
      'drugName': instance.drugName,
      'privetcy': instance.privetcy,
      'ifwoman': instance.ifwoman,
      'medicalRecord': instance.medicalRecord,
    };
