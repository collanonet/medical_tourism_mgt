import 'package:core_network/entities.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_patient/data_patient.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

@injectable
class ProgressListModel {
  ProgressListModel({
    required this.patientRepository,
  });

  final PatientRepository patientRepository;

  ValueNotifier<AsyncData<MedicalRecord>> medicalRecord =
      ValueNotifier<AsyncData<MedicalRecord>>(const AsyncData());

  Future<void> getMedicalRecords(FormGroup formGroup,
      {String? patientId}) async {
    if (patientId != null) {
      try {
        medicalRecord.value = const AsyncData(loading: true);

        var result = await patientRepository.medicalRecordsByPatient(patientId);
        if (result.isNotEmpty) {
          medicalRecord.value = AsyncData(data: result.first);
          logger.d(medicalRecord.value.requireData.id);
          await getMedicalRecordsProgress(formGroup);
        } else {
          medicalRecord.value = const AsyncData();
        }
      } catch (e) {
        logger.e(e);
        medicalRecord.value = AsyncData(error: e);
      }
    }
  }

  ValueNotifier<AsyncData<List<MedicalRecordProgress>>> medicalRecordsProgress =
      ValueNotifier(const AsyncData());

  Future<void> getMedicalRecordsProgress(FormGroup formGroup) async {
    try {
      medicalRecordsProgress.value = const AsyncData(loading: true);

      var result =
          await patientRepository.medicalRecordsProgressByMedicalRecord(
              medicalRecord.value.requireData.id);
      insertDataAllForm(formGroup, result);
      medicalRecordsProgress.value = AsyncData(data: result);
    } catch (e) {
      logger.d(e);
      medicalRecordsProgress.value = AsyncData(error: e);
    }
  }

