// Flutter imports:
import 'package:flutter/cupertino.dart';

// Package imports:
import 'package:core_network/core_network.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_patient/data_patient.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

@injectable
class ProposalModel {
  ProposalModel({
    required this.patientRepository,
  });

  final PatientRepository patientRepository;

  ValueNotifier<AsyncData<List<MedicalRecordProposal>>> proposal =
      ValueNotifier(const AsyncData<List<MedicalRecordProposal>>());

  Future<void> init(String patientId, FormGroup formGroup) async {
    await getMedicalRecords(patientId: patientId);
    if (medicalRecord.value.hasData) {
      await getProposal(medicalRecord.value.requireData.id, formGroup);
    }
  }

  //GET_MEDICAL_RECORDS
  ValueNotifier<AsyncData<MedicalRecord>> medicalRecord =
      ValueNotifier<AsyncData<MedicalRecord>>(const AsyncData());

  Future<void> getMedicalRecords({
    required String patientId,
  }) async {
    medicalRecord.value = const AsyncData(loading: true);

    await patientRepository.medicalRecordsByPatient(patientId).then((value) {
      if (value.isNotEmpty) {
        medicalRecord.value = AsyncData(data: value.first);
      } else {
        medicalRecord.value = const AsyncData();
      }
    }).catchError((error) {
      logger.d(error);
      medicalRecord.value = AsyncData(error: error);
    });
  }

  getProposal(String medicalRecord, FormGroup formGroup) async {
    proposal.value = const AsyncData(loading: true);
    try {
      final data = await patientRepository
          .getMedicalRecordProposalsByMedicalRecord(medicalRecord);
      proposal.value = AsyncData(data: data);
      insertProposal(data, formGroup);
    } catch (e) {
      logger.d(e);
      proposal.value = AsyncData(error: e);
    }
  }

  void insertProposal(
      List<MedicalRecordProposal> data, FormGroup formGroup) async {
    if (data.isNotEmpty) {
      formGroup.reset();
      FormArray proposal = formGroup.control('proposal') as FormArray;

      proposal.clear();
      for (var d in data) {
        proposal.add(FormGroup({
          '_id': FormControl<String?>(value: d.id),
          'hospitalName': FormControl<String>(value: d.hospitalName),
          'postalCode': FormControl<String>(value: d.postalCode),
          'address': FormControl<String>(value: d.address),
          'summary': FormControl<String>(value: d.summary),
          'medicalRecord': FormControl<String>(value: d.medicalRecord),
        }));
      }
    }
  }

  void createUpdateProposal(FormArray formArray) async {
    proposal.value = proposal.value.copyWith(loading: true);
    try {
      for (var form in formArray.controls) {
        final data = MedicalRecordProposalRequest(
          hospitalName: form.value['hospitalName'],
          postalCode: form.value['postalCode'],
          address: form.value['address'],
          summary: form.value['summary'],
          medicalRecord: medicalRecord.value.requireData.id,
        );
        if (form.value['_id'] != null) {
          await updateProposal(data, form.value['_id']);
        } else {
          await createProposal(data);
        }
      }
    } catch (e) {
      logger.d(e);
      proposal.value = proposal.value.copyWith(error: e);
    }
  }

  Future<void> createProposal(MedicalRecordProposalRequest data) async {
    try {
      final result = await patientRepository.postMedicalRecordProposal(
        data,
      );
      if (proposal.value.hasData) {
        proposal.value =
            AsyncData(data: proposal.value.requireData..add(result));
      } else {
        proposal.value = AsyncData(data: [result]);
      }
    } catch (e) {
      logger.d(e);
      proposal.value = proposal.value.copyWith(error: e);
    }
  }

  Future<void> updateProposal(
      MedicalRecordProposalRequest data, String id) async {
    try {
      final result = await patientRepository.putMedicalRecordProposal(
        id,
        data,
      );
      if (proposal.value.hasData) {
        proposal.value = AsyncData(
          data: proposal.value.requireData
              .map((e) => e.id == id ? result : e)
              .toList(),
        );
      } else {
        proposal.value = AsyncData(data: [result]);
      }
    } catch (e) {
      logger.d(e);
      proposal.value = proposal.value.copyWith(error: e);
    }
  }
}
