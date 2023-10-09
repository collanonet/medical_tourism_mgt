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
import 'src/detail_patient/billing/billing_model.dart' as _i5;
import 'src/detail_patient/detail_patient_model.dart' as _i6;
import 'src/detail_patient/domestic_medical_data/domestic_medical_data_model.dart'
    as _i7;
import 'src/detail_patient/estimate/estimate_model.dart' as _i8;
import 'src/detail_patient/medical_payment_details/medical_payment_details_model.dart'
    as _i9;
import 'src/detail_patient/medical_summary/medical_summary_model.dart' as _i10;
import 'src/detail_patient/medical_visa/medical_visa_model.dart' as _i11;
import 'src/detail_patient/overseas_medical_data/overseas_medical_data_model.dart'
    as _i12;
import 'src/detail_patient/progress_list/progress_list_model.dart' as _i15;
import 'src/detail_patient/statement/statement_model.dart' as _i16;
import 'src/patient/patient_model.dart' as _i13;
import 'src/pre_patient/pre_patient_model.dart' as _i14;

class FeaturePatientPackageModule extends _i1.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    gh.factory<_i3.BasicInformationModel>(() => _i3.BasicInformationModel(
        patientRepository: gh<_i4.PatientRepository>()));
    gh.factory<_i5.BillingModel>(
        () => _i5.BillingModel(patientRepository: gh<_i4.PatientRepository>()));
    gh.factory<_i6.DetailPatientModel>(() =>
        _i6.DetailPatientModel(patientRepository: gh<_i4.PatientRepository>()));
    gh.factory<_i7.DomesticMedicalDataModel>(() => _i7.DomesticMedicalDataModel(
        patientRepository: gh<_i4.PatientRepository>()));
    gh.factory<_i8.EstimateModel>(() =>
        _i8.EstimateModel(patientRepository: gh<_i4.PatientRepository>()));
    gh.factory<_i9.MedicalPaymentDetailModel>(() =>
        _i9.MedicalPaymentDetailModel(
            patientRepository: gh<_i4.PatientRepository>()));
    gh.factory<_i10.MedicalSummaryModel>(() => _i10.MedicalSummaryModel(
        patientRepository: gh<_i4.PatientRepository>()));
    gh.factory<_i11.MedicalVisaModel>(() =>
        _i11.MedicalVisaModel(patientRepository: gh<_i4.PatientRepository>()));
    gh.factory<_i12.OverseasMedicalDataModel>(() =>
        _i12.OverseasMedicalDataModel(
            patientRepository: gh<_i4.PatientRepository>()));
    gh.factory<_i13.PatientModel>(() =>
        _i13.PatientModel(patientRepository: gh<_i4.PatientRepository>()));
    gh.factory<_i14.PrePatientModel>(() =>
        _i14.PrePatientModel(patientRepository: gh<_i4.PatientRepository>()));
    gh.factory<_i15.ProgressListModel>(() =>
        _i15.ProgressListModel(patientRepository: gh<_i4.PatientRepository>()));
    gh.factory<_i16.StatementModel>(() =>
        _i16.StatementModel(patientRepository: gh<_i4.PatientRepository>()));
  }
}
