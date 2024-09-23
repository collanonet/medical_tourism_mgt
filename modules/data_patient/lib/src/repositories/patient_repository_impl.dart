// Package imports:
import 'package:core_network/entities.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import '../providers/patient_remote_provider.dart';
import 'patient_repository.dart';

@Injectable(as: PatientRepository)
class PatientRepositoryIml extends PatientRepository {
  PatientRepositoryIml({
    required this.remote,
  });

  final PatientRemoteProvider remote;

  @override
  Future<TreamentResponce> getInfoMedicalExamination(
    String patientId,
  ) {
    return remote.getInfoMedicalExamination(patientId);
  }

  @override
  Future<FileResponse> uploadFileBase64(
    String file,
    String filename,
  ) async =>
      await remote.uploadFileBase64(file, filename);

  //GET_PRE_PATIENTS

  @override
  Future<Paginated<PrePatient>> prePatients({
    int? page,
    int? limit,
    String? agents,
    String? patient,
  }) {
    return remote.prePatients(
      page: page,
      limit: limit,
      agents: agents,
      patient: patient,
    );
  }

  @override
  Future<PrePatient> postPrePatient(
    PrePatientRequest prePatient,
  ) {
    return remote.postPrePatient(prePatient);
  }

  @override
  Future<PrePatient> putPrePatient(
    String id,
    PrePatientRequest prePatient,
  ) {
    return remote.putPrePatient(id, prePatient);
  }

  @override
  Future<void> deletePrePatient(
    String id,
  ) {
    return remote.deletePrePatient(id);
  }

  //GET_PATIENTS

