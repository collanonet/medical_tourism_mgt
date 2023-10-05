import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../core_network.dart';
import 'apis.dart';

part 'api_service.g.dart';

@RestApi()
@singleton
abstract class ApiService {
  @factoryMethod
  factory ApiService(RestClient client) {
    return _ApiService(client.dio, baseUrl: client.baseUrl);
  }

  @POST(Apis.LOG_IN)
  Future<AuthData> login(
    @Field('email') String email,
    @Field('password') String password,
  );

  @POST(Apis.REFRESH_TOKEN)
  Future<AuthData> refreshToken(
    @Field('refresh-token') String refreshToken,
  );

  @POST(Apis.LOG_OUT)
  Future<AuthData> logOut();

  //GET_PRE_PATIENTS

  @GET(Apis.GET_PRE_PATIENTS)
  Future<Paginated<PrePatient>> prePatients({
    @Query('page') int? page,
    @Query('limit') int? limit,
    @Query('agents') String? agents,
    @Query('patient') String? patient,
  });

  @POST(Apis.POST_PRE_PATIENTS)
  Future<PrePatient> postPrePatient(
    @Body() PrePatient prePatient,
  );

  @PUT(Apis.PUT_PRE_PATIENTS)
  Future<PrePatient> putPrePatient(
    @Body() PrePatient prePatient,
  );

  @DELETE(Apis.DELETE_PRE_PATIENT)
  Future<void> deletePrePatient(
    @Path() String id,
  );

  //GET_PATIENTS

  @GET(Apis.GET_PATIENTS)
  Future<Paginated<Patient>> patients();

  @POST(Apis.POST_PATIENTS)
  Future<Patient> postPatient(
    @Body() Patient patient,
  );

  @PUT(Apis.PUT_PATIENTS)
  Future<Patient> putPatient(
    @Body() Patient patient,
  );

  @DELETE(Apis.DELETE_PATIENT)
  Future<void> deletePatient(
    @Path() String id,
  );

  //GET_PATIENT_NAMES

  @GET(Apis.GET_PATIENT_NAMES)
  Future<List<PatientName>> patientNames(
    @Path() String patientId,
  );

  @POST(Apis.POST_PATIENT_NAMES)
  Future<PatientName> postPatientName(
    @Body() PatientName patientName,
  );

  @PUT(Apis.PUT_PATIENT_NAMES)
  Future<PatientName> putPatientName(
    @Body() PatientName patientName,
  );

  @DELETE(Apis.DELETE_PATIENT_NAMES)
  Future<void> deletePatientName(
    @Path() String id,
  );

  //GET_PATIENT_NATIONALITIES

  @GET(Apis.GET_PATIENT_NATIONALITIES)
  Future<List<PatientNationality>> patientNationalities(
    @Path() String patientId,
  );

  @POST(Apis.POST_PATIENT_NATIONALITIES)
  Future<PatientNationality> postPatientNationality(
    @Body() PatientNationality patientNationality,
  );

  @PUT(Apis.PUT_PATIENT_NATIONALITIES)
  Future<PatientNationality> putPatientNationality(
    @Body() PatientNationality patientNationality,
  );

  @DELETE(Apis.DELETE_PATIENT_NATIONALITIES)
  Future<void> deletePatientNationality(
    @Path() String id,
  );

  //GET_PATIENT_PASSPORTS

  @GET(Apis.GET_PATIENT_PASSPORTS)
  Future<List<PatientPassport>> patientPassports(
    @Path() String patientId,
  );

  @POST(Apis.POST_PATIENT_PASSPORTS)
  Future<PatientPassport> postPatientPassport(
    @Body() PatientPassport patientPassport,
  );

  @PUT(Apis.PUT_PATIENT_PASSPORTS)
  Future<PatientPassport> putPatientPassport(
    @Body() PatientPassport patientPassport,
  );

  @DELETE(Apis.DELETE_PATIENT_PASSPORTS)
  Future<void> deletePatientPassport(
    @Path() @Path('id') String id,
  );

  //GET_MEDICAL_RECORDS

