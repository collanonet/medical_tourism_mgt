import 'package:core_network/core_network.dart';
import 'package:injectable/injectable.dart';

@injectable
class PatientRemoteProvider {
  PatientRemoteProvider({
    required this.apiService,
  });

  final ApiService apiService;

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

  Future<Paginated<Patient>> patients() async => await apiService.patients();

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

  // GET_MEDICAL_RECORD_COMPANIONS
  Future<List<MedicalRecordCompanion>> medicalRecordCompanions(
    String medicalRecordId,
  ) async =>
      await apiService.medicalRecordCompanions(medicalRecordId);

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

// GET_MEDICAL_RECORDS_OVERSEAS
  Future<List<MedicalRecordOversea>> medicalRecordsOverseas(
    String medicalRecordId,
  ) async =>
      await apiService.medicalRecordsOverseas(medicalRecordId);

  Future<MedicalRecordOversea> postMedicalRecordOversea(
    MedicalRecordOverseaRequest medicalRecordOversea,
  ) async =>
      await apiService.postMedicalRecordOversea(medicalRecordOversea);

  Future<MedicalRecordOversea> putMedicalRecordOversea(
    String id,
    MedicalRecordOverseaRequest medicalRecordOversea,
  ) async =>
      await apiService.putMedicalRecordOversea(id, medicalRecordOversea);

  Future<void> deleteMedicalRecordOversea(
    String id,
  ) async =>
      await apiService.deleteMedicalRecordOversea(id);

// GET_MEDICAL_RECORDS_OVERSEAS_DATA
  Future<List<MedicalRecordOverseaData>> medicalRecordsOverseaData(
    String medicalRecordOverseaId,
  ) async =>
      await apiService.medicalRecordsOverseaData(medicalRecordOverseaId);

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
}
