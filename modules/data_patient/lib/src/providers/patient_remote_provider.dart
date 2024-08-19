import 'package:core_network/core_network.dart';
import 'package:core_network/entities.dart';
import 'package:injectable/injectable.dart';

@injectable
class PatientRemoteProvider {
  PatientRemoteProvider({
    required this.apiService,
    required this.fileUploadService,
  });

  final ApiService apiService;
  final FileUploadService fileUploadService;

  Future<FileResponse> uploadFileBase64(
    String file,
    String filename,
  ) async =>
      await apiService.uploadFileBase64(file, filename);

  Future<Paginated<PrePatient>> prePatients({
    int? page,
    int? limit,
    String? agents,
    String? patient,
  }) async =>
      await apiService.prePatients(
        page: page,
        limit: limit,
        agents: agents,
        patient: patient,
      );

  Future<PrePatient> postPrePatient(
    PrePatientRequest prePatient,
  ) async =>
      await apiService.postPrePatient(prePatient);

  Future<PrePatient> putPrePatient(
    String id,
    PrePatientRequest prePatient,
  ) async =>
      await apiService.putPrePatient(id, prePatient);

  Future<void> deletePrePatient(
    String id,
  ) async =>
      await apiService.deletePrePatient(id);

  Future<Paginated<Patient>> patients({
    String? progress,
    String? patientName,
    String? companyAGENTS,
    String? acceptingHospital,
    String? type,
    String? salesStaff,
    String? dateOfEntryfrom,
    String? dateOfEntryto,
    String? medicalDayfrom,
    String? medicalDayto,
    String? returnDatefrom,
    String? returnDateto,
  }) async =>
      await apiService.patients(
        progress: progress,
        patientName: patientName,
        companyAgents: companyAGENTS,
        acceptingHospital: acceptingHospital,
        type: type,
        salesStaff: salesStaff,
        dateOfEntryfrom: dateOfEntryfrom,
        dateOfEntryto: dateOfEntryto,
        medicalDayfrom: medicalDayfrom,
        medicalDayto: medicalDayto,
        returnDatefrom: returnDatefrom,
        returnDateto: returnDateto,
      );

  Future<Patient> patient(
    String id,
  ) async =>
      await apiService.patient(id);

  Future<Patient> postPatient(
    PatientRequest patient,
  ) async =>
      await apiService.postPatient(patient);

  Future<Patient> putPatient(
    String id,
    PatientRequest patient,
  ) async =>
      await apiService.putPatient(id, patient);

  Future<void> deletePatient(
    String id,
  ) async =>
      await apiService.deletePatient(id);

  Future<List<PatientName>> patientNames(
    String patientId,
  ) async =>
      await apiService.patientNames(patientId);

  Future<List<PatientName>> patientNamesByPatient(
    String patientId,
  ) async =>
      await apiService.patientNamesByPatient(patientId);

  Future<PatientName> postPatientName(
    PatientNameRequest patientName,
  ) async =>
      await apiService.postPatientName(patientName);

  Future<PatientName> putPatientName(
    String id,
    PatientNameRequest patientName,
  ) async =>
      await apiService.putPatientName(id, patientName);

  Future<void> deletePatientName(
    String id,
  ) async =>
      await apiService.deletePatientName(id);

  Future<List<PatientNationality>> patientNationalities(
    String patientId,
  ) async =>
      await apiService.patientNationalities(patientId);

  Future<List<PatientNationality>> patientNationalitiesByPatient(
    String patientId,
  ) async =>
      await apiService.patientNationalitiesByPatient(patientId);

  Future<PatientNationality> postPatientNationality(
    PatientNationalityRequest patientNationality,
  ) async =>
      await apiService.postPatientNationality(patientNationality);

  Future<PatientNationality> putPatientNationality(
    String id,
    PatientNationalityRequest patientNationality,
  ) async =>
      await apiService.putPatientNationality(id, patientNationality);

  Future<void> deletePatientNationality(
    String id,
  ) async =>
      await apiService.deletePatientNationality(id);

  Future<List<PatientPassport>> patientPassports(
    String patientId,
  ) async =>
      await apiService.patientPassports(patientId);

  Future<List<PatientPassport>> patientPassportsByPatient(
    String patientId,
  ) async =>
      await apiService.patientPassportsByPatient(patientId);

  Future<User> patientUser(
    String userId,
  ) async =>
      await apiService.patientUser(userId);