  @override
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
  }) {
    return remote.patients(
      progress: progress,
      patientName: patientName,
      companyAGENTS: companyAGENTS,
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
  }

  @override
  Future<Patient> patient(
    String id,
  ) {
    return remote.patient(id);
  }

  @override
  Future<Patient> postPatient(
    PatientRequest patient,
  ) {
    return remote.postPatient(patient);
  }

  @override
  Future<Patient> putPatient(
    String id,
    PatientRequest patient,
  ) {
    return remote.putPatient(id, patient);
  }

  @override
  Future<void> deletePatient(
    String id,
  ) {
    return remote.deletePatient(id);
  }

  //GET_PATIENT_NAMES

  @override
  Future<List<PatientName>> patientNames(
    String patientId,
  ) {
    return remote.patientNames(patientId);
  }

  @override
  Future<List<PatientName>> patientNamesByPatient(
    String patientId,
  ) {
    return remote.patientNamesByPatient(patientId);
  }

  @override
  Future<PatientName> postPatientName(
    PatientNameRequest patientName,
  ) {
    return remote.postPatientName(patientName);
  }

  @override
  Future<PatientName> putPatientName(
    String id,
    PatientNameRequest patientName,
  ) {
    return remote.putPatientName(id, patientName);
  }

  @override
  Future<void> deletePatientName(
    String id,
  ) {
    return remote.deletePatientName(id);
  }

  //GET_PATIENT_NATIONALITIES
  @override
  Future<List<PatientNationality>> patientNationalities(
    String patientId,
  ) {
    return remote.patientNationalities(patientId);
  }

  @override
  Future<List<PatientNationality>> patientNationalitiesByPatient(
    String id,
  ) {
    return remote.patientNationalitiesByPatient(id);
  }

  @override
  Future<PatientNationality> postPatientNationality(
    PatientNationalityRequest patientNationality,
  ) {
    return remote.postPatientNationality(patientNationality);
  }

  @override
  Future<PatientNationality> putPatientNationality(
    String id,
    PatientNationalityRequest patientNationality,
  ) {
    return remote.putPatientNationality(id, patientNationality);
  }

  @override
  Future<void> deletePatientNationality(
    String id,
  ) {
    return remote.deletePatientNationality(id);
  }

  //GET_PATIENT_PASSPORTS

  @override
  Future<List<PatientPassport>> patientPassports(
    String patientId,
  ) {
    return remote.patientPassports(patientId);
  }

  @override
  Future<List<PatientPassport>> patientPassportsByPatient(
    String patientId,
  ) {
    return remote.patientPassportsByPatient(patientId);
  }

  @override
  Future<PatientPassport> postPatientPassport(
    PatientPassportRequest patientPassport,
  ) {
    return remote.postPatientPassport(patientPassport);
  }

  @override
  Future<PatientPassport> putPatientPassport(
    String id,
    PatientPassportRequest patientPassport,
  ) {
    return remote.putPatientPassport(id, patientPassport);
  }

  @override
  Future<void> deletePatientPassport(
    String id,
  ) {
    return remote.deletePatientPassport(id);
  }

  //GET_MEDICAL_RECORDS

  @override
  Future<List<MedicalRecord>> medicalRecords({
    int? page,
    int? limit,
    String? patient,
  }) {
    return remote.medicalRecords(
      page: page,
      limit: limit,
      patient: patient,
    );
  }

  @override
  Future<List<MedicalRecord>> medicalRecordsByPatient(
    String patientId,
  ) {
    return remote.medicalRecordsByPatient(patientId);
  }

  @override
  Future<MedicalRecord> postMedicalRecord(
    MedicalRecordRequest medicalRecord,
  ) {
    return remote.postMedicalRecord(medicalRecord);
  }

  @override
  Future<MedicalRecord> putMedicalRecord(
    String id,
    MedicalRecordRequest medicalRecord,
  ) {
    return remote.putMedicalRecord(id, medicalRecord);
  }

  @override
  Future<void> deleteMedicalRecord(
    String id,
  ) {
    return remote.deleteMedicalRecord(id);
  }

  //GET_MEDICAL_RECORD_AGENTS

  @override
  Future<List<MedicalRecordAgent>> medicalRecordAgents(
    String medicalRecordId,
  ) {
    return remote.medicalRecordAgents(medicalRecordId);
  }

  @override
  Future<List<MedicalRecordAgent>> medicalRecordAgentsByMedicalRecord(
    String medicalRecordId,
  ) {
    return remote.medicalRecordAgentsByMedicalRecord(medicalRecordId);
  }

  @override
  Future<MedicalRecordAgent> postMedicalRecordAgent(
    MedicalRecordAgentRequest medicalRecordAgent,
  ) {
    return remote.postMedicalRecordAgent(medicalRecordAgent);
  }

  @override
  Future<MedicalRecordAgent> putMedicalRecordAgent(
    String id,
    MedicalRecordAgentRequest medicalRecordAgent,
  ) {
    return remote.putMedicalRecordAgent(id, medicalRecordAgent);
  }

  @override
  Future<void> deleteMedicalRecordAgent(
    String id,
  ) {
    return remote.deleteMedicalRecordAgent(id);
  }

  // GET_MEDICAL_RECORD_REFERRERS

  @override
  Future<List<MedicalRecordReferrer>> medicalRecordReferrers(
    String medicalRecordId,
  ) {
    return remote.medicalRecordReferrers(medicalRecordId);
  }

  @override
  Future<List<MedicalRecordReferrer>> medicalRecordReferrersByMedicalRecord(
    String medicalRecordId,
  ) {
    return remote.medicalRecordReferrersByMedicalRecord(medicalRecordId);
  }

  @override
  Future<MedicalRecordReferrer> postMedicalRecordReferrer(
    MedicalRecordReferrerRequest medicalRecordAgent,
  ) {
    return remote.postMedicalRecordReferrer(medicalRecordAgent);
  }

  @override
  Future<MedicalRecordReferrer> putMedicalRecordReferrer(
    String id,
    MedicalRecordReferrerRequest medicalRecordAgent,
  ) {
    return remote.putMedicalRecordReferrer(id, medicalRecordAgent);
  }

  @override
  Future<void> deleteMedicalRecordReferrer(
    String id,
  ) {
    return remote.deleteMedicalRecordAgent(id);
  }

  // GET_MEDICAL_RECORD_BUDGETS

  @override
  Future<List<MedicalRecordBudget>> medicalRecordBudgets(
    String medicalRecordId,
  ) {
    return remote.medicalRecordBudgets(medicalRecordId);
  }

  @override
  Future<List<MedicalRecordBudget>> medicalRecordBudgetsByMedicalRecord(
    String medicalRecordId,
  ) {
    return remote.medicalRecordBudgetsByMedicalRecord(medicalRecordId);
  }

  @override
  Future<MedicalRecordBudget> postMedicalRecordBudget(
    MedicalRecordBudgetRequest medicalRecordBudget,
  ) {
    return remote.postMedicalRecordBudget(medicalRecordBudget);
  }

  @override
  Future<MedicalRecordBudget> putMedicalRecordBudget(
    String id,
    MedicalRecordBudgetRequest medicalRecordBudget,
  ) {
    return remote.putMedicalRecordBudget(id, medicalRecordBudget);
  }

  @override
  Future<void> deleteMedicalRecordBudget(
    String id,
  ) {
    return remote.deleteMedicalRecordBudget(id);
  }

  //GET_MEDICAL_RECORD_COMPANIONS

  @override
  Future<List<MedicalRecordCompanion>> medicalRecordCompanions(
    String medicalRecordId,
  ) {
    return remote.medicalRecordCompanions(medicalRecordId);
  }

  @override
  Future<List<MedicalRecordCompanion>> medicalRecordCompanionsByMedicalRecord(
    String medicalRecordId,
  ) {
    return remote.medicalRecordCompanionsByMedicalRecord(medicalRecordId);
  }

  @override
  Future<MedicalRecordCompanion> postMedicalRecordCompanion(
    MedicalRecordCompanionRequest medicalRecordCompanion,
  ) {
    return remote.postMedicalRecordCompanion(medicalRecordCompanion);
  }

  @override
  Future<MedicalRecordCompanion> putMedicalRecordCompanion(
    String id,
    MedicalRecordCompanionRequest medicalRecordCompanion,
  ) {
    return remote.putMedicalRecordCompanion(id, medicalRecordCompanion);
  }

  @override
  Future<void> deleteMedicalRecordCompanion(
    String id,
  ) {
    return remote.deleteMedicalRecordCompanion(id);
  }

  //GET_MEDICAL_RECORD_HOSPITALS

  @override
  Future<List<MedicalRecordHospital>> medicalRecordHospitals(
    String medicalRecordId,
  ) {
    return remote.medicalRecordHospitals(medicalRecordId);
  }

  @override
  Future<List<MedicalRecordHospital>> medicalRecordHospitalsByMedicalRecord(
    String medicalRecordId,
  ) {
    return remote.medicalRecordHospitalsByMedicalRecord(medicalRecordId);
  }

  @override
  Future<MedicalRecordHospital> postMedicalRecordHospital(
    MedicalRecordHospitalRequest medicalRecordHospital,
  ) {
    return remote.postMedicalRecordHospital(medicalRecordHospital);
  }

  @override
  Future<MedicalRecordHospital> putMedicalRecordHospital(
    String id,
    MedicalRecordHospitalRequest medicalRecordHospital,
  ) {
    return remote.putMedicalRecordHospital(id, medicalRecordHospital);
  }

  @override
  Future<void> deleteMedicalRecordHospital(
    String id,
  ) {
    return remote.deleteMedicalRecordHospital(id);
  }

  //GET_MEDICAL_RECORD_INTERPRETERS

  @override
  Future<List<MedicalRecordInterpreter>> medicalRecordInterpreters(
    String medicalRecordId,
  ) {
    return remote.medicalRecordInterpreters(medicalRecordId);
  }

  @override
  Future<List<MedicalRecordInterpreter>>
      medicalRecordInterpretersByMedicalRecord(
    String medicalRecordId,
  ) {
    return remote.medicalRecordInterpretersByMedicalRecord(medicalRecordId);
  }

  @override
  Future<MedicalRecordInterpreter> postMedicalRecordInterpreter(
    MedicalRecordInterpreterRequest medicalRecordInterpreter,
  ) {
    return remote.postMedicalRecordInterpreter(medicalRecordInterpreter);
  }

  @override
  Future<MedicalRecordInterpreter> putMedicalRecordInterpreter(
    String id,
    MedicalRecordInterpreterRequest medicalRecordInterpreter,
  ) {
    return remote.putMedicalRecordInterpreter(id, medicalRecordInterpreter);
  }

  @override
  Future<void> deleteMedicalRecordInterpreter(
    String id,
  ) {
    return remote.deleteMedicalRecordInterpreter(id);
  }

  //GET_MEDICAL_RECORDS_PROGRESS

  @override
  Future<List<MedicalRecordProgress>> medicalRecordsProgress(
    String medicalRecordId,
  ) {
    return remote.medicalRecordsProgress(medicalRecordId);
  }

  @override
  Future<List<MedicalRecordProgress>> medicalRecordsProgressByMedicalRecord(
    String medicalRecordId,
  ) {
    return remote.medicalRecordsProgressByMedicalRecord(medicalRecordId);
  }

  @override
  Future<MedicalRecordProgress> postMedicalRecordProgress(
    MedicalRecordProgressRequest medicalRecordProgress,
  ) {
    return remote.postMedicalRecordProgress(medicalRecordProgress);
  }

  @override
  Future<MedicalRecordProgress> putMedicalRecordProgress(
    String id,
    MedicalRecordProgressRequest medicalRecordProgress,
  ) {
    return remote.putMedicalRecordProgress(id, medicalRecordProgress);
  }

  @override
  Future<void> deleteMedicalRecordProgress(
    String id,
  ) {
    return remote.deleteMedicalRecordProgress(id);
  }

  //GET_MEDICAL_RECORDS_OVERSEAS_DATA

  @override
  Future<List<MedicalRecordOverseaData>>
      medicalRecordOverseaDataByMedicalRecord(
    String medicalRecordId,
  ) {
    return remote.medicalRecordOverseaDataByMedicalRecord(medicalRecordId);
  }

  @override
  Future<MedicalRecordOverseaData> postMedicalRecordOverseaData(
    MedicalRecordOverseaDataRequest medicalRecordOverseaData,
  ) {
    return remote.postMedicalRecordOverseaData(medicalRecordOverseaData);
  }

  @override
  Future<MedicalRecordOverseaData> putMedicalRecordOverseaData(
    String id,
    MedicalRecordOverseaDataRequest medicalRecordOverseaData,
  ) {
    return remote.putMedicalRecordOverseaData(id, medicalRecordOverseaData);
  }

  @override
  Future<void> deleteMedicalRecordOverseaData(
    String id,
  ) {
    return remote.deleteMedicalRecordOverseaData(id);
  }

  @override
  Future<User> patientUser(String userId) {
    return remote.patientUser(userId);
  }

  @override
  Future<MedicalRecordTravelGroup> medicalRecordTravelGroups(
      String medicalRecord) {
    return remote.medicalRecordTravelGroups(medicalRecord);
  }

  @override
  Future<MedicalRecordTravelGroup> postMedicalRecordTravelGroup(
      MedicalRecordTravelGroupRequest medicalRecordTravelGroup) {
    return remote.postMedicalRecordTravelGroup(medicalRecordTravelGroup);
  }

  @override
  Future<void> deleteMedicalRecordProposal(String id) {
    return remote.deleteMedicalRecordProposal(id);
  }

  @override
  Future<List<MedicalRecordProposal>> getAllMedicalRecordProposals() {
    return remote.getAllMedicalRecordProposals();
  }

  @override
  Future<List<MedicalRecordProposal>> getMedicalRecordProposalsByMedicalRecord(
      String medicalRecord) {
    return remote.getMedicalRecordProposalsByMedicalRecord(medicalRecord);
  }

  @override
  Future<List<MedicalRecordProposal>> getOneMedicalRecordProposal(String id) {
    return remote.getOneMedicalRecordProposal(id);
  }

  @override
  Future<MedicalRecordProposal> postMedicalRecordProposal(
      MedicalRecordProposalRequest medicalRecordProposal) {
    return remote.postMedicalRecordProposal(medicalRecordProposal);
  }

  @override
  Future<MedicalRecordProposal> putMedicalRecordProposal(
      String id, MedicalRecordProposalRequest medicalRecordProposal) {
    return remote.putMedicalRecordProposal(id, medicalRecordProposal);
  }

  @override
  Future<MedicalRecordPatientResponseTreatment>
      getMedicalRecordPatientResponseTreatment({
    required String medicalRecord,
  }) {
    return remote.getMedicalRecordPatientResponseTreatment(
        medicalRecord: medicalRecord);
  }

  @override
  Future<MedicalRecordPatientResponseTreatment>
      postMedicalRecordPatientResponseTreatment(
    MedicalRecordPatientResponseTreatmentRequest
        medicalRecordPatientResponseTreatment,
  ) {
    return remote.postMedicalRecordPatientResponseTreatment(
        medicalRecordPatientResponseTreatment);
  }

  @override
  Future<MedicalRecordPatientResponseMedicalCheckup>
      getMedicalRecordPatientResponseMedicalCheckup({
    required String medicalRecord,
  }) {
    return remote.getMedicalRecordPatientResponseMedicalCheckup(
        medicalRecord: medicalRecord);
  }

  @override
  Future<MedicalRecordPatientResponseMedicalCheckup>
      postMedicalRecordPatientResponseMedicalCheckup(
    MedicalRecordPatientResponseMedicalCheckupRequest
        medicalRecordPatientResponseMedicalCheckup,
  ) {
    return remote.postMedicalRecordPatientResponseMedicalCheckup(
        medicalRecordPatientResponseMedicalCheckup);
  }

  @override
  Future<MedicalRecordPatientResponseOther>
      getMedicalRecordPatientResponseOther({
    required String medicalRecord,
  }) {
    return remote.getMedicalRecordPatientResponseOther(
        medicalRecord: medicalRecord);
  }

  @override
  Future<MedicalRecordPatientResponseOther>
      postMedicalRecordPatientResponseOther(
    MedicalRecordPatientResponseOtherRequest medicalRecordPatientResponseOther,
  ) {
    return remote.postMedicalRecordPatientResponseOther(
        medicalRecordPatientResponseOther);
  }

  @override
  Future<MedicalRecordSummary> getMedicalRecordSummary(
      {required String medicalRecord}) {
    return remote.getMedicalRecordSummary(medicalRecord: medicalRecord);
  }

  @override
  Future<MedicalRecordSummary> postMedicalRecordSummary(
      MedicalRecordSummaryRequest medicalRecordSummary) {
    return remote.postMedicalRecordSummary(medicalRecordSummary);
  }

  @override
  Future<WebBookingPatientPreferredDate> getWebBookingPatientPreferredDate(
    String medicalRecord,
  ) {
    return remote.getWebBookingPatientPreferredDate(medicalRecord);
  }

  @override
  Future<List<WebBookingMedicalRecordResponse>> getBookingMedicalRecord(
      {required String medicalRecord}) {
    return remote.getBookingMedicalRecord(medicalRecord: medicalRecord);
  }

  @override
  Future<WebBookingMedicalRecordResponse> postBookingMedicalRecord(
      WebBookingMedicalRecordRequest webBookingMedicalRecord) {
    return remote.postBookingMedicalRecord(webBookingMedicalRecord);
  }

  @override
  Future<ApplicationRegenerativeMedicalResponse>
      getApplicationRegenerattiveMedical({
    required String medicalRecord,
  }) {
    return remote.getApplicationRegenerattiveMedical(
        medicalRecord: medicalRecord);
  }

  @override
  Future<ApplicationRegenerativeMedicalResponse>
      postApplicationRegenerattiveMedical(
          ApplicationRegenerativeMedicalRequest
              applicationRegenerativeMedicalRequest) {
    return remote.postApplicationRegenerattiveMedical(
        applicationRegenerativeMedicalRequest);
  }

  @override
  Future<ApplicationBeautyResponse> getApplicationBeauty({
    required String medicalRecord,
  }) async =>
      await remote.getApplicationBeauty(medicalRecord: medicalRecord);

  @override
  Future<ApplicationBeautyResponse> postApplicationBeauty(
    ApplicationBeautyRequest applicationBeautyRequest,
  ) async =>
      await remote.postApplicationBeauty(applicationBeautyRequest);

  @override
  Future<ApplicationBloodPurificationTherapyResponse>
      getApplicationBloodPurificationTherapy({
    required String medicalRecord,
  }) async =>
          await remote.getApplicationBloodPurificationTherapy(
              medicalRecord: medicalRecord);

  @override
  Future<ApplicationBloodPurificationTherapyResponse>
      postApplicationBloodPurificationTherapy(
    ApplicationBloodPurificationTherapyRequest
        applicationBloodPurificationTherapyRequest,
  ) async =>
          await remote.postApplicationBloodPurificationTherapy(
              applicationBloodPurificationTherapyRequest);

  @override
  Future<ApplicationRiskTestResponse> getApplicationRiskTest({
    required String medicalRecord,
  }) async =>
      await remote.getApplicationRiskTest(medicalRecord: medicalRecord);

  @override
  Future<ApplicationRiskTestResponse> postApplicationRiskTest(
    ApplicationRiskTestRequest applicationRiskTestRequest,
  ) async =>
      await remote.postApplicationRiskTest(applicationRiskTestRequest);

  @override
  Future<DomesticMedicalDataResponse> postDomesticMedicalData(
      DomesticMedicalDataRequest domesticMedicalDataRequest) {
    return remote.postDomesticMedicalData(domesticMedicalDataRequest);
  }

  @override
  Future<List<DomesticMedicalDataResponse>> getDomesticMedicalData(
      {required String medicalRecordId}) {
    return remote.getDomesticMedicalData(medicalRecordId: medicalRecordId);
  }
  
  @override
  Future<List<MedicalPaymentResponse>> getMedicalPayment({required String medicalRecordId}) {
    return remote.getMedicalPayment(medicalRecordId: medicalRecordId);
  }
  
  @override
  Future<MedicalPaymentResponse> postMedicalPayment(MedicalPaymentRequest medicalPaymentRequest) {
    return remote.postMedicalPayment(medicalPaymentRequest);
  }

   @override
  Future<void> deleteMedicalPayment(String id) {
    return remote.deleteMedicalPayment(id);
  }

  @override
  Future<void> closePatientAccount(String id) {
    return remote.closePatientAccount(id);
  }

  // web booking v2


  @override
  Future<TreamentResponce> getBookingByPatientId(String patientId) {
    return remote.getBookingByPatientId(patientId);
  }

  @override
  Future<List<DoctorProfileHospitalResponse>> getDoctorsByHospitalId(
      String hospitalId) {
    return remote.getDoctorsByHospitalId(hospitalId);
  }

  @override
  Future<void> webBookingDeleteReservation(String reservationId) {
    return remote.webBookingDeleteReservation(reservationId);
  }

  @override
  Future<BasicInformationHospitalResponse> webBookingGetHospitalById(
      String id) {
    return remote.webBookingGetHospitalById(id);
  }

  @override
  Future<Patient> webBookingGetPatientById(String id) {
    return remote.webBookingGetPatientById(id);
  }

  @override
  Future<List<WebBookingMedicalRecordResponse>> webBookingGetReservationAll({
    String? hospitalName,
    String? doctor_name,
    DateTime? reservation_date_from,
    DateTime? reservation_date_to,
    bool? inquiryInProgress,
    bool? reservationConfirmed,
    String? hospitalId,
    String? patientId,
  }) {
    return remote.webBookingGetReservationAll(
      hospitalName: hospitalName,
      doctor_name: doctor_name,
      reservation_date_from: reservation_date_from,
      reservation_date_to: reservation_date_to,
      inquiryInProgress: inquiryInProgress,
      reservationConfirmed: reservationConfirmed,
      hospitalId: hospitalId,
      patientId: patientId,
    );
  }

  @override
  Future<WebBookingMedicalRecordResponse> webBookingGetReservationById(
      String id) {
    return remote.webBookingGetReservationById(id);
  }

  @override
  Future<WebBookingMedicalRecordResponse> webBookingPostReservation(
      WebBookingMedicalRecordRequest request) {
    return remote.webBookingPostReservation(request);
  }

  @override
  Future<WebBookingMedicalRecordResponse> webBookingPutReservation(
      String reservationId, WebBookingMedicalRecordRequest request) {
    return remote.webBookingPutReservation(reservationId, request);
  }

  @override
  Future<List<BasicInformationHospitalResponse>> webBookingSearchHospital(
      {String? search}) {
    return remote.webBookingSearchHospital(search: search);
  }

  @override
  Future<List<Patient>> webBookingSearchPatients({String? search}) {
    return remote.webBookingSearchPatients(search: search);
  }

  @override
  Future<TreamentResponce> updateBooking(String treatmentId, TreamentRequest treatmentRequest) {
    return remote.updateBooking(treatmentId, treatmentRequest);
  }
  
  @override
  Future<void> deleteDomesticMedical(String id) {
    return remote.deleteDomesticMedical(id);
  }
  
  //A9
  @override
  Future<void> deleteSummaryList(String patientId) {
    return remote.deleteSummaryList(patientId);
  }
  
  @override
  Future<List<MedicalRecordFileSummaryResponse>> getSummaryList(String patientId) {
    return remote.getSummaryList(patientId);
  }

  @override
  Future<List<MedicalRecordFileSummaryResponse>> getFileSummaryBySummaryId(String summaryId) {
    return remote.getFileSummaryBySummaryId(summaryId);
  }

  @override
  Future<MedicalRecordFileSummaryResponse> postFileSummary(MedicalRecordFileSummaryRequest fileRequest) {
    return remote.postFileSummary(fileRequest);
  }

  @override
  Future<void> deleteFileSummary(String id) {
    return remote.deleteFileSummary(id);
  }

  @override
  Future<void> deleteInvoice(String id) {
    return remote.deleteInvoice(id);
  }

  @override
  Future<void> deleteQuotation(String id) {
    return remote.deleteQuotation(id);
  }

  @override
  Future<List<MedicalInvoiceResponse>> getInvoices(String? medicalRecord) {
    return remote.getInvoices(medicalRecord);
  }

  @override
  Future<MedicalInvoiceResponse> getInvoicesByMedicalRecordId(String medicalRecordId) {
    return remote.getInvoicesByMedicalRecordId(medicalRecordId);
  }

  @override
  Future<List<MedicalQuotationResponse>> getQuotations(String? medicalRecord) {
    return remote.getQuotations(medicalRecord);
  }

  @override
  Future<MedicalQuotationResponse> getQuotationsByMedicalRecordId(String medicalRecordId) {
    return remote.getQuotationsByMedicalRecordId(medicalRecordId);
  }

  @override
  Future<MedicalInvoiceResponse> postInvoice(MedicalInvoiceRequest invoiceRequest) {
    return remote.postInvoice(invoiceRequest);
  }

  @override
  Future<MedicalQuotationResponse> postQuotation(MedicalQuotationRequest quotationRequest) {
    return remote.postQuotation(quotationRequest);
  }

  @override
  Future<MedicalInvoiceResponse> putInvoice(String id, MedicalInvoiceRequest invoiceRequest) {
    return remote.putInvoice(id, invoiceRequest);
  }

  @override
  Future<MedicalQuotationResponse> putQuotation(String id, MedicalQuotationRequest quotationRequest) {
    return remote.putQuotation(id, quotationRequest);
  }
  
 
}