  Future<void> insertDataAllForm(
      FormGroup formGroup, List<MedicalRecordProgress> data) async {
    insertData(
        formGroup.control('contactUs') as FormGroup,
        data
            .where((e) => e.key == 'contactUs' && e.type == 'treatment')
            .firstOrNull);
    insertData(
        formGroup.control('application') as FormGroup,
        data
            .where((e) => e.key == 'application' && e.type == 'treatment')
            .firstOrNull);
    insertData(
        formGroup.control('submitMaterials') as FormGroup,
        data
            .where((e) => e.key == 'submitMaterials' && e.type == 'treatment')
            .firstOrNull);
    insertData(
        formGroup.control('medicalInstitutionSelectionProposal') as FormGroup,
        data
            .where((e) =>
                e.key == 'medicalInstitutionSelectionProposal' &&
                e.type == 'treatment')
            .firstOrNull);
    insertData(
        formGroup.control('contractConclusionDeposit') as FormGroup,
        data
            .where((e) =>
                e.key == 'contractConclusionDeposit' && e.type == 'treatment')
            .firstOrNull);
    insertData(
        formGroup.control('documentTranslationHospitalInquiries') as FormGroup,
        data
            .where((e) =>
                e.key == 'documentTranslationHospitalInquiries' &&
                e.type == 'treatment')
            .firstOrNull);
    insertData(
        formGroup.control('judgingWhetherToVisitJapanForTreatment')
            as FormGroup,
        data
            .where((e) =>
                e.key == 'judgingWhetherToVisitJapanForTreatment' &&
                e.type == 'treatment')
            .firstOrNull);
    insertData(
        formGroup.control('decidingToComeToJapan') as FormGroup,
        data
            .where((e) =>
                e.key == 'decidingToComeToJapan' && e.type == 'treatment')
            .firstOrNull);
    insertData(
        formGroup.control('medicalVisaApplicationOfArrivalDate') as FormGroup,
        data
            .where((e) =>
                e.key == 'medicalVisaApplicationOfArrivalDate' &&
                e.type == 'treatment')
            .firstOrNull);
    insertData(
        formGroup.control('submitVisaAirlineTicketInformation') as FormGroup,
        data
            .where((e) =>
                e.key == 'submitVisaAirlineTicketInformation' &&
                e.type == 'treatment')
            .firstOrNull);
    insertData(
        formGroup.control('officialReservationAtAMedicalInstitution')
            as FormGroup,
        data
            .where((e) =>
                e.key == 'officialReservationAtAMedicalInstitution' &&
                e.type == 'treatment')
            .firstOrNull);
    insertData(
        formGroup.control('treatmentExaminationSupportInJapan') as FormGroup,
        data
            .where((e) =>
                e.key == 'treatmentExaminationSupportInJapan' &&
                e.type == 'treatment')
            .firstOrNull);
    insertData(
        formGroup.control('completionOfTreatment') as FormGroup,
        data
            .where((e) =>
                e.key == 'completionOfTreatment' && e.type == 'treatment')
            .firstOrNull);

    insertData(
        formGroup.control('contactUs1') as FormGroup,
        data
            .where((e) => e.key == 'contactUs' && e.type == 'procedure')
            .firstOrNull);
    insertData(
        formGroup.control('application1') as FormGroup,
        data
            .where((e) => e.key == 'application' && e.type == 'procedure')
            .firstOrNull);
    insertData(
        formGroup.control('submitRequiredInformation') as FormGroup,
        data
            .where((e) =>
                e.key == 'submitRequiredInformation' && e.type == 'procedure')
            .firstOrNull);
    insertData(
        formGroup.control('hospitalCourseSelectionProposal') as FormGroup,
        data
            .where((e) =>
                e.key == 'hospitalCourseSelectionProposal' &&
                e.type == 'procedure')
            .firstOrNull);
    insertData(
        formGroup.control(
                'courseConfirmationScheduleAdjustmentTentativeReservation')
            as FormGroup,
        data
            .where((e) =>
                e.key ==
                    'courseConfirmationScheduleAdjustmentTentativeReservation' &&
                e.type == 'procedure')
            .firstOrNull);
    insertData(
        formGroup.control('contractConclusionDeposit1') as FormGroup,
        data
            .where((e) =>
                e.key == 'contractConclusionDeposit' && e.type == 'procedure')
            .firstOrNull);
    insertData(
        formGroup.control('officialReservationAtAMedicalInstitution1')
            as FormGroup,
        data
            .where((e) =>
                e.key == 'officialReservationAtAMedicalInstitution' &&
                e.type == 'procedure')
            .firstOrNull);
    insertData(
        formGroup.control(
                'estimateForAdditionalServicesSuchAsAccommodationAndSightseeing')
            as FormGroup,
        data
            .where((e) =>
                e.key ==
                    'estimateForAdditionalServicesSuchAsAccommodationAndSightseeing' &&
                e.type == 'procedure')
            .firstOrNull);
    insertData(
        formGroup.control('submitVisaAirlineTicketInformation1') as FormGroup,
        data
            .where((e) =>
                e.key == 'submitVisaAirlineTicketInformation1' &&
                e.type == 'procedure')
            .firstOrNull);
    insertData(
        formGroup.control('fillConfirmMedicalQuestionnaire') as FormGroup,
        data
            .where((e) =>
                e.key == 'fillConfirmMedicalQuestionnaire' &&
                e.type == 'procedure')
            .firstOrNull);
    insertData(
        formGroup.control('medicalExaminationAccompanied') as FormGroup,
        data
            .where((e) =>
                e.key == 'medicalExaminationAccompanied' &&
                e.type == 'procedure')
            .firstOrNull);
    insertData(
        formGroup.control('sendingResultReport') as FormGroup,
        data
            .where(
                (e) => e.key == 'sendingResultReport' && e.type == 'procedure')
            .firstOrNull);
  }

  void insertData(FormGroup formGroup, MedicalRecordProgress? data) {
    logger.d(data?.toJson());
    formGroup.control('id').value = data?.id;
    formGroup.control('completed').value = data?.completed;
    formGroup.control('completionDate').value = data?.completionDate;
    formGroup.control('remarks').value = data?.remarks;
    formGroup.control('medicalRecord').value =
        medicalRecord.value.requireData.id;
  }

  ValueNotifier<AsyncData<dynamic>> submit = ValueNotifier(const AsyncData());