  Future<PatientPassport> postPatientPassport(
    PatientPassportRequest patientPassport,
  ) async =>
      await apiService.postPatientPassport(patientPassport);

  Future<PatientPassport> putPatientPassport(
    String id,
    PatientPassportRequest patientPassport,
  ) async =>
      await apiService.putPatientPassport(id, patientPassport);

  Future<void> deletePatientPassport(
    String id,
  ) async =>
      await apiService.deletePatientPassport(id);

  Future<List<MedicalRecord>> medicalRecords({
    int? page,
    int? limit,
    String? patient,
  }) async =>
      await apiService.medicalRecords(
        page: page,
        limit: limit,
        patient: patient,
      );

  Future<List<MedicalRecord>> medicalRecordsByPatient(
    String patientId,
  ) async =>
      await apiService.medicalRecordsByPatient(patientId);

  Future<MedicalRecord> postMedicalRecord(
    MedicalRecordRequest medicalRecord,
  ) async =>
      await apiService.postMedicalRecord(medicalRecord);

  Future<MedicalRecord> putMedicalRecord(
    String id,
    MedicalRecordRequest medicalRecord,
  ) async =>
      await apiService.putMedicalRecord(id, medicalRecord);

  Future<void> deleteMedicalRecord(
    String id,
  ) async =>
      await apiService.deleteMedicalRecord(id);

  Future<List<MedicalRecordBudget>> medicalRecordBudgets(
    String medicalRecordId,
  ) async =>
      await apiService.medicalRecordBudgets(medicalRecordId);

  Future<List<MedicalRecordBudget>> medicalRecordBudgetsByMedicalRecord(
    String medicalRecordId,
  ) async =>
      await apiService.medicalRecordBudgetsByMedicalRecord(medicalRecordId);

  Future<MedicalRecordBudget> postMedicalRecordBudget(
    MedicalRecordBudgetRequest medicalRecordBudget,
  ) async =>
      await apiService.postMedicalRecordBudget(medicalRecordBudget);

  Future<MedicalRecordBudget> putMedicalRecordBudget(
    String id,
    MedicalRecordBudgetRequest medicalRecordBudget,
  ) async =>
      await apiService.putMedicalRecordBudget(id, medicalRecordBudget);

  Future<void> deleteMedicalRecordBudget(
    String id,
  ) async =>
      await apiService.deleteMedicalRecordBudget(id);

  Future<List<MedicalRecordAgent>> medicalRecordAgents(
    String medicalRecordId,
  ) async =>
      await apiService.medicalRecordAgents(medicalRecordId);

  Future<List<MedicalRecordAgent>> medicalRecordAgentsByMedicalRecord(
    String medicalRecordId,
  ) async =>
      await apiService.medicalRecordAgentsByMedicalRecord(medicalRecordId);

  Future<MedicalRecordAgent> postMedicalRecordAgent(
    MedicalRecordAgentRequest medicalRecordAgent,
  ) async =>
      await apiService.postMedicalRecordAgent(medicalRecordAgent);

  Future<MedicalRecordAgent> putMedicalRecordAgent(
    String id,
    MedicalRecordAgentRequest medicalRecordAgent,
  ) async =>
      await apiService.putMedicalRecordAgent(id, medicalRecordAgent);

  Future<void> deleteMedicalRecordAgent(
    String id,
  ) async =>
      await apiService.deleteMedicalRecordAgent(id);

  Future<List<MedicalRecordReferrer>> medicalRecordReferrers(
    String medicalRecordId,
  ) async =>
      await apiService.medicalRecordReferrers(medicalRecordId);

  Future<List<MedicalRecordReferrer>> medicalRecordReferrersByMedicalRecord(
    String medicalRecordId,
  ) async =>
      await apiService.medicalRecordReferrersByMedicalRecord(medicalRecordId);

  Future<MedicalRecordReferrer> postMedicalRecordReferrer(
    MedicalRecordReferrerRequest medicalRecordAgent,
  ) async =>
      await apiService.postMedicalRecordReferrer(medicalRecordAgent);

  Future<MedicalRecordReferrer> putMedicalRecordReferrer(
    String id,
    MedicalRecordReferrerRequest medicalRecordAgent,
  ) async =>
      await apiService.putMedicalRecordReferrer(id, medicalRecordAgent);

  Future<void> deleteMedicalRecordReferrer(
    String id,
  ) async =>
      await apiService.deleteMedicalRecordAgent(id);

