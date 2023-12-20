//@GeneratedMicroModule;FeaturePatientPackageModule;package:feature_patient/feature_patient.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:data_patient/data_patient.dart' as _i4;
import 'package:injectable/injectable.dart' as _i1;

import 'src/detail_patient/basic_info/basic_info_model.dart' as _i5;
import 'src/detail_patient/billing/billing_model.dart' as _i6;
import 'src/detail_patient/detail_patient_model.dart' as _i7;
import 'src/detail_patient/domestic_medical_data/domestic_medical_data_model.dart'
    as _i8;
import 'src/detail_patient/estimate/estimate_model.dart' as _i9;
import 'src/detail_patient/medical_payment_details/medical_payment_details_model.dart'
    as _i10;
import 'src/detail_patient/medical_summary/medical_summary_model.dart' as _i11;
import 'src/detail_patient/medical_summary/tabs/auto_translate_model.dart'
    as _i3;
import 'src/detail_patient/medical_summary/tabs/normal_summary_model.dart'
    as _i13;
import 'src/detail_patient/medical_summary/tabs/pick_medical_data_file_model.dart'
    as _i17;
import 'src/detail_patient/medical_summary/tabs/short_summary_model.dart'
    as _i21;
import 'src/detail_patient/medical_summary/tabs/summary_list_model.dart'
    as _i23;
import 'src/detail_patient/medical_visa/medical_visa_model.dart' as _i12;
import 'src/detail_patient/overseas_medical_data/overseas_medical_data_model.dart'
    as _i14;
import 'src/detail_patient/patient_response_data/patient_response_model.dart'
    as _i16;
import 'src/detail_patient/progress_list/progress_list_model.dart' as _i19;
import 'src/detail_patient/proposal/proposal_model.dart' as _i20;
import 'src/detail_patient/statement/statement_model.dart' as _i22;
import 'src/patient/patient_model.dart' as _i15;
import 'src/pre_patient/pre_patient_model.dart' as _i18;

class FeaturePatientPackageModule extends _i1.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    gh.factory<_i3.AutoTranslateModel>(() =>
        _i3.AutoTranslateModel(patientRepository: gh<_i4.PatientRepository>()));
    gh.factory<_i5.BasicInformationModel>(() => _i5.BasicInformationModel(
        patientRepository: gh<_i4.PatientRepository>()));
    gh.factory<_i6.BillingModel>(
        () => _i6.BillingModel(patientRepository: gh<_i4.PatientRepository>()));
    gh.factory<_i7.DetailPatientModel>(() =>
        _i7.DetailPatientModel(patientRepository: gh<_i4.PatientRepository>()));
    gh.factory<_i8.DomesticMedicalDataModel>(() => _i8.DomesticMedicalDataModel(
        patientRepository: gh<_i4.PatientRepository>()));
    gh.factory<_i9.EstimateModel>(() =>
        _i9.EstimateModel(patientRepository: gh<_i4.PatientRepository>()));
    gh.factory<_i10.MedicalPaymentDetailModel>(() =>
        _i10.MedicalPaymentDetailModel(
            patientRepository: gh<_i4.PatientRepository>()));
    gh.factory<_i11.MedicalSummaryModel>(() => _i11.MedicalSummaryModel(
        patientRepository: gh<_i4.PatientRepository>()));
    gh.factory<_i12.MedicalVisaModel>(() =>
        _i12.MedicalVisaModel(patientRepository: gh<_i4.PatientRepository>()));
    gh.factory<_i13.NormalSummaryModel>(() => _i13.NormalSummaryModel(
        patientRepository: gh<_i4.PatientRepository>()));
    gh.factory<_i14.OverseasMedicalDataModel>(() =>
        _i14.OverseasMedicalDataModel(
            patientRepository: gh<_i4.PatientRepository>()));
    gh.factory<_i15.PatientModel>(() =>
        _i15.PatientModel(patientRepository: gh<_i4.PatientRepository>()));
    gh.factory<_i16.PatientResponseModel>(() => _i16.PatientResponseModel(
        patientRepository: gh<_i4.PatientRepository>()));
    gh.factory<_i17.PickMedicalDataFileModel>(() =>
        _i17.PickMedicalDataFileModel(
            patientRepository: gh<_i4.PatientRepository>()));
    gh.factory<_i18.PrePatientModel>(() =>
        _i18.PrePatientModel(patientRepository: gh<_i4.PatientRepository>()));
    gh.factory<_i19.ProgressListModel>(() =>
        _i19.ProgressListModel(patientRepository: gh<_i4.PatientRepository>()));
    gh.factory<_i20.ProposalModel>(() =>
        _i20.ProposalModel(patientRepository: gh<_i4.PatientRepository>()));
    gh.factory<_i21.ShortSummaryModel>(() =>
        _i21.ShortSummaryModel(patientRepository: gh<_i4.PatientRepository>()));
    gh.factory<_i22.StatementModel>(() =>
        _i22.StatementModel(patientRepository: gh<_i4.PatientRepository>()));
    gh.factory<_i23.SummaryListModel>(() =>
        _i23.SummaryListModel(patientRepository: gh<_i4.PatientRepository>()));
  }
}
