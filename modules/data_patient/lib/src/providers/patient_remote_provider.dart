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
    PrePatient prePatient,
  ) async =>
      await apiService.postPrePatient(prePatient);

  Future<PrePatient> putPrePatient(
    PrePatient prePatient,
  ) async =>
      await apiService.putPrePatient(prePatient);

  Future<void> deletePrePatient(
    String id,
  ) async =>
      await apiService.deletePrePatient(id);

  Future<Paginated<Patient>> patients() async => await apiService.patients();

  Future<Patient> postPatient(
      PatientRequest patient,
  ) async =>
      await apiService.postPatient(patient);

  Future<Patient> putPatient(
    Patient patient,
  ) async =>
      await apiService.putPatient(patient);

  Future<void> deletePatient(
    String id,
  ) async =>
      await apiService.deletePatient(id);

  Future<List<PatientName>> patientNames(
    String patientId,
  ) async =>
      await apiService.patientNames(patientId);

  Future<PatientName> postPatientName(
    PatientName patientName,
  ) async =>
      await apiService.postPatientName(patientName);

  Future<PatientName> putPatientName(
    PatientName patientName,
  ) async =>
      await apiService.putPatientName(patientName);

  Future<void> deletePatientName(
    String id,
  ) async =>
      await apiService.deletePatientName(id);

  Future<List<PatientNationality>> patientNationalities(
    String patientId,
  ) async =>
      await apiService.patientNationalities(patientId);

  Future<PatientNationality> postPatientNationality(
    PatientNationality patientNationality,
  ) async =>
      await apiService.postPatientNationality(patientNationality);

  Future<PatientNationality> putPatientNationality(
    PatientNationality patientNationality,
  ) async =>
      await apiService.putPatientNationality(patientNationality);

  Future<void> deletePatientNationality(
    String id,
  ) async =>
      await apiService.deletePatientNationality(id);

  Future<List<PatientPassport>> patientPassports(
    String patientId,
  ) async =>
      await apiService.patientPassports(patientId);

  Future<PatientPassport> postPatientPassport(
    PatientPassport patientPassport,
  ) async =>
      await apiService.postPatientPassport(patientPassport);

  Future<PatientPassport> putPatientPassport(
    PatientPassport patientPassport,
  ) async =>
      await apiService.putPatientPassport(patientPassport);

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
    MedicalRecord medicalRecord,
  ) async =>
      await apiService.postMedicalRecord(medicalRecord);

  Future<MedicalRecord> putMedicalRecord(
    MedicalRecord medicalRecord,
  ) async =>
      await apiService.putMedicalRecord(medicalRecord);

  Future<void> deleteMedicalRecord(
    String id,
  ) async =>
      await apiService.deleteMedicalRecord(id);

  Future<List<MedicalRecordBudget>> medicalRecordBudgets(
    String medicalRecordId,
  ) async =>
      await apiService.medicalRecordBudgets(medicalRecordId);

  Future<MedicalRecordBudget> postMedicalRecordBudget(
    MedicalRecordBudget medicalRecordBudget,
  ) async =>
      await apiService.postMedicalRecordBudget(medicalRecordBudget);

  Future<MedicalRecordBudget> putMedicalRecordBudget(
    MedicalRecordBudget medicalRecordBudget,
  ) async =>
      await apiService.putMedicalRecordBudget(medicalRecordBudget);

  Future<void> deleteMedicalRecordBudget(
    String id,
  ) async =>
      await apiService.deleteMedicalRecordBudget(id);

  Future<List<MedicalRecordAgent>> medicalRecordAgents(
    String medicalRecordId,
  ) async =>
      await apiService.medicalRecordAgents(medicalRecordId);

  Future<MedicalRecordAgent> postMedicalRecordAgent(
    MedicalRecordAgent medicalRecordAgent,
  ) async =>
      await apiService.postMedicalRecordAgent(medicalRecordAgent);

  Future<MedicalRecordAgent> putMedicalRecordAgent(
    MedicalRecordAgent medicalRecordAgent,
  ) async =>
      await apiService.putMedicalRecordAgent(medicalRecordAgent);

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
    MedicalRecordCompanion medicalRecordCompanion,
  ) async =>
      await apiService.postMedicalRecordCompanion(medicalRecordCompanion);

  Future<MedicalRecordCompanion> putMedicalRecordCompanion(
    MedicalRecordCompanion medicalRecordCompanion,
  ) async =>
      await apiService.putMedicalRecordCompanion(medicalRecordCompanion);

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
    MedicalRecordHospital medicalRecordHospital,
  ) async =>
      await apiService.postMedicalRecordHospital(medicalRecordHospital);

  Future<MedicalRecordHospital> putMedicalRecordHospital(
    MedicalRecordHospital medicalRecordHospital,
  ) async =>
      await apiService.putMedicalRecordHospital(medicalRecordHospital);

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
    MedicalRecordInterpreter medicalRecordInterpreter,
  ) async =>
      await apiService.postMedicalRecordInterpreter(medicalRecordInterpreter);

  Future<MedicalRecordInterpreter> putMedicalRecordInterpreter(
    MedicalRecordInterpreter medicalRecordInterpreter,
  ) async =>
      await apiService.putMedicalRecordInterpreter(medicalRecordInterpreter);

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
    MedicalRecordProgress medicalRecordProgress,
  ) async =>
      await apiService.postMedicalRecordProgress(medicalRecordProgress);

  Future<MedicalRecordProgress> putMedicalRecordProgress(
    MedicalRecordProgress medicalRecordProgress,
  ) async =>
      await apiService.putMedicalRecordProgress(medicalRecordProgress);

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
    MedicalRecordOversea medicalRecordOversea,
  ) async =>
      await apiService.postMedicalRecordOversea(medicalRecordOversea);

  Future<MedicalRecordOversea> putMedicalRecordOversea(
    MedicalRecordOversea medicalRecordOversea,
  ) async =>
      await apiService.putMedicalRecordOversea(medicalRecordOversea);

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
    MedicalRecordOverseaData medicalRecordOverseaData,
  ) async =>
      await apiService.postMedicalRecordOverseaData(medicalRecordOverseaData);

  Future<MedicalRecordOverseaData> putMedicalRecordOverseaData(
    MedicalRecordOverseaData medicalRecordOverseaData,
  ) async =>
      await apiService.putMedicalRecordOverseaData(medicalRecordOverseaData);

  Future<void> deleteMedicalRecordOverseaData(
    String id,
  ) async =>
      await apiService.deleteMedicalRecordOverseaData(id);
}
