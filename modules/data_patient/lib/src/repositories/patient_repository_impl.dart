import 'package:core_network/entities.dart';
import 'package:injectable/injectable.dart';

import '../providers/patient_local_provider.dart';
import '../providers/patient_remote_provider.dart';
import 'patient_repository.dart';

@Injectable(as: PatientRepository)
class PatientRepositoryIml extends PatientRepository {
  PatientRepositoryIml({
    required this.remote,
    required this.local,
  });

  final PatientRemoteProvider remote;
  final PatientLocalProvider local;

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
    PrePatient prePatient,
  ) {
    return remote.postPrePatient(prePatient);
  }

  @override
  Future<PrePatient> putPrePatient(
    PrePatient prePatient,
  ) {
    return remote.putPrePatient(prePatient);
  }

  @override
  Future<void> deletePrePatient(
    String id,
  ) {
    return remote.deletePrePatient(id);
  }

  //GET_PATIENTS

  @override
  Future<Paginated<Patient>> patients() {
    return remote.patients();
  }

  @override
  Future<Patient> postPatient(
    Patient patient,
  ) {
    return remote.postPatient(patient);
  }

  @override
  Future<Patient> putPatient(
    Patient patient,
  ) {
    return remote.putPatient(patient);
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
  Future<PatientName> postPatientName(
    PatientName patientName,
  ) {
    return remote.postPatientName(patientName);
  }

  @override
  Future<PatientName> putPatientName(
    PatientName patientName,
  ) {
    return remote.putPatientName(patientName);
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
  Future<PatientNationality> postPatientNationality(
    PatientNationality patientNationality,
  ) {
    return remote.postPatientNationality(patientNationality);
  }

  @override
  Future<PatientNationality> putPatientNationality(
    PatientNationality patientNationality,
  ) {
    return remote.putPatientNationality(patientNationality);
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
  Future<PatientPassport> postPatientPassport(
    PatientPassport patientPassport,
  ) {
    return remote.postPatientPassport(patientPassport);
  }

  @override
  Future<PatientPassport> putPatientPassport(
    PatientPassport patientPassport,
  ) {
    return remote.putPatientPassport(patientPassport);
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
  Future<MedicalRecord> postMedicalRecord(
    MedicalRecord medicalRecord,
  ) {
    return remote.postMedicalRecord(medicalRecord);
  }

  @override
  Future<MedicalRecord> putMedicalRecord(
    MedicalRecord medicalRecord,
  ) {
    return remote.putMedicalRecord(medicalRecord);
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
  Future<MedicalRecordAgent> postMedicalRecordAgent(
    MedicalRecordAgent medicalRecordAgent,
  ) {
    return remote.postMedicalRecordAgent(medicalRecordAgent);
  }

  @override
  Future<MedicalRecordAgent> putMedicalRecordAgent(
    MedicalRecordAgent medicalRecordAgent,
  ) {
    return remote.putMedicalRecordAgent(medicalRecordAgent);
  }

  @override
  Future<void> deleteMedicalRecordAgent(
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
  Future<MedicalRecordBudget> postMedicalRecordBudget(
    MedicalRecordBudget medicalRecordBudget,
  ) {
    return remote.postMedicalRecordBudget(medicalRecordBudget);
  }

  @override
  Future<MedicalRecordBudget> putMedicalRecordBudget(
    MedicalRecordBudget medicalRecordBudget,
  ) {
    return remote.putMedicalRecordBudget(medicalRecordBudget);
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
  Future<MedicalRecordCompanion> postMedicalRecordCompanion(
    MedicalRecordCompanion medicalRecordCompanion,
  ) {
    return remote.postMedicalRecordCompanion(medicalRecordCompanion);
  }

  @override
  Future<MedicalRecordCompanion> putMedicalRecordCompanion(
    MedicalRecordCompanion medicalRecordCompanion,
  ) {
    return remote.putMedicalRecordCompanion(medicalRecordCompanion);
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
  Future<MedicalRecordHospital> postMedicalRecordHospital(
    MedicalRecordHospital medicalRecordHospital,
  ) {
    return remote.postMedicalRecordHospital(medicalRecordHospital);
  }

  @override
  Future<MedicalRecordHospital> putMedicalRecordHospital(
    MedicalRecordHospital medicalRecordHospital,
  ) {
    return remote.putMedicalRecordHospital(medicalRecordHospital);
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
  Future<MedicalRecordInterpreter> postMedicalRecordInterpreter(
    MedicalRecordInterpreter medicalRecordInterpreter,
  ) {
    return remote.postMedicalRecordInterpreter(medicalRecordInterpreter);
  }

  @override
  Future<MedicalRecordInterpreter> putMedicalRecordInterpreter(
    MedicalRecordInterpreter medicalRecordInterpreter,
  ) {
    return remote.putMedicalRecordInterpreter(medicalRecordInterpreter);
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
  Future<MedicalRecordProgress> postMedicalRecordProgress(
    MedicalRecordProgress medicalRecordProgress,
  ) {
    return remote.postMedicalRecordProgress(medicalRecordProgress);
  }

  @override
  Future<MedicalRecordProgress> putMedicalRecordProgress(
    MedicalRecordProgress medicalRecordProgress,
  ) {
    return remote.putMedicalRecordProgress(medicalRecordProgress);
  }

  @override
  Future<void> deleteMedicalRecordProgress(
    String id,
  ) {
    return remote.deleteMedicalRecordProgress(id);
  }

//GET_MEDICAL_RECORDS_OVERSEAS

  @override
  Future<List<MedicalRecordOversea>> medicalRecordsOverseas(
    String medicalRecordId,
  ) {
    return remote.medicalRecordsOverseas(medicalRecordId);
  }

  @override
  Future<MedicalRecordOversea> postMedicalRecordOversea(
    MedicalRecordOversea medicalRecordOversea,
  ) {
    return remote.postMedicalRecordOversea(medicalRecordOversea);
  }

  @override
  Future<MedicalRecordOversea> putMedicalRecordOversea(
    MedicalRecordOversea medicalRecordOversea,
  ) {
    return remote.putMedicalRecordOversea(medicalRecordOversea);
  }

  @override
  Future<void> deleteMedicalRecordOversea(
    String id,
  ) {
    return remote.deleteMedicalRecordOversea(id);
  }

  //GET_MEDICAL_RECORDS_OVERSEAS_DATA

  @override
  Future<List<MedicalRecordOverseaData>> medicalRecordsOverseasData(
    String medicalRecordOverseaId,
  ) {
    return remote.medicalRecordsOverseaData(medicalRecordOverseaId);
  }

  @override
  Future<MedicalRecordOverseaData> postMedicalRecordOverseaData(
    MedicalRecordOverseaData medicalRecordOverseaData,
  ) {
    return remote.postMedicalRecordOverseaData(medicalRecordOverseaData);
  }

  @override
  Future<MedicalRecordOverseaData> putMedicalRecordOverseaData(
    MedicalRecordOverseaData medicalRecordOverseaData,
  ) {
    return remote.putMedicalRecordOverseaData(medicalRecordOverseaData);
  }

  @override
  Future<void> deleteMedicalRecordOverseaData(
    String id,
  ) {
    return remote.deleteMedicalRecordOverseaData(id);
  }
}
