// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_regenerative_medicine_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplicationRegenerativeMedicalRequest
    _$ApplicationRegenerativeMedicalRequestFromJson(
            Map<String, dynamic> json) =>
        ApplicationRegenerativeMedicalRequest(
          diseasePrevention: json['diseasePrevention'] as bool?,
          relapsePrevention: json['relapsePrevention'] as bool?,
          antiAging: json['antiAging'] as bool?,
          beauty: json['beauty'] as bool?,
          increaseImmunity: json['increaseImmunity'] as bool?,
          date1: json['date1'] == null
              ? null
              : DateTime.parse(json['date1'] as String),
          date2: json['date2'] == null
              ? null
              : DateTime.parse(json['date2'] as String),
          date3: json['date3'] == null
              ? null
              : DateTime.parse(json['date3'] as String),
          noDesiredDate: json['noDesiredDate'] as bool?,
          remarks: json['remarks'] as String?,
          people: (json['people'] as num?)?.toInt(),
          age: (json['age'] as num?)?.toInt(),
          sex: json['sex'] as bool?,
          relationship: json['relationship'] as String?,
          atten: json['atten'] as bool?,
          desiredArea: json['desiredArea'] as String?,
          reason: json['reason'] as String?,
          stemCellTherapy: json['stemCellTherapy'] as bool?,
          stemCellTherapy1: json['stemCellTherapy1'] as bool?,
          stemCellTherapy2: json['stemCellTherapy2'] as bool?,
          freeInput: json['freeInput'] as String?,
          fibroblastTherapy: json['fibroblastTherapy'] as bool?,
          prpTherapy: json['prpTherapy'] as bool?,
          others: json['others'] as String?,
          currentlyConcerned: json['currentlyConcerned'] as String?,
          medicine: json['medicine'] as bool?,
          item1: json['item1'] as bool?,
          item2: json['item2'] as bool?,
          item3: json['item3'] as bool?,
          item4: json['item4'] as bool?,
          item5: json['item5'] as bool?,
          others1: json['others1'] as String?,
          receive1: json['receive1'] as bool?,
          receive2: json['receive2'] as bool?,
          countryOther: json['countryOther'] as String?,
          brokerageCompany: json['brokerageCompany'] as String?,
          historyCancer: json['historyCancer'] as bool?,
          cancerSite: json['cancerSite'] as String?,
          currentHealth: json['currentHealth'] as bool?,
          detail: json['detail'] as String?,
          currentHealth1: json['currentHealth1'] as bool?,
          detail1: json['detail1'] as String?,
          medicalInformation: json['medicalInformation'] as bool?,
          dicomImage: json['dicomImage'] as bool?,
          otherTest: json['otherTest'] as bool?,
          detail2: json['detail2'] as String?,
          readio: json['readio'] as String?,
          privetcy: json['privetcy'] as bool?,
          nameDrug: (json['nameDrug'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
        );

Map<String, dynamic> _$ApplicationRegenerativeMedicalRequestToJson(
        ApplicationRegenerativeMedicalRequest instance) =>
    <String, dynamic>{
      'diseasePrevention': instance.diseasePrevention,
      'relapsePrevention': instance.relapsePrevention,
      'antiAging': instance.antiAging,
      'beauty': instance.beauty,
      'increaseImmunity': instance.increaseImmunity,
      'date1': instance.date1?.toIso8601String(),
      'date2': instance.date2?.toIso8601String(),
      'date3': instance.date3?.toIso8601String(),
      'noDesiredDate': instance.noDesiredDate,
      'remarks': instance.remarks,
      'people': instance.people,
      'age': instance.age,
      'sex': instance.sex,
      'relationship': instance.relationship,
      'atten': instance.atten,
      'desiredArea': instance.desiredArea,
      'reason': instance.reason,
      'stemCellTherapy': instance.stemCellTherapy,
      'stemCellTherapy1': instance.stemCellTherapy1,
      'stemCellTherapy2': instance.stemCellTherapy2,
      'freeInput': instance.freeInput,
      'fibroblastTherapy': instance.fibroblastTherapy,
      'prpTherapy': instance.prpTherapy,
      'others': instance.others,
      'currentlyConcerned': instance.currentlyConcerned,
      'medicine': instance.medicine,
      'item1': instance.item1,
      'item2': instance.item2,
      'item3': instance.item3,
      'item4': instance.item4,
      'item5': instance.item5,
      'others1': instance.others1,
      'receive1': instance.receive1,
      'receive2': instance.receive2,
      'countryOther': instance.countryOther,
      'brokerageCompany': instance.brokerageCompany,
      'historyCancer': instance.historyCancer,
      'cancerSite': instance.cancerSite,
      'currentHealth': instance.currentHealth,
      'detail': instance.detail,
      'currentHealth1': instance.currentHealth1,
      'detail1': instance.detail1,
      'medicalInformation': instance.medicalInformation,
      'dicomImage': instance.dicomImage,
      'otherTest': instance.otherTest,
      'detail2': instance.detail2,
      'readio': instance.readio,
      'privetcy': instance.privetcy,
      'nameDrug': instance.nameDrug,
    };
