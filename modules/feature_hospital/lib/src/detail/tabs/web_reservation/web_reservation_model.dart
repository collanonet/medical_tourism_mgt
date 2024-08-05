import 'package:core_network/core_network.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_hospital/data_hospital.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

@injectable
class WebReservationModel {
  WebReservationModel({
    required this.hospitalRepository,
  });

  final HospitalRepository hospitalRepository;

  ValueNotifier<AsyncData<PatientSectionHospitalResponse>> patientSectionData =
      ValueNotifier(const AsyncData());

  ValueNotifier<AsyncData<MedicalInstitutionSectionHospitalResponse>>
      medicalInstSectionData = ValueNotifier(const AsyncData());

  Future<void> fetchData(FormGroup formGroup, {String? hospitalId}) async {
    try {
      if (hospitalId != null) {
        await fetchPatientData(
            formGroup.control('patientSection') as FormGroup, hospitalId);
      }
    } catch (e) {
      logger.d(e);
    }
  }

  Future<void> fetchPatientData(FormGroup formGroup, String hospitalId) async {
    try {
      patientSectionData.value = const AsyncData(loading: true);
      final result = await hospitalRepository.getWebReservationPatient(
        hospitalId,
      );
      insertWebReservationPatient(formGroup, result);
    } catch (e) {
      logger.d(e);
    }
  }

  void insertWebReservationPatient(
      FormGroup formGroup, PatientSectionHospitalResponse data) {
    formGroup.control('patientSection').patchValue(data.toJson());
  }

  Future<void> fetchMedicalInstSectionData(
      FormGroup formGroup, String hospitalId) async {
    try {
      medicalInstSectionData.value = const AsyncData(loading: true);
      final result = await hospitalRepository.getMedicalInstitutionSection(
        hospitalId,
      );
      insertMedicalInstSection(formGroup, result);
    } catch (e) {
      logger.d(e);
    }
  }

  void insertMedicalInstSection(
      FormGroup formGroup, MedicalInstitutionSectionHospitalResponse data) {
    formGroup.control('medicalInstitutionSection').patchValue(data.toJson());
  }
}
