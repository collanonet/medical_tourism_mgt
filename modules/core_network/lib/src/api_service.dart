import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
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
    @Body() PrePatientRequest prePatient,
  );

  @PUT('${Apis.PUT_PRE_PATIENTS}/{id}')
  Future<PrePatient> putPrePatient(
    @Path('id') String id,
    @Body() PrePatientRequest prePatient,
  );

  @DELETE('${Apis.DELETE_PRE_PATIENT}/{id}')
  Future<void> deletePrePatient(
    @Path('id') String id,
  );

  //GET_PATIENTS

  @GET(Apis.GET_PATIENTS)
  Future<Paginated<Patient>> patients();

  @GET('${Apis.GET_PATIENT}/{id}')
  Future<Patient> patient(
    @Path('id') String id,
  );

  @POST(Apis.POST_PATIENTS)
  Future<Patient> postPatient(
    @Body() PatientRequest patient,
  );

  @PUT('${Apis.PUT_PATIENTS}/{id}')
  Future<Patient> putPatient(
    @Path('id') String id,
    @Body() PatientRequest patient,
  );

  @DELETE('${Apis.DELETE_PATIENT}/{id}')
  Future<void> deletePatient(
    @Path('id') String id,
  );

  //GET_PATIENT_NAMES

  @GET('${Apis.GET_PATIENT_NAMES}/{patientId}')
  Future<List<PatientName>> patientNames(
    @Path('patientId') String patientId,
  );

  @POST(Apis.POST_PATIENT_NAMES)
  Future<PatientName> postPatientName(
    @Body() PatientNameRequest patientName,
  );

  @PUT('${Apis.PUT_PATIENT_NAMES}/{id}')
  Future<PatientName> putPatientName(
    @Path('id') String id,
    @Body() PatientNameRequest patientName,
  );

  @DELETE('${Apis.DELETE_PATIENT_NAMES}/{id}')
  Future<void> deletePatientName(
    @Path('id') String id,
  );

  //GET_PATIENT_NATIONALITIES

  @GET('${Apis.GET_PATIENT_NATIONALITIES}/{patientId}')
  Future<List<PatientNationality>> patientNationalities(
    @Path('patientId') String patientId,
  );

  @POST(Apis.POST_PATIENT_NATIONALITIES)
  Future<PatientNationality> postPatientNationality(
    @Body() PatientNationalityRequest patientNationality,
  );

  @PUT('${Apis.PUT_PATIENT_NATIONALITIES}/{id}')
  Future<PatientNationality> putPatientNationality(
    @Path('id') String id,
    @Body() PatientNationalityRequest patientNationality,
  );

  @DELETE('${Apis.DELETE_PATIENT_NATIONALITIES}/{id}')
  Future<void> deletePatientNationality(
    @Path('id') String id,
  );

  //GET_PATIENT_PASSPORTS

  @GET('${Apis.GET_PATIENT_PASSPORTS}/{patientId}')
  Future<List<PatientPassport>> patientPassports(
    @Path('patientId') String patientId,
  );

  @POST(Apis.POST_PATIENT_PASSPORTS)
  Future<PatientPassport> postPatientPassport(
    @Body() PatientPassportRequest patientPassport,
  );

  @PUT('${Apis.PUT_PATIENT_PASSPORTS}/{id}')
  Future<PatientPassport> putPatientPassport(
    @Path('id') String id,
    @Body() PatientPassportRequest patientPassport,
  );

  @DELETE('${Apis.DELETE_PATIENT_PASSPORTS}/{id}')
  Future<void> deletePatientPassport(
    @Path('id') String id,
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
    @Body() MedicalRecordRequest medicalRecord,
  );

  @PUT('${Apis.PUT_MEDICAL_RECORDS}/{id}')
  Future<MedicalRecord> putMedicalRecord(
    @Path('id') String id,
    @Body() MedicalRecordRequest medicalRecord,
  );

  @DELETE('${Apis.DELETE_MEDICAL_RECORDS}/{id}')
  Future<void> deleteMedicalRecord(
    @Path('id') String id,
  );

  //GET_MEDICAL_RECORD_AGENTS

  @GET('${Apis.GET_MEDICAL_RECORD_AGENTS}/{medicalRecordId}')
  Future<List<MedicalRecordAgent>> medicalRecordAgents(
    @Path('medicalRecordId') String medicalRecordId,
  );

  @POST(Apis.POST_MEDICAL_RECORD_AGENTS)
  Future<MedicalRecordAgent> postMedicalRecordAgent(
    @Body() MedicalRecordAgentRequest medicalRecordAgent,
  );

  @PUT('${Apis.PUT_MEDICAL_RECORD_AGENTS}/{id}')
  Future<MedicalRecordAgent> putMedicalRecordAgent(
    @Path('id') String id,
    @Body() MedicalRecordAgentRequest medicalRecordAgent,
  );

  @DELETE('${Apis.DELETE_MEDICAL_RECORD_AGENTS}/{id}')
  Future<void> deleteMedicalRecordAgent(
    @Path('id') String id,
  );

  // GET_MEDICAL_RECORD_BUDGETS

  @GET('${Apis.GET_MEDICAL_RECORD_BUDGETS}/{medicalRecordId}')
  Future<List<MedicalRecordBudget>> medicalRecordBudgets(
    @Path('medicalRecordId') String medicalRecordId,
  );

  @POST(Apis.POST_MEDICAL_RECORD_BUDGETS)
  Future<MedicalRecordBudget> postMedicalRecordBudget(
    @Body() MedicalRecordBudgetRequest medicalRecordBudget,
  );

  @PUT('${Apis.PUT_MEDICAL_RECORD_BUDGETS}/{id}')
  Future<MedicalRecordBudget> putMedicalRecordBudget(
    @Path('id') String id,
    @Body() MedicalRecordBudgetRequest medicalRecordBudget,
  );

  @DELETE('${Apis.DELETE_MEDICAL_RECORD_BUDGETS}/{id}')
  Future<void> deleteMedicalRecordBudget(
    @Path('id') String id,
  );

  //GET_MEDICAL_RECORD_COMPANIONS

  @GET('${Apis.GET_MEDICAL_RECORD_COMPANIONS}/{medicalRecordId}')
  Future<List<MedicalRecordCompanion>> medicalRecordCompanions(
    @Path('medicalRecordId') String medicalRecordId,
  );

  @POST(Apis.POST_MEDICAL_RECORD_COMPANIONS)
  Future<MedicalRecordCompanion> postMedicalRecordCompanion(
    @Body() MedicalRecordCompanionRequest medicalRecordCompanion,
  );

  @PUT('${Apis.PUT_MEDICAL_RECORD_COMPANIONS}/{id}')
  Future<MedicalRecordCompanion> putMedicalRecordCompanion(
    @Path('id') String id,
    @Body() MedicalRecordCompanionRequest medicalRecordCompanion,
  );

  @DELETE('${Apis.DELETE_MEDICAL_RECORD_COMPANIONS}/{id}')
  Future<void> deleteMedicalRecordCompanion(
    @Path('id') String id,
  );

  //GET_MEDICAL_RECORD_HOSPITALS

  @GET('${Apis.GET_MEDICAL_RECORD_HOSPITALS}/{medicalRecordId}')
  Future<List<MedicalRecordHospital>> medicalRecordHospitals(
    @Path('medicalRecordId') String medicalRecordId,
  );

  @POST(Apis.POST_MEDICAL_RECORD_HOSPITALS)
  Future<MedicalRecordHospital> postMedicalRecordHospital(
    @Body() MedicalRecordHospitalRequest medicalRecordHospital,
  );

  @PUT('${Apis.PUT_MEDICAL_RECORD_HOSPITALS}/{id}')
  Future<MedicalRecordHospital> putMedicalRecordHospital(
    @Path('id') String id,
    @Body() MedicalRecordHospitalRequest medicalRecordHospital,
  );

  @DELETE('${Apis.DELETE_MEDICAL_RECORD_HOSPITALS}/{id}')
  Future<void> deleteMedicalRecordHospital(
    @Path('id') String id,
  );

  //GET_MEDICAL_RECORD_INTERPRETERS

  @GET('${Apis.GET_MEDICAL_RECORD_INTERPRETERS}/{medicalRecordId}')
  Future<List<MedicalRecordInterpreter>> medicalRecordInterpreters(
    @Path('medicalRecordId') String medicalRecordId,
  );

  @POST(Apis.POST_MEDICAL_RECORD_INTERPRETERS)
  Future<MedicalRecordInterpreter> postMedicalRecordInterpreter(
    @Body() MedicalRecordInterpreterRequest medicalRecordInterpreter,
  );

  @PUT('${Apis.PUT_MEDICAL_RECORD_INTERPRETERS}/{id}')
  Future<MedicalRecordInterpreter> putMedicalRecordInterpreter(
    @Path('id') String id,
    @Body() MedicalRecordInterpreterRequest medicalRecordInterpreter,
  );

  @DELETE('${Apis.DELETE_MEDICAL_RECORD_INTERPRETERS}/{id}')
  Future<void> deleteMedicalRecordInterpreter(
    @Path('id') String id,
  );

  //GET_MEDICAL_RECORDS_PROGRESS

  @GET('${Apis.GET_MEDICAL_RECORDS_PROGRESS}/{medicalRecordId}')
  Future<List<MedicalRecordProgress>> medicalRecordsProgress(
    @Path('medicalRecordId') String medicalRecordId,
  );

  @POST(Apis.POST_MEDICAL_RECORDS_PROGRESS)
  Future<MedicalRecordProgress> postMedicalRecordProgress(
    @Body() MedicalRecordProgressRequest medicalRecordProgress,
  );

  @PUT('${Apis.PUT_MEDICAL_RECORDS_PROGRESS}/{id}')
  Future<MedicalRecordProgress> putMedicalRecordProgress(
    @Path('id') String id,
    @Body() MedicalRecordProgressRequest medicalRecordProgress,
  );

  @DELETE('${Apis.DELETE_MEDICAL_RECORDS_PROGRESS}/{id}')
  Future<void> deleteMedicalRecordProgress(
    @Path('id') String id,
  );

  //GET_MEDICAL_RECORDS_OVERSEAS

  @GET('${Apis.GET_MEDICAL_RECORDS_OVERSEAS}/{medicalRecordId}')
  Future<List<MedicalRecordOversea>> medicalRecordsOverseas(
    @Path('medicalRecordId') String medicalRecordId,
  );

  @POST(Apis.POST_MEDICAL_RECORDS_OVERSEAS)
  Future<MedicalRecordOversea> postMedicalRecordOversea(
    @Body() MedicalRecordOverseaRequest medicalRecordOversea,
  );

  @PUT('${Apis.PUT_MEDICAL_RECORDS_OVERSEAS}/{id}')
  Future<MedicalRecordOversea> putMedicalRecordOversea(
    @Path('id') String id,
    @Body() MedicalRecordOverseaRequest medicalRecordOversea,
  );

  @DELETE('${Apis.DELETE_MEDICAL_RECORDS_OVERSEAS}/{id}')
  Future<void> deleteMedicalRecordOversea(
    @Path('id') String id,
  );

  //GET_MEDICAL_RECORDS_OVERSEAS_DATA

  @GET('${Apis.GET_MEDICAL_RECORDS_OVERSEAS_DATAS}/{medicalRecordOverseaId}')
  Future<List<MedicalRecordOverseaData>> medicalRecordsOverseaData(
    @Path('medicalRecordOverseaId') String medicalRecordOverseaId,
  );

  @POST(Apis.POST_MEDICAL_RECORDS_OVERSEAS_DATA)
  Future<MedicalRecordOverseaData> postMedicalRecordOverseaData(
    @Body() MedicalRecordOverseaDataRequest medicalRecordOverseaData,
  );

  @PUT('${Apis.PUT_MEDICAL_RECORDS_OVERSEAS_DATA}/{id}')
  Future<MedicalRecordOverseaData> putMedicalRecordOverseaData(
    @Path('id') String id,
    @Body() MedicalRecordOverseaDataRequest medicalRecordOverseaData,
  );

  @DELETE('${Apis.DELETE_MEDICAL_RECORDS_OVERSEAS_DATA}/{id}')
  Future<void> deleteMedicalRecordOverseaData(
    @Path('id') String id,
  );
}

extension ApiServiceExts on ApiService {
  RestClient get client => GetIt.I<RestClient>();
}
