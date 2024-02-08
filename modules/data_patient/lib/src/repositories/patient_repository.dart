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
    PrePatientRequest prePatient,
  );

  Future<PrePatient> putPrePatient(
    String id,
    PrePatientRequest prePatient,
  );

  Future<void> deletePrePatient(
    String id,
  );

  //GET_PATIENTS

  Future<Paginated<Patient>> patients({
    String? patient_name,
    String? companyAGENTS,
    String? acceptingHospital,
    List<String?>? type,
    String? salesStaff,
    String? dateOfEntryfrom,
    String? dateOfEntryto,
    String? medicalDayfrom,
    String? medicalDayto,
    String? returnDatefrom,
    String? returnDateto,
});

  Future<Patient> patient(
    String id,
  );

  Future<Patient> postPatient(
    PatientRequest patient,
  );

  Future<Patient> putPatient(
    String id,
    PatientRequest patient,
  );

  Future<void> deletePatient(
    String id,
  );

  //GET_PATIENT_NAMES

  Future<List<PatientName>> patientNames(
    String patientId,
  );

  Future<List<PatientName>> patientNamesByPatient(
    String patientId,
  );

  Future<User> patientUser(
    String userId,
  );

  Future<PatientName> postPatientName(
    PatientNameRequest patientName,
  );

  Future<PatientName> putPatientName(
    String id,
    PatientNameRequest patientName,
  );

  Future<void> deletePatientName(
    String id,
  );

  //GET_PATIENT_NATIONALITIES
  Future<List<PatientNationality>> patientNationalities(
    String patientId,
  );

  Future<List<PatientNationality>> patientNationalitiesByPatient(
    String id,
  );

  Future<PatientNationality> postPatientNationality(
    PatientNationalityRequest patientNationality,
  );

  Future<PatientNationality> putPatientNationality(
    String id,
    PatientNationalityRequest patientNationality,
  );

  Future<void> deletePatientNationality(
    String id,
  );

  //GET_PATIENT_PASSPORTS
  Future<List<PatientPassport>> patientPassports(
    String patientId,
  );

  Future<List<PatientPassport>> patientPassportsByPatient(
    String patientId,
  );

  Future<PatientPassport> postPatientPassport(
    PatientPassportRequest patientPassport,
  );

  Future<PatientPassport> putPatientPassport(
    String id,
    PatientPassportRequest patientPassport,
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

  Future<List<MedicalRecord>> medicalRecordsByPatient(
    String patientId,
  );

  Future<MedicalRecord> postMedicalRecord(
    MedicalRecordRequest medicalRecord,
  );

  Future<MedicalRecord> putMedicalRecord(
    String id,
    MedicalRecordRequest medicalRecord,
  );

  Future<void> deleteMedicalRecord(
    String id,
  );

  //GET_MEDICAL_RECORD_AGENTS

  Future<List<MedicalRecordAgent>> medicalRecordAgents(
    String medicalRecordId,
  );

  Future<List<MedicalRecordAgent>> medicalRecordAgentsByMedicalRecord(
    String medicalRecordId,
  );

  Future<MedicalRecordAgent> postMedicalRecordAgent(
    MedicalRecordAgentRequest medicalRecordAgent,
  );

  Future<MedicalRecordAgent> putMedicalRecordAgent(
    String id,
    MedicalRecordAgentRequest medicalRecordAgent,
  );

  Future<void> deleteMedicalRecordAgent(
    String id,
  );

  //GET_MEDICAL_RECORD_REFERRERS

  Future<List<MedicalRecordReferrer>> medicalRecordReferrers(
      String medicalRecordId,
      );

  Future<List<MedicalRecordReferrer>> medicalRecordReferrersByMedicalRecord(
      String medicalRecordId,
      );

  Future<MedicalRecordReferrer> postMedicalRecordReferrer(
      MedicalRecordReferrerRequest medicalRecordAgent,
      );

  Future<MedicalRecordReferrer> putMedicalRecordReferrer(
      String id,
      MedicalRecordReferrerRequest medicalRecordAgent,
      );

  Future<void> deleteMedicalRecordReferrer(
      String id,
      );

  // GET_MEDICAL_RECORD_BUDGETS

  Future<List<MedicalRecordBudget>> medicalRecordBudgets(
    String medicalRecordId,
  );

  Future<List<MedicalRecordBudget>> medicalRecordBudgetsByMedicalRecord(
    String medicalRecordId,
  );

  Future<MedicalRecordBudget> postMedicalRecordBudget(
    MedicalRecordBudgetRequest medicalRecordBudget,
  );

  Future<MedicalRecordBudget> putMedicalRecordBudget(
    String id,
    MedicalRecordBudgetRequest medicalRecordBudget,
  );

  Future<void> deleteMedicalRecordBudget(
    String id,
  );

//GET_MEDICAL_RECORD_COMPANIONS

  Future<List<MedicalRecordCompanion>> medicalRecordCompanions(
    String medicalRecordId,
  );

  Future<List<MedicalRecordCompanion>> medicalRecordCompanionsByMedicalRecord(
    String medicalRecordId,
  );

  Future<MedicalRecordCompanion> postMedicalRecordCompanion(
    MedicalRecordCompanionRequest medicalRecordCompanion,
  );

  Future<MedicalRecordCompanion> putMedicalRecordCompanion(
    String id,
    MedicalRecordCompanionRequest medicalRecordCompanion,
  );

  Future<void> deleteMedicalRecordCompanion(
    String id,
  );

//GET_MEDICAL_RECORD_HOSPITALS
  Future<List<MedicalRecordHospital>> medicalRecordHospitals(
    String medicalRecordId,
  );

  Future<List<MedicalRecordHospital>> medicalRecordHospitalsByMedicalRecord(
    String medicalRecordId,
  );

  Future<MedicalRecordHospital> postMedicalRecordHospital(
    MedicalRecordHospitalRequest medicalRecordHospital,
  );

  Future<MedicalRecordHospital> putMedicalRecordHospital(
    String id,
    MedicalRecordHospitalRequest medicalRecordHospital,
  );

  Future<void> deleteMedicalRecordHospital(
    String id,
  );

//GET_MEDICAL_RECORD_INTERPRETERS
  Future<List<MedicalRecordInterpreter>> medicalRecordInterpreters(
    String medicalRecordId,
  );

  Future<List<MedicalRecordInterpreter>>
      medicalRecordInterpretersByMedicalRecord(
    String medicalRecordId,
  );

  Future<MedicalRecordInterpreter> postMedicalRecordInterpreter(
    MedicalRecordInterpreterRequest medicalRecordInterpreter,
  );

  Future<MedicalRecordInterpreter> putMedicalRecordInterpreter(
    String id,
    MedicalRecordInterpreterRequest medicalRecordInterpreter,
  );

  Future<void> deleteMedicalRecordInterpreter(
    String id,
  );

//GET_MEDICAL_RECORDS_PROGRESS
  Future<List<MedicalRecordProgress>> medicalRecordsProgress(
    String medicalRecordId,
  );

  Future<List<MedicalRecordProgress>> medicalRecordsProgressByMedicalRecord(
    String medicalRecordId,
  );

  Future<MedicalRecordProgress> postMedicalRecordProgress(
    MedicalRecordProgressRequest medicalRecordProgress,
  );

  Future<MedicalRecordProgress> putMedicalRecordProgress(
    String id,
    MedicalRecordProgressRequest medicalRecordProgress,
  );

  Future<void> deleteMedicalRecordProgress(
    String id,
  );

//GET_MEDICAL_RECORDS_OVERSEAS
  Future<List<MedicalRecordOversea>> medicalRecordsOverseas(
    String medicalRecordId,
  );

  Future<List<MedicalRecordOversea>> medicalRecordsOverseasByMedicalRecord(
    String medicalRecordId,
  );

  Future<MedicalRecordOversea> postMedicalRecordOversea(
    MedicalRecordOverseaRequest medicalRecordOversea,
  );

  Future<MedicalRecordOversea> putMedicalRecordOversea(
    String id,
    MedicalRecordOverseaRequest medicalRecordOversea,
  );

  Future<void> deleteMedicalRecordOversea(
    String id,
  );

//GET_MEDICAL_RECORDS_OVERSEAS_DATA
  Future<List<MedicalRecordOverseaData>> medicalRecordsOverseasData(
    String medicalRecordOverseaId,
  );

  Future<List<MedicalRecordOverseaData>>
      medicalRecordsOverseaDataByMedicalRecordOversea(
    String medicalRecordOverseaId,
  );

  Future<MedicalRecordOverseaData> postMedicalRecordOverseaData(
    MedicalRecordOverseaDataRequest medicalRecordOverseaData,
  );

  Future<MedicalRecordOverseaData> putMedicalRecordOverseaData(
    String id,
    MedicalRecordOverseaDataRequest medicalRecordOverseaData,
  );

  Future<void> deleteMedicalRecordOverseaData(
    String id,
  );

  Future<MedicalRecordTravelGroup> medicalRecordTravelGroups(
    String medicalRecord,
  );

  Future<MedicalRecordTravelGroup> postMedicalRecordTravelGroup(
    MedicalRecordTravelGroupRequest medicalRecordTravelGroup,
  );
}