  @GET(Apis.GET_MEDICAL_RECORDS)
  Future<List<MedicalRecord>> medicalRecords({
    @Query('page') int? page,
    @Query('limit') int? limit,
    @Query('patient') String? patient,
  });

  @POST(Apis.POST_MEDICAL_RECORDS)
  Future<MedicalRecord> postMedicalRecord(
    @Body() MedicalRecord medicalRecord,
  );

  @PUT(Apis.PUT_MEDICAL_RECORDS)
  Future<MedicalRecord> putMedicalRecord(
    @Body() MedicalRecord medicalRecord,
  );

  @DELETE(Apis.DELETE_MEDICAL_RECORDS)
  Future<void> deleteMedicalRecord(
    @Path() String id,
  );

  //GET_MEDICAL_RECORD_AGENTS

  @GET(Apis.GET_MEDICAL_RECORD_AGENTS)
  Future<List<MedicalRecordAgent>> medicalRecordAgents(
    @Path() String medicalRecordId,
  );

  @POST(Apis.POST_MEDICAL_RECORD_AGENTS)
  Future<MedicalRecordAgent> postMedicalRecordAgent(
    @Body() MedicalRecordAgent medicalRecordAgent,
  );

  @PUT(Apis.PUT_MEDICAL_RECORD_AGENTS)
  Future<MedicalRecordAgent> putMedicalRecordAgent(
    @Body() MedicalRecordAgent medicalRecordAgent,
  );

  @DELETE(Apis.DELETE_MEDICAL_RECORD_AGENTS)
  Future<void> deleteMedicalRecordAgent(
    @Path() String id,
  );

  // GET_MEDICAL_RECORD_BUDGETS

  @GET(Apis.GET_MEDICAL_RECORD_BUDGETS)
  Future<List<MedicalRecordBudget>> medicalRecordBudgets(
    @Path() String medicalRecordId,
  );

  @POST(Apis.POST_MEDICAL_RECORD_BUDGETS)
  Future<MedicalRecordBudget> postMedicalRecordBudget(
    @Body() MedicalRecordBudget medicalRecordBudget,
  );

  @PUT(Apis.PUT_MEDICAL_RECORD_BUDGETS)
  Future<MedicalRecordBudget> putMedicalRecordBudget(
    @Body() MedicalRecordBudget medicalRecordBudget,
  );

  @DELETE(Apis.DELETE_MEDICAL_RECORD_BUDGETS)
  Future<void> deleteMedicalRecordBudget(
    @Path() String id,
  );

  //GET_MEDICAL_RECORD_COMPANIONS

  @GET(Apis.GET_MEDICAL_RECORD_COMPANIONS)
  Future<List<MedicalRecordCompanion>> medicalRecordCompanions(
    @Path() String medicalRecordId,
  );

  @POST(Apis.POST_MEDICAL_RECORD_COMPANIONS)
  Future<MedicalRecordCompanion> postMedicalRecordCompanion(
    @Body() MedicalRecordCompanion medicalRecordCompanion,
  );

  @PUT(Apis.PUT_MEDICAL_RECORD_COMPANIONS)
  Future<MedicalRecordCompanion> putMedicalRecordCompanion(
    @Body() MedicalRecordCompanion medicalRecordCompanion,
  );

  @DELETE(Apis.DELETE_MEDICAL_RECORD_COMPANIONS)
  Future<void> deleteMedicalRecordCompanion(
    @Path() String id,
  );

  //GET_MEDICAL_RECORD_HOSPITALS

  @GET(Apis.GET_MEDICAL_RECORD_HOSPITALS)
  Future<List<MedicalRecordHospital>> medicalRecordHospitals(
    @Path() String medicalRecordId,
  );

  @POST(Apis.POST_MEDICAL_RECORD_HOSPITALS)
  Future<MedicalRecordHospital> postMedicalRecordHospital(
    @Body() MedicalRecordHospital medicalRecordHospital,
  );

  @PUT(Apis.PUT_MEDICAL_RECORD_HOSPITALS)
  Future<MedicalRecordHospital> putMedicalRecordHospital(
    @Body() MedicalRecordHospital medicalRecordHospital,
  );