  Future<void> submitData(FormGroup formGroup) async {
    try {
      submit.value = AsyncData(loading: true);

      await postMedicalRecordsProgress(
          mapData(formGroup.control('contactUs') as FormGroup));
      await postMedicalRecordsProgress(
          mapData(formGroup.control('application') as FormGroup));
      await postMedicalRecordsProgress(
          mapData(formGroup.control('submitMaterials') as FormGroup));
      await postMedicalRecordsProgress(mapData(formGroup
          .control('medicalInstitutionSelectionProposal') as FormGroup));
      await postMedicalRecordsProgress(
          mapData(formGroup.control('contractConclusionDeposit') as FormGroup));
      await postMedicalRecordsProgress(mapData(formGroup
          .control('documentTranslationHospitalInquiries') as FormGroup));
      await postMedicalRecordsProgress(mapData(formGroup
          .control('judgingWhetherToVisitJapanForTreatment') as FormGroup));
      await postMedicalRecordsProgress(
          mapData(formGroup.control('decidingToComeToJapan') as FormGroup));
      await postMedicalRecordsProgress(mapData(formGroup
          .control('medicalVisaApplicationOfArrivalDate') as FormGroup));
      await postMedicalRecordsProgress(mapData(formGroup
          .control('submitVisaAirlineTicketInformation') as FormGroup));
      await postMedicalRecordsProgress(mapData(formGroup
          .control('officialReservationAtAMedicalInstitution') as FormGroup));
      await postMedicalRecordsProgress(mapData(formGroup
          .control('treatmentExaminationSupportInJapan') as FormGroup));
      await postMedicalRecordsProgress(
          mapData(formGroup.control('completionOfTreatment') as FormGroup));

      await postMedicalRecordsProgress(
          mapData(formGroup.control('contactUs1') as FormGroup));
      await postMedicalRecordsProgress(
          mapData(formGroup.control('application1') as FormGroup));
      await postMedicalRecordsProgress(
          mapData(formGroup.control('submitRequiredInformation') as FormGroup));
      await postMedicalRecordsProgress(mapData(
          formGroup.control('hospitalCourseSelectionProposal') as FormGroup));
      await postMedicalRecordsProgress(mapData(formGroup.control(
              'courseConfirmationScheduleAdjustmentTentativeReservation')
          as FormGroup));
      await postMedicalRecordsProgress(mapData(
          formGroup.control('contractConclusionDeposit1') as FormGroup));
      await postMedicalRecordsProgress(mapData(formGroup
          .control('officialReservationAtAMedicalInstitution1') as FormGroup));
      await postMedicalRecordsProgress(mapData(formGroup.control(
              'estimateForAdditionalServicesSuchAsAccommodationAndSightseeing')
          as FormGroup));
      await postMedicalRecordsProgress(mapData(formGroup
          .control('submitVisaAirlineTicketInformation1') as FormGroup));
      await postMedicalRecordsProgress(mapData(
          formGroup.control('fillConfirmMedicalQuestionnaire') as FormGroup));
      await postMedicalRecordsProgress(mapData(
          formGroup.control('medicalExaminationAccompanied') as FormGroup));
      await postMedicalRecordsProgress(
          mapData(formGroup.control('sendingResultReport') as FormGroup));
      submit.value = const AsyncData();
    } catch (e) {
      logger.d(e);
      submit.value = AsyncData(error: e);
    }
  }

  MedicalRecordProgressRequest mapData(FormGroup formGroup) {
    return MedicalRecordProgressRequest(
      key: formGroup.control('key').value,
      tag: formGroup.control('tag').value,
      task: formGroup.control('task').value,
      completed: formGroup.control('completed').value ?? false,
      completionDate: formGroup.control('completionDate').value,
      remarks: formGroup.control('remarks').value,
      medicalRecord: medicalRecord.value.requireData.id,
      type: formGroup.control('type').value,
    );
  }

  ValueNotifier<AsyncData<String>> submitMedicalRecordsProgress =
      ValueNotifier(const AsyncData());
  Future<void> postMedicalRecordsProgress(
    MedicalRecordProgressRequest medicalRecordProgressRequest,
  ) async {
    try {
      submitMedicalRecordsProgress.value =
          AsyncData(loading: true, data: medicalRecordProgressRequest.key);

      await patientRepository
          .postMedicalRecordProgress(medicalRecordProgressRequest);

      submitMedicalRecordsProgress.value = const AsyncData();
    } catch (e) {
      logger.d(e);
      submitMedicalRecordsProgress.value = AsyncData(error: e);
    }
  }
}