  // GET_MEDICAL_RECORD_COMPANIONS
  Future<List<MedicalRecordCompanion>> medicalRecordCompanions(
    String medicalRecordId,
  ) async =>
      await apiService.medicalRecordCompanions(medicalRecordId);

  Future<List<MedicalRecordCompanion>> medicalRecordCompanionsByMedicalRecord(
    String medicalRecordId,
  ) async =>
      await apiService.medicalRecordCompanionsByMedicalRecord(medicalRecordId);

  Future<MedicalRecordCompanion> postMedicalRecordCompanion(
    MedicalRecordCompanionRequest medicalRecordCompanion,
  ) async =>
      await apiService.postMedicalRecordCompanion(medicalRecordCompanion);

  Future<MedicalRecordCompanion> putMedicalRecordCompanion(
    String id,
    MedicalRecordCompanionRequest medicalRecordCompanion,
  ) async =>
      await apiService.putMedicalRecordCompanion(id, medicalRecordCompanion);

  Future<void> deleteMedicalRecordCompanion(
    String id,
  ) async =>
      await apiService.deleteMedicalRecordCompanion(id);

  // GET_MEDICAL_RECORD_HOSPITALS
  Future<List<MedicalRecordHospital>> medicalRecordHospitals(
    String medicalRecordId,
  ) async =>
      await apiService.medicalRecordHospitals(medicalRecordId);

  Future<List<MedicalRecordHospital>> medicalRecordHospitalsByMedicalRecord(
    String medicalRecordId,
  ) async =>
      await apiService.medicalRecordHospitalsByMedicalRecord(medicalRecordId);

  Future<MedicalRecordHospital> postMedicalRecordHospital(
    MedicalRecordHospitalRequest medicalRecordHospital,
  ) async =>
      await apiService.postMedicalRecordHospital(medicalRecordHospital);

  Future<MedicalRecordHospital> putMedicalRecordHospital(
    String id,
    MedicalRecordHospitalRequest medicalRecordHospital,
  ) async =>
      await apiService.putMedicalRecordHospital(id, medicalRecordHospital);

  Future<void> deleteMedicalRecordHospital(
    String id,
  ) async =>
      await apiService.deleteMedicalRecordHospital(id);

  // GET_MEDICAL_RECORD_INTERPRETERS
  Future<List<MedicalRecordInterpreter>> medicalRecordInterpreters(
    String medicalRecordId,
  ) async =>
      await apiService.medicalRecordInterpreters(medicalRecordId);

  Future<List<MedicalRecordInterpreter>>
      medicalRecordInterpretersByMedicalRecord(
    String medicalRecordId,
  ) async =>
          await apiService
              .medicalRecordInterpretersByMedicalRecord(medicalRecordId);

  Future<MedicalRecordInterpreter> postMedicalRecordInterpreter(
    MedicalRecordInterpreterRequest medicalRecordInterpreter,
  ) async =>
      await apiService.postMedicalRecordInterpreter(medicalRecordInterpreter);

  Future<MedicalRecordInterpreter> putMedicalRecordInterpreter(
    String id,
    MedicalRecordInterpreterRequest medicalRecordInterpreter,
  ) async =>
      await apiService.putMedicalRecordInterpreter(
          id, medicalRecordInterpreter);

  Future<void> deleteMedicalRecordInterpreter(
    String id,
  ) async =>
      await apiService.deleteMedicalRecordInterpreter(id);

  // GET_MEDICAL_RECORDS_PROGRESS
  Future<List<MedicalRecordProgress>> medicalRecordsProgress(
    String medicalRecordId,
  ) async =>
      await apiService.medicalRecordsProgress(medicalRecordId);

  Future<List<MedicalRecordProgress>> medicalRecordsProgressByMedicalRecord(
    String medicalRecordId,
  ) async =>
      await apiService.medicalRecordsProgressByMedicalRecord(medicalRecordId);

  Future<MedicalRecordProgress> postMedicalRecordProgress(
    MedicalRecordProgressRequest medicalRecordProgress,
  ) async =>
      await apiService.postMedicalRecordProgress(medicalRecordProgress);

  Future<MedicalRecordProgress> putMedicalRecordProgress(
    String id,
    MedicalRecordProgressRequest medicalRecordProgress,
  ) async =>
      await apiService.putMedicalRecordProgress(id, medicalRecordProgress);