  @DELETE(Apis.DELETE_MEDICAL_RECORD_HOSPITALS)
  Future<void> deleteMedicalRecordHospital(
    @Path() String id,
  );

  //GET_MEDICAL_RECORD_INTERPRETERS

  @GET(Apis.GET_MEDICAL_RECORD_INTERPRETERS)
  Future<List<MedicalRecordInterpreter>> medicalRecordInterpreters(
    @Path() String medicalRecordId,
  );

  @POST(Apis.POST_MEDICAL_RECORD_INTERPRETERS)
  Future<MedicalRecordInterpreter> postMedicalRecordInterpreter(
    @Body() MedicalRecordInterpreter medicalRecordInterpreter,
  );

  @PUT(Apis.PUT_MEDICAL_RECORD_INTERPRETERS)
  Future<MedicalRecordInterpreter> putMedicalRecordInterpreter(
    @Body() MedicalRecordInterpreter medicalRecordInterpreter,
  );

  @DELETE(Apis.DELETE_MEDICAL_RECORD_INTERPRETERS)
  Future<void> deleteMedicalRecordInterpreter(
    @Path() String id,
  );

  //GET_MEDICAL_RECORDS_PROGRESS

  @GET(Apis.GET_MEDICAL_RECORDS_PROGRESS)
  Future<List<MedicalRecordProgress>> medicalRecordsProgress(
    @Path() String medicalRecordId,
  );

  @POST(Apis.POST_MEDICAL_RECORDS_PROGRESS)
  Future<MedicalRecordProgress> postMedicalRecordProgress(
    @Body() MedicalRecordProgress medicalRecordProgress,
  );

  @PUT(Apis.PUT_MEDICAL_RECORDS_PROGRESS)
  Future<MedicalRecordProgress> putMedicalRecordProgress(
    @Body() MedicalRecordProgress medicalRecordProgress,
  );

  @DELETE(Apis.DELETE_MEDICAL_RECORDS_PROGRESS)
  Future<void> deleteMedicalRecordProgress(
    @Path() String id,
  );

  //GET_MEDICAL_RECORDS_OVERSEAS

  @GET(Apis.GET_MEDICAL_RECORDS_OVERSEAS)
  Future<List<MedicalRecordOversea>> medicalRecordsOverseas(
    @Path() String medicalRecordId,
  );

  @POST(Apis.POST_MEDICAL_RECORDS_OVERSEAS)
  Future<MedicalRecordOversea> postMedicalRecordOversea(
    @Body() MedicalRecordOversea medicalRecordOversea,
  );

  @PUT(Apis.PUT_MEDICAL_RECORDS_OVERSEAS)
  Future<MedicalRecordOversea> putMedicalRecordOversea(
    @Body() MedicalRecordOversea medicalRecordOversea,
  );

  @DELETE(Apis.DELETE_MEDICAL_RECORDS_OVERSEAS)
  Future<void> deleteMedicalRecordOversea(
    @Path() String id,
  );

  //GET_MEDICAL_RECORDS_OVERSEAS_DATA

  @GET(Apis.GET_MEDICAL_RECORDS_OVERSEAS_DATA)
  Future<List<MedicalRecordOverseaData>> medicalRecordsOverseaData(
    @Path() String medicalRecordOverseaId,
  );

  @POST(Apis.POST_MEDICAL_RECORDS_OVERSEAS_DATA)
  Future<MedicalRecordOverseaData> postMedicalRecordOverseaData(
    @Body() MedicalRecordOverseaData medicalRecordOverseaData,
  );

  @PUT(Apis.PUT_MEDICAL_RECORDS_OVERSEAS_DATA)
  Future<MedicalRecordOverseaData> putMedicalRecordOverseaData(
    @Body() MedicalRecordOverseaData medicalRecordOverseaData,
  );

  @DELETE(Apis.DELETE_MEDICAL_RECORDS_OVERSEAS_DATA)
  Future<void> deleteMedicalRecordOverseaData(
    @Path() String id,
  );

//
}
