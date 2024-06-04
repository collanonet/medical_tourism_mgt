// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_blood_purification_therapy_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplicationBloodPurificationTherapyResponse
    _$ApplicationBloodPurificationTherapyResponseFromJson(
            Map<String, dynamic> json) =>
        ApplicationBloodPurificationTherapyResponse(
          id: json['_id'] as String,
          purposeOfCommission1: json['purposeOfCommission1'] as bool?,
          purposeOfCommission2: json['purposeOfCommission2'] as bool?,
          purposeOfCommission3: json['purposeOfCommission3'] as bool?,
          purposeOfCommission4: json['purposeOfCommission4'] as bool?,
          purposeOfCommission5: json['purposeOfCommission5'] as bool?,
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
          remarks: json['remarks'] as String?,
          people: (json['people'] as num?)?.toInt(),
          age: (json['age'] as num?)?.toInt(),
          sex: json['sex'] as bool?,
          relationship: json['relationship'] as String?,
          attend: json['attend'] as bool?,
          desiredArea: json['desiredArea'] as String?,
          reason: json['reason'] as String?,
          menu1: json['menu1'] as bool?,
          menu2: json['menu2'] as bool?,
          menu3: json['menu3'] as bool?,
          others: json['others'] as String?,
          concern: json['concern'] as String?,
          question: json['question'] as bool?,
          item1: json['item1'] as bool?,
          item2: json['item2'] as bool?,
          item3: json['item3'] as bool?,
          others1: json['others1'] as String?,
          pleaceReceive1: json['pleaceReceive1'] as bool?,
          pleaceReceive2: json['pleaceReceive2'] as bool?,
          otherCountry: json['otherCountry'] as String?,
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
          dicom: json['dicom'] as bool?,
          otherTestData: json['otherTestData'] as bool?,
          detail2: json['detail2'] as String?,
          privetcy: json['privetcy'] as bool?,
          ifwoman: json['ifwoman'] as String?,
        );

Map<String, dynamic> _$ApplicationBloodPurificationTherapyResponseToJson(
        ApplicationBloodPurificationTherapyResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'purposeOfCommission1': instance.purposeOfCommission1,
      'purposeOfCommission2': instance.purposeOfCommission2,
      'purposeOfCommission3': instance.purposeOfCommission3,
      'purposeOfCommission4': instance.purposeOfCommission4,
      'purposeOfCommission5': instance.purposeOfCommission5,
      'date1': instance.date1?.toIso8601String(),
      'date2': instance.date2?.toIso8601String(),
      'date3': instance.date3?.toIso8601String(),
      'noDate': instance.noDate,
      'remarks': instance.remarks,
      'people': instance.people,
      'age': instance.age,
      'sex': instance.sex,
      'relationship': instance.relationship,
      'attend': instance.attend,
      'desiredArea': instance.desiredArea,
      'reason': instance.reason,
      'menu1': instance.menu1,
      'menu2': instance.menu2,
      'menu3': instance.menu3,
      'others': instance.others,
      'concern': instance.concern,
      'question': instance.question,
      'item1': instance.item1,
      'item2': instance.item2,
      'item3': instance.item3,
      'others1': instance.others1,
      'pleaceReceive1': instance.pleaceReceive1,
      'pleaceReceive2': instance.pleaceReceive2,
      'otherCountry': instance.otherCountry,
      'introducer': instance.introducer,
      'historyCancer': instance.historyCancer,
      'cancerSite': instance.cancerSite,
      'treatmentDetail': instance.treatmentDetail,
      'detail': instance.detail,
      'treatmentDetail1': instance.treatmentDetail1,
      'detail1': instance.detail1,
      'drugName': instance.drugName,
      'dicom': instance.dicom,
      'otherTestData': instance.otherTestData,
      'detail2': instance.detail2,
      'privetcy': instance.privetcy,
      'ifwoman': instance.ifwoman,
    };
