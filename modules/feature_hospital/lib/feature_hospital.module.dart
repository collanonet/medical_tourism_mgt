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
import 'src/detail/tabs/contract/contrant_model.dart' as _i13;
import 'src/detail/tabs/document/document_model.dart' as _i11;
import 'src/detail/tabs/facility_photo/facility_photo_model.dart' as _i10;
import 'src/detail/tabs/health_checkup/health_checkup_model.dart' as _i12;
import 'src/detail/tabs/materials/material_model.dart' as _i6;
import 'src/detail/tabs/q_and_a/g_and_a_model.dart' as _i7;
import 'src/detail/tabs/web_reservation/web_reservation_model.dart' as _i8;
import 'src/hospital_model.dart' as _i9;

class FeatureHospitalPackageModule extends _i1.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    gh.factory<_i3.HospitalDetailModel>(() => _i3.HospitalDetailModel(
        hospitalRepository: gh<_i4.HospitalRepository>()));
    gh.factory<_i5.BasicInformationModel>(() => _i5.BasicInformationModel(
        hospitalRepository: gh<_i4.HospitalRepository>()));
    gh.factory<_i6.MaterialsModel>(() =>
        _i6.MaterialsModel(hospitalRepository: gh<_i4.HospitalRepository>()));
    gh.factory<_i7.QAndAModel>(
        () => _i7.QAndAModel(hospitalRepository: gh<_i4.HospitalRepository>()));
    gh.factory<_i8.WebReservationModel>(() => _i8.WebReservationModel(
        hospitalRepository: gh<_i4.HospitalRepository>()));
    gh.factory<_i9.HospitalModel>(() =>
        _i9.HospitalModel(hospitalRepository: gh<_i4.HospitalRepository>()));
    gh.factory<_i10.FacilityModel>(() =>
        _i10.FacilityModel(hospitalRepository: gh<_i4.HospitalRepository>()));
    gh.factory<_i11.DocumentModel>(() =>
        _i11.DocumentModel(hospitalRepository: gh<_i4.HospitalRepository>()));
    gh.factory<_i12.HealthModel>(() =>
        _i12.HealthModel(hospitalRepository: gh<_i4.HospitalRepository>()));
    gh.factory<_i13.ContrantModel>(() =>
        _i13.ContrantModel(hospitalRepository: gh<_i4.HospitalRepository>()));
  }
}
