//@GeneratedMicroModule;FeatureHospitalPackageModule;package:feature_hospital/feature_hospital.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:data_hospital/data_hospital.dart' as _i4;
import 'package:injectable/injectable.dart' as _i1;

import 'src/detail/hospital_detail_model.dart' as _i3;
import 'src/detail/tabs/basic_information/basic_information_model.dart' as _i5;
import 'src/detail/tabs/contract/contrant_model.dart' as _i6;
import 'src/detail/tabs/document/document_model.dart' as _i7;
import 'src/detail/tabs/facility_photo/facility_photo_model.dart' as _i8;
import 'src/detail/tabs/health_checkup/health_checkup_model.dart' as _i9;
import 'src/detail/tabs/materials/material_model.dart' as _i10;
import 'src/detail/tabs/q_and_a/g_and_a_model.dart' as _i11;
import 'src/detail/tabs/treatment/treatment_model.dart' as _i12;
import 'src/detail/tabs/web_reservation/web_reservation_model.dart' as _i14;
import 'src/hospital_model.dart' as _i13;

class FeatureHospitalPackageModule extends _i1.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    gh.factory<_i3.HospitalDetailModel>(() => _i3.HospitalDetailModel(
        hospitalRepository: gh<_i4.HospitalRepository>()));
    gh.factory<_i5.BasicInformationModel>(() => _i5.BasicInformationModel(
        hospitalRepository: gh<_i4.HospitalRepository>()));
    gh.factory<_i6.ContrantModel>(() =>
        _i6.ContrantModel(hospitalRepository: gh<_i4.HospitalRepository>()));
    gh.factory<_i7.DocumentModel>(() =>
        _i7.DocumentModel(hospitalRepository: gh<_i4.HospitalRepository>()));
    gh.factory<_i8.FacilityModel>(() =>
        _i8.FacilityModel(hospitalRepository: gh<_i4.HospitalRepository>()));
    gh.factory<_i9.HealthModel>(() =>
        _i9.HealthModel(hospitalRepository: gh<_i4.HospitalRepository>()));
    gh.factory<_i10.MaterialsModel>(() =>
        _i10.MaterialsModel(hospitalRepository: gh<_i4.HospitalRepository>()));
    gh.factory<_i11.QAndAModel>(() =>
        _i11.QAndAModel(hospitalRepository: gh<_i4.HospitalRepository>()));
    gh.factory<_i12.TreatmentModel>(() =>
        _i12.TreatmentModel(hospitalRepository: gh<_i4.HospitalRepository>()));
    gh.factory<_i13.HospitalModel>(() =>
        _i13.HospitalModel(hospitalRepository: gh<_i4.HospitalRepository>()));
    gh.factory<_i14.WebAppointmentDetailModel>(() =>
        _i14.WebAppointmentDetailModel(
            repository: gh<_i4.HospitalRepository>()));
  }
}
