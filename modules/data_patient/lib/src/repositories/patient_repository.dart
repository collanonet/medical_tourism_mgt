import 'package:core_network/core_network.dart';

abstract class PatientRepository {
  //GET_PRE_PATIENTS

  Future<Paginated<PrePatient>> prePatients({
    int? page,
    int? limit,
    String? agents,
    String? patient,
  });

  Future<PrePatient> postPrePatient(
    PrePatient prePatient,
  );

  Future<PrePatient> putPrePatient(
    PrePatient prePatient,
  );

  Future<void> deletePrePatient(
    String id,
  );

  //GET_PATIENTS

  Future<Paginated<Patient>> patients();

  Future<Patient> postPatient(
      PatientRequest patient,
  );

  Future<Patient> putPatient(
    Patient patient,
  );

  Future<void> deletePatient(
    String id,
  );

  //GET_PATIENT_NAMES

  Future<List<PatientName>> patientNames(
    String patientId,
  );

  Future<PatientName> postPatientName(
    PatientName patientName,
  );

  Future<PatientName> putPatientName(
    PatientName patientName,
  );

  Future<void> deletePatientName(
    String id,
  );

  //GET_PATIENT_NATIONALITIES
  Future<List<PatientNationality>> patientNationalities(
    String patientId,
  );

  Future<PatientNationality> postPatientNationality(
    PatientNationality patientNationality,
  );

  Future<PatientNationality> putPatientNationality(
    PatientNationality patientNationality,
  );

  Future<void> deletePatientNationality(
    String id,
  );

  //GET_PATIENT_PASSPORTS
  Future<List<PatientPassport>> patientPassports(
    String patientId,
  );

  Future<PatientPassport> postPatientPassport(
    PatientPassport patientPassport,
  );

  Future<PatientPassport> putPatientPassport(
    PatientPassport patientPassport,
  );

  Future<void> deletePatientPassport(
    String id,
  );

  //GET_MEDICAL_RECORDS

  Future<List<MedicalRecord>> medicalRecords({
    int? page,
    int? limit,
    String? patient,
  });

  Future<MedicalRecord> postMedicalRecord(
    MedicalRecord medicalRecord,
  );

  Future<MedicalRecord> putMedicalRecord(
    MedicalRecord medicalRecord,
  );

  Future<void> deleteMedicalRecord(
    String id,
  );

  //GET_MEDICAL_RECORD_AGENTS

  Future<List<MedicalRecordAgent>> medicalRecordAgents(
    String medicalRecordId,
  );

  Future<MedicalRecordAgent> postMedicalRecordAgent(
    MedicalRecordAgent medicalRecordAgent,
  );

  Future<MedicalRecordAgent> putMedicalRecordAgent(
    MedicalRecordAgent medicalRecordAgent,
  );

  Future<void> deleteMedicalRecordAgent(
    String id,
  );

  // GET_MEDICAL_RECORD_BUDGETS

  Future<List<MedicalRecordBudget>> medicalRecordBudgets(
    String medicalRecordId,
  );

  Future<MedicalRecordBudget> postMedicalRecordBudget(
    MedicalRecordBudget medicalRecordBudget,
  );

  Future<MedicalRecordBudget> putMedicalRecordBudget(
    MedicalRecordBudget medicalRecordBudget,
  );

  Future<void> deleteMedicalRecordBudget(
    String id,
  );

//GET_MEDICAL_RECORD_COMPANIONS

  Future<List<MedicalRecordCompanion>> medicalRecordCompanions(
    String medicalRecordId,
  );

  Future<MedicalRecordCompanion> postMedicalRecordCompanion(
    MedicalRecordCompanion medicalRecordCompanion,
  );

  Future<MedicalRecordCompanion> putMedicalRecordCompanion(
    MedicalRecordCompanion medicalRecordCompanion,
  );

  Future<void> deleteMedicalRecordCompanion(
    String id,
  );

//GET_MEDICAL_RECORD_HOSPITALS
  Future<List<MedicalRecordHospital>> medicalRecordHospitals(
    String medicalRecordId,
  );

  Future<MedicalRecordHospital> postMedicalRecordHospital(
    MedicalRecordHospital medicalRecordHospital,
  );

  Future<MedicalRecordHospital> putMedicalRecordHospital(
    MedicalRecordHospital medicalRecordHospital,
  );

  Future<void> deleteMedicalRecordHospital(
    String id,
  );

//GET_MEDICAL_RECORD_INTERPRETERS
  Future<List<MedicalRecordInterpreter>> medicalRecordInterpreters(
    String medicalRecordId,
  );

  Future<MedicalRecordInterpreter> postMedicalRecordInterpreter(
    MedicalRecordInterpreter medicalRecordInterpreter,
  );

  Future<MedicalRecordInterpreter> putMedicalRecordInterpreter(
    MedicalRecordInterpreter medicalRecordInterpreter,
  );

  Future<void> deleteMedicalRecordInterpreter(
    String id,
  );

//GET_MEDICAL_RECORDS_PROGRESS
  Future<List<MedicalRecordProgress>> medicalRecordsProgress(
    String medicalRecordId,
  );

  Future<MedicalRecordProgress> postMedicalRecordProgress(
    MedicalRecordProgress medicalRecordProgress,
  );

  Future<MedicalRecordProgress> putMedicalRecordProgress(
    MedicalRecordProgress medicalRecordProgress,
  );

  Future<void> deleteMedicalRecordProgress(
    String id,
  );

//GET_MEDICAL_RECORDS_OVERSEAS
  Future<List<MedicalRecordOversea>> medicalRecordsOverseas(
    String medicalRecordId,
  );

  Future<MedicalRecordOversea> postMedicalRecordOversea(
    MedicalRecordOversea medicalRecordOversea,
  );

  Future<MedicalRecordOversea> putMedicalRecordOversea(
    MedicalRecordOversea medicalRecordOversea,
  );

  Future<void> deleteMedicalRecordOversea(
    String id,
  );

//GET_MEDICAL_RECORDS_OVERSEAS_DATA
  Future<List<MedicalRecordOverseaData>> medicalRecordsOverseasData(
    String medicalRecordOverseaId,
  );

  Future<MedicalRecordOverseaData> postMedicalRecordOverseaData(
    MedicalRecordOverseaData medicalRecordOverseaData,
  );

  Future<MedicalRecordOverseaData> putMedicalRecordOverseaData(
    MedicalRecordOverseaData medicalRecordOverseaData,
  );

  Future<void> deleteMedicalRecordOverseaData(
    String id,
  );
}