  Future<void> deleteMedicalRecordProgress(
    String id,
  ) async =>
      await apiService.deleteMedicalRecordProgress(id);

// GET_MEDICAL_RECORDS_OVERSEAS_DATA
  Future<List<MedicalRecordOverseaData>>
      medicalRecordOverseaDataByMedicalRecord(
    String medicalRecordId,
  ) async =>
          await apiService
              .medicalRecordOverseaDataByMedicalRecord(medicalRecordId);

  Future<MedicalRecordOverseaData> postMedicalRecordOverseaData(
    MedicalRecordOverseaDataRequest medicalRecordOverseaData,
  ) async =>
      await apiService.postMedicalRecordOverseaData(medicalRecordOverseaData);

  Future<MedicalRecordOverseaData> putMedicalRecordOverseaData(
    String id,
    MedicalRecordOverseaDataRequest medicalRecordOverseaData,
  ) async =>
      await apiService.putMedicalRecordOverseaData(
          id, medicalRecordOverseaData);

  Future<void> deleteMedicalRecordOverseaData(
    String id,
  ) async =>
      await apiService.deleteMedicalRecordOverseaData(id);

  Future<MedicalRecordTravelGroup> medicalRecordTravelGroups(
    String medicalRecord,
  ) async =>
      await apiService.medicalRecordsTravelGroup(medicalRecord: medicalRecord);

  Future<MedicalRecordTravelGroup> postMedicalRecordTravelGroup(
    MedicalRecordTravelGroupRequest medicalRecordTravelGroup,
  ) async =>
      await apiService.postMedicalRecordTravelGroup(medicalRecordTravelGroup);

  Future<List<MedicalRecordProposal>> getAllMedicalRecordProposals() async =>
      await apiService.getAllMedicalRecordProposals();

  Future<List<MedicalRecordProposal>> getMedicalRecordProposalsByMedicalRecord(
    String medicalRecord,
  ) async =>
      await apiService.getMedicalRecordProposalsByMedicalRecord(medicalRecord);

  Future<List<MedicalRecordProposal>> getOneMedicalRecordProposal(
    String id,
  ) async =>
      await apiService.getOneMedicalRecordProposal(id);

  Future<MedicalRecordProposal> postMedicalRecordProposal(
    MedicalRecordProposalRequest medicalRecordProposal,
  ) async =>
      await apiService.postMedicalRecordProposal(medicalRecordProposal);

  Future<MedicalRecordProposal> putMedicalRecordProposal(
    String id,
    MedicalRecordProposalRequest medicalRecordProposal,
  ) async =>
      await apiService.putMedicalRecordProposal(id, medicalRecordProposal);

  Future<void> deleteMedicalRecordProposal(
    String id,
  ) async =>
      await apiService.deleteMedicalRecordProposal(id);

  Future<MedicalRecordPatientResponseTreatment>
      getMedicalRecordPatientResponseTreatment({
    required String medicalRecord,
  }) async =>
          await apiService.getMedicalRecordPatientResponseTreatment(
              medicalRecord: medicalRecord);

  Future<MedicalRecordPatientResponseTreatment>
      postMedicalRecordPatientResponseTreatment(
    MedicalRecordPatientResponseTreatmentRequest
        medicalRecordPatientResponseTreatment,
  ) async =>
          await apiService.postMedicalRecordPatientResponseTreatment(
              medicalRecordPatientResponseTreatment);

  Future<MedicalRecordPatientResponseMedicalCheckup>
      getMedicalRecordPatientResponseMedicalCheckup({
    required String medicalRecord,
  }) async =>
          await apiService.getMedicalRecordPatientResponseMedicalCheckup(
              medicalRecord: medicalRecord);

  Future<MedicalRecordPatientResponseMedicalCheckup>
      postMedicalRecordPatientResponseMedicalCheckup(
    MedicalRecordPatientResponseMedicalCheckupRequest
        medicalRecordPatientResponseMedicalCheckup,
  ) async =>
          await apiService.postMedicalRecordPatientResponseMedicalCheckup(
              medicalRecordPatientResponseMedicalCheckup);

  Future<MedicalRecordPatientResponseOther>
      getMedicalRecordPatientResponseOther({
    required String medicalRecord,
  }) async =>
          await apiService.getMedicalRecordPatientResponseOther(
              medicalRecord: medicalRecord);

