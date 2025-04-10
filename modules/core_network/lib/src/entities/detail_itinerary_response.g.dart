// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_itinerary_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientTour _$PatientTourFromJson(Map<String, dynamic> json) => PatientTour(
      patientName: json['patientName'] as String?,
      patient: json['patient'] as String?,
      tour: json['tour'] as String?,
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
      isDelete: (json['isDelete'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PatientTourToJson(PatientTour instance) =>
    <String, dynamic>{
      'patientName': instance.patientName,
      'patient': instance.patient,
      'tour': instance.tour,
      'deletedAt': instance.deletedAt?.toIso8601String(),
      'isDelete': instance.isDelete,
    };

DetailItineraryResponse _$DetailItineraryResponseFromJson(
        Map<String, dynamic> json) =>
    DetailItineraryResponse(
      id: json['_id'] as String?,
      patient: (json['patient'] as List<dynamic>?)
          ?.map((e) => Patient.fromJson(e as Map<String, dynamic>))
          .toList(),
      patients: (json['patients'] as List<dynamic>?)
          ?.map((e) => PatientTour.fromJson(e as Map<String, dynamic>))
          .toList(),
      tourName: json['tourName'] as String?,
      peopleNumber: (json['peopleNumber'] as num?)?.toInt(),
      classification: json['classification'] as String?,
      group: (json['group'] as num?)?.toInt(),
      day: (json['day'] as List<dynamic>?)
          ?.map((e) => Day.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DetailItineraryResponseToJson(
        DetailItineraryResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'patient': instance.patient,
      'patients': instance.patients,
      'tourName': instance.tourName,
      'peopleNumber': instance.peopleNumber,
      'group': instance.group,
      'classification': instance.classification,
      'day': instance.day,
    };
