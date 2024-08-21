//@GeneratedMicroModule;FeaturePatientPackageModule;package:feature_patient/feature_patient.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:data_patient/data_patient.dart' as _i4;
import 'package:injectable/injectable.dart' as _i1;

import 'src/detail_patient/basic_info/basic_info_model.dart' as _i14;
import 'src/detail_patient/billing/billing_model.dart' as _i28;
import 'src/detail_patient/detail_patient_model.dart' as _i23;
import 'src/detail_patient/domestic_medical_data/domestic_medical_data_model.dart'
    as _i10;
import 'src/detail_patient/estimate/estimate_model.dart' as _i24;
import 'src/detail_patient/medical_payment_details/medical_payment_details_model.dart'
    as _i26;
import 'src/detail_patient/medical_summary/medical_summary_model.dart' as _i9;
import 'src/detail_patient/medical_summary/tabs/auto_translate_model.dart'
    as _i7;
import 'src/detail_patient/medical_summary/tabs/normal_summary_model.dart'
    as _i6;
import 'src/detail_patient/medical_summary/tabs/pick_medical_data_file_model.dart'
    as _i8;
import 'src/detail_patient/medical_summary/tabs/summary_list_model.dart' as _i5;
import 'src/detail_patient/medical_visa/medical_visa_model.dart' as _i25;
import 'src/detail_patient/overseas_medical_data/overseas_medical_data_model.dart'
    as _i12;
import 'src/detail_patient/patient_response_data/patient_response_model.dart'
    as _i22;
import 'src/detail_patient/patient_response_data/tab/application_beauty_model.dart'
    as _i16;
import 'src/detail_patient/patient_response_data/tab/application_blood_purification_therapy_model.dart'
    as _i17;
import 'src/detail_patient/patient_response_data/tab/application_regenerative_medicine_model.dart'
    as _i18;
import 'src/detail_patient/patient_response_data/tab/application_risk_test_model.dart'
    as _i15;
import 'src/detail_patient/patient_response_data/tab/patient_response_medical_checkup_model.dart'
    as _i21;
import 'src/detail_patient/patient_response_data/tab/patient_response_other_model.dart'
    as _i19;
import 'src/detail_patient/patient_response_data/tab/patient_response_treatment_model.dart'
    as _i20;
import 'src/detail_patient/progress_list/progress_list_model.dart' as _i27;
import 'src/detail_patient/proposal/proposal_model.dart' as _i13;
import 'src/detail_patient/statement/statement_model.dart' as _i11;
import 'src/detail_patient/web_reservation/detail_patient_web_reservation_model.dart'
    as _i30;
import 'src/patient/patient_model.dart' as _i3;
import 'src/pre_patient/pre_patient_model.dart' as _i29;

class FeaturePatientPackageModule extends _i1.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    gh.factory<_i3.PatientModel>(
        () => _i3.PatientModel(patientRepository: gh<_i4.PatientRepository>()));
    gh.factory<_i5.SummaryListModel>(() =>
        _i5.SummaryListModel(patientRepository: gh<_i4.PatientRepository>()));
    gh.factory<_i6.NormalSummaryModel>(() =>
        _i6.NormalSummaryModel(patientRepository: gh<_i4.PatientRepository>()));
    gh.factory<_i7.AutoTranslateModel>(() =>
        _i7.AutoTranslateModel(patientRepository: gh<_i4.PatientRepository>()));
    gh.factory<_i8.PickMedicalDataFileModel>(() => _i8.PickMedicalDataFileModel(
        patientRepository: gh<_i4.PatientRepository>()));
    gh.factory<_i9.MedicalSummaryModel>(() => _i9.MedicalSummaryModel(
        patientRepository: gh<_i4.PatientRepository>()));
    gh.factory<_i10.DomesticMedicalDataModel>(() =>
        _i10.DomesticMedicalDataModel(
            patientRepository: gh<_i4.PatientRepository>()));
    gh.factory<_i11.StatementModel>(() =>
        _i11.StatementModel(patientRepository: gh<_i4.PatientRepository>()));
    gh.factory<_i12.OverseasMedicalDataModel>(() =>
        _i12.OverseasMedicalDataModel(
            patientRepository: gh<_i4.PatientRepository>()));
    gh.factory<_i13.ProposalModel>(() =>
        _i13.ProposalModel(patientRepository: gh<_i4.PatientRepository>()));
    gh.factory<_i14.BasicInformationModel>(() => _i14.BasicInformationModel(
        patientRepository: gh<_i4.PatientRepository>()));
    gh.factory<_i15.ApplicationRiskTestModel>(() =>
        _i15.ApplicationRiskTestModel(
            patientRepository: gh<_i4.PatientRepository>()));
    gh.factory<_i16.ApplicationBeautyModel>(() => _i16.ApplicationBeautyModel(
        patientRepository: gh<_i4.PatientRepository>()));
    gh.factory<_i17.ApplicationBloodPurificationTherapyModel>(() =>
        _i17.ApplicationBloodPurificationTherapyModel(
            patientRepository: gh<_i4.PatientRepository>()));
    gh.factory<_i18.ApplicationRegenerativeMedicalModel>(() =>
        _i18.ApplicationRegenerativeMedicalModel(
            patientRepository: gh<_i4.PatientRepository>()));
    gh.factory<_i19.PatientResponseOtherModel>(() =>
        _i19.PatientResponseOtherModel(
            patientRepository: gh<_i4.PatientRepository>()));
    gh.factory<_i20.PatientResponseTreatmentModel>(() =>
        _i20.PatientResponseTreatmentModel(
            patientRepository: gh<_i4.PatientRepository>()));
    gh.factory<_i21.PatientResponseMedicalCheckupModel>(() =>
        _i21.PatientResponseMedicalCheckupModel(
            patientRepository: gh<_i4.PatientRepository>()));
    gh.factory<_i22.PatientResponseModel>(() => _i22.PatientResponseModel(
        patientRepository: gh<_i4.PatientRepository>()));
    gh.factory<_i23.DetailPatientModel>(() => _i23.DetailPatientModel(
        patientRepository: gh<_i4.PatientRepository>()));
    gh.factory<_i24.EstimateModel>(() =>
        _i24.EstimateModel(patientRepository: gh<_i4.PatientRepository>()));
    gh.factory<_i25.MedicalVisaModel>(() =>
        _i25.MedicalVisaModel(patientRepository: gh<_i4.PatientRepository>()));
    gh.factory<_i26.MedicalPaymentDetailModel>(() =>
        _i26.MedicalPaymentDetailModel(
            patientRepository: gh<_i4.PatientRepository>()));
    gh.factory<_i27.ProgressListModel>(() =>
        _i27.ProgressListModel(patientRepository: gh<_i4.PatientRepository>()));
    gh.factory<_i28.BillingModel>(() =>
        _i28.BillingModel(patientRepository: gh<_i4.PatientRepository>()));
    gh.factory<_i29.PrePatientModel>(() =>
        _i29.PrePatientModel(patientRepository: gh<_i4.PatientRepository>()));
    gh.factory<_i30.DetailPatientWebReservationModel>(() =>
        _i30.DetailPatientWebReservationModel(
            repository: gh<_i4.PatientRepository>()));
  }
}