  Future<MedicalRecordPatientResponseOther>
      postMedicalRecordPatientResponseOther(
    MedicalRecordPatientResponseOtherRequest medicalRecordPatientResponseOther,
  ) async =>
          await apiService.postMedicalRecordPatientResponseOther(
              medicalRecordPatientResponseOther);

  Future<MedicalRecordSummary> getMedicalRecordSummary({
    required String medicalRecord,
  }) async =>
      await apiService.getMedicalRecordSummary(medicalRecord: medicalRecord);

  Future<MedicalRecordSummary> postMedicalRecordSummary(
    MedicalRecordSummaryRequest medicalRecordSummary,
  ) async =>
      await apiService.postMedicalRecordSummary(medicalRecordSummary);

  Future<WebBookingPatientPreferredDate> getWebBookingPatientPreferredDate(
    String medicalRecord,
  ) async =>
      await apiService.getWebBookingPatientPreferredDate(medicalRecord);

  Future<TreamentResponce> getInfoMedicalExamination(
    String patientId,
  ) async =>
      await apiService.getInfoMedicalExamination(patientId);

  Future<List<WebBookingMedicalRecordResponse>> getBookingMedicalRecord({
    required String medicalRecord,
  }) async =>
      await apiService.getBookingMedicalRecord(medicalRecord);

  Future<WebBookingMedicalRecordResponse> postBookingMedicalRecord(
    WebBookingMedicalRecordRequest webBookingMedicalRecord,
  ) async =>
      await apiService.postBookingMedicalRecord(webBookingMedicalRecord);

  Future<ApplicationRegenerativeMedicalResponse>
      getApplicationRegenerattiveMedical({
    required String medicalRecord,
  }) async =>
          await apiService.getApplicationRegenerattiveMedical(medicalRecord);

  Future<ApplicationRegenerativeMedicalResponse>
      postApplicationRegenerattiveMedical(
              ApplicationRegenerativeMedicalRequest
                  applicationRegenerativeMedicalRequest) async =>
          await apiService.postApplicationRegenerattiveMedical(
              applicationRegenerativeMedicalRequest);

  Future<ApplicationBeautyResponse> getApplicationBeauty({
    required String medicalRecord,
  }) async =>
      await apiService.getApplicationBeauty(medicalRecord);

  Future<ApplicationBeautyResponse> postApplicationBeauty(
    ApplicationBeautyRequest applicationBeautyRequest,
  ) async =>
      await apiService.postApplicationBeauty(applicationBeautyRequest);

  Future<ApplicationBloodPurificationTherapyResponse>
      getApplicationBloodPurificationTherapy({
    required String medicalRecord,
  }) async =>
          await apiService
              .getApplicationBloodPurificationTherapy(medicalRecord);

  Future<ApplicationBloodPurificationTherapyResponse>
      postApplicationBloodPurificationTherapy(
    ApplicationBloodPurificationTherapyRequest
        applicationBloodPurificationTherapyRequest,
  ) async =>
          await apiService.postApplicationBloodPurificationTherapy(
              applicationBloodPurificationTherapyRequest);

  Future<ApplicationRiskTestResponse> getApplicationRiskTest({
    required String medicalRecord,
  }) async =>
      await apiService.getApplicationRiskTest(medicalRecord);

  Future<ApplicationRiskTestResponse> postApplicationRiskTest(
    ApplicationRiskTestRequest applicationRiskTestRequest,
  ) async =>
      await apiService.postApplicationRiskTest(applicationRiskTestRequest);

  Future<List<DomesticMedicalDataResponse>> getDomesticMedicalData(
          {required String medicalRecordId}) async =>
      await apiService.getDomesticMedicalData(id: medicalRecordId);
  Future<DomesticMedicalDataResponse> postDomesticMedicalData(
      DomesticMedicalDataRequest domesticMedicalDataRequest) async => await apiService.postDomesticMedicalData(domesticMedicalDataRequest);
  Future<List<MedicalPaymentResponse>> getMedicalPayment({required String medicalRecordId}) async => await apiService.getMedicalPaymentDetail(id: medicalRecordId);

  Future<MedicalPaymentResponse> postMedicalPayment(
      MedicalPaymentRequest medicalPaymentRequest) async => await apiService.postMedicalPaymentDetail(medicalPaymentRequest);

  Future<void> closePatientAccount(String id) {
    return apiService.closePatientAccount(id);
  }
}
