//@GeneratedMicroModule;FeaturePatientPackageModule;package:feature_patient/feature_patient.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:data_patient/data_patient.dart' as _i4;
import 'package:injectable/injectable.dart' as _i1;

import 'src/detail_patient/basic_info/basic_info_model.dart' as _i3;
import 'src/detail_patient/detail_patient_model.dart' as _i5;
import 'src/detail_patient/domestic_medical_data/domestic_medical_data_model.dart'
    as _i6;
import 'src/detail_patient/estimate/estimate_model.dart' as _i7;
import 'src/detail_patient/medical_payment_details/medical_payment_details_model.dart'
    as _i8;
import 'src/detail_patient/medical_summary/medical_summary_model.dart' as _i9;
import 'src/detail_patient/medical_visa/medical_visa_model.dart' as _i10;
import 'src/detail_patient/overseas_medical_data/overseas_medical_data_model.dart'
    as _i11;
import 'src/detail_patient/progress_list/progress_list_model.dart' as _i14;
import 'src/detail_patient/statement/statement_model.dart' as _i15;
import 'src/patient/patient_model.dart' as _i12;
import 'src/pre_patient/pre_patient_model.dart' as _i13;

class FeaturePatientPackageModule extends _i1.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    gh.factory<_i3.BasicInformationModel>(() => _i3.BasicInformationModel(
        patientRepository: gh<_i4.PatientRepository>()));
    gh.factory<_i5.DetailPatientModel>(() =>
        _i5.DetailPatientModel(patientRepository: gh<_i4.PatientRepository>()));
    gh.factory<_i6.DomesticMedicalDataModel>(() => _i6.DomesticMedicalDataModel(
        patientRepository: gh<_i4.PatientRepository>()));
    gh.factory<_i7.EstimateModel>(() =>
        _i7.EstimateModel(patientRepository: gh<_i4.PatientRepository>()));
    gh.factory<_i8.MedicalPaymentDetailModel>(() =>
        _i8.MedicalPaymentDetailModel(
            patientRepository: gh<_i4.PatientRepository>()));
    gh.factory<_i9.MedicalSummaryModel>(() => _i9.MedicalSummaryModel(
        patientRepository: gh<_i4.PatientRepository>()));
    gh.factory<_i10.MedicalVisaModel>(() =>
        _i10.MedicalVisaModel(patientRepository: gh<_i4.PatientRepository>()));
    gh.factory<_i11.OverseasMedicalDataModel>(() =>
        _i11.OverseasMedicalDataModel(
            patientRepository: gh<_i4.PatientRepository>()));
    gh.factory<_i12.PatientModel>(() =>
        _i12.PatientModel(patientRepository: gh<_i4.PatientRepository>()));
    gh.factory<_i13.PrePatientModel>(() =>
        _i13.PrePatientModel(patientRepository: gh<_i4.PatientRepository>()));
    gh.factory<_i14.ProgressListModel>(() =>
        _i14.ProgressListModel(patientRepository: gh<_i4.PatientRepository>()));
    gh.factory<_i15.StatementModel>(() =>
        _i15.StatementModel(patientRepository: gh<_i4.PatientRepository>()));
  }
}
