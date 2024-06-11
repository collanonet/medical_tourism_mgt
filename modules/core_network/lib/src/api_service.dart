import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../core_network.dart';
import 'endpoints.dart';
import 'entities/application_regenerative_medicine_response.dart';
import 'entities/medical_record_patient_response_treatment.dart';
import 'entities/medical_record_patient_response_treatment_request.dart';
import 'entities/medical_record_proposal.dart';
import 'entities/medical_record_proposal_request.dart';
import 'entities/medical_record_travel_group.dart';
import 'entities/medical_record_travel_group_request.dart';
import 'entities/request/application_regenerative_medicine_request.dart';

part 'api_service.g.dart';

@RestApi()
@singleton
abstract class ApiService {
  @factoryMethod
  factory ApiService(RestClient client) {
    return _ApiService(client.dio, baseUrl: client.baseUrl);
  }

  @POST(Endpoints.LOG_IN)
  Future<AuthData> login(
    @Field('email') String email,
    @Field('password') String password,
  );

  @POST(Endpoints.REFRESH_TOKEN)
  Future<AuthData> refreshToken(
    @Field('refresh-token') String refreshToken,
  );

  @POST(Endpoints.LOG_OUT)
  Future<AuthData> logOut();

  @POST('/files/upload-base64')
  Future<FileResponse> uploadFileBase64(
    @Field('file') String file,
    @Field('filename') String filename,
  );

  //GET_PRE_PATIENTS

  @GET(Endpoints.GET_PRE_PATIENTS)
  Future<Paginated<PrePatient>> prePatients({
    @Query('page') int? page,
    @Query('limit') int? limit,
    @Query('agents') String? agents,
    @Query('patient') String? patient,
  });

  @POST(Endpoints.POST_PRE_PATIENTS)
  Future<PrePatient> postPrePatient(
    @Body() PrePatientRequest prePatient,
  );

  @PUT('${Endpoints.PUT_PRE_PATIENTS}/{id}')
  Future<PrePatient> putPrePatient(
    @Path('id') String id,
    @Body() PrePatientRequest prePatient,
  );

  @DELETE('${Endpoints.DELETE_PRE_PATIENT}/{id}')
  Future<void> deletePrePatient(
    @Path('id') String id,
  );

  //GET_PATIENTS

  @GET(Endpoints.GET_PATIENTS)
  Future<Paginated<Patient>> patients({
    @Query('page') int? page,
    @Query('limit') int? limit,
    @Query('progress') String? progress,
    @Query('patientName') String? patientName,
    @Query('companyAGENTS') String? companyAgents,
    @Query('acceptingHospital') String? acceptingHospital,
    @Query('type') String? type,
    @Query('salesStaff') String? salesStaff,
    @Query('dateOfEntryfrom') String? dateOfEntryfrom,
    @Query('dateOfEntryto') String? dateOfEntryto,
    @Query('medicalDayfrom') String? medicalDayfrom,
    @Query('medicalDayto') String? medicalDayto,
    @Query('returnDatefrom') String? returnDatefrom,
    @Query('returnDateto') String? returnDateto,
  });

  @GET('${Endpoints.GET_PATIENT}/{id}')
  Future<Patient> patient(
    @Path('id') String id,
  );

  @POST(Endpoints.POST_PATIENTS)
  Future<Patient> postPatient(
    @Body() PatientRequest patient,
  );

  @PUT('${Endpoints.PUT_PATIENTS}/{id}')
  Future<Patient> putPatient(
    @Path('id') String id,
    @Body() PatientRequest patient,
  );

  @DELETE('${Endpoints.DELETE_PATIENT}/{id}')
  Future<void> deletePatient(
    @Path('id') String id,
  );

  //GET_PATIENT_NAMES

  @GET('${Endpoints.GET_PATIENT_NAMES}/{patientId}')
  Future<List<PatientName>> patientNames(
    @Path('patientId') String patientId,
  );

  @GET('${Endpoints.GET_PATIENT_NAMES_BY_PATIENT}/{patientId}')
  Future<List<PatientName>> patientNamesByPatient(
    @Path('patientId') String patientId,
  );

  @GET('${Endpoints.GET_PATIENT_USER}/{userId}')
  Future<User> patientUser(
    @Path('userId') String userId,
  );

  @POST(Endpoints.POST_PATIENT_NAMES)
  Future<PatientName> postPatientName(
    @Body() PatientNameRequest patientName,
  );

  @PUT('${Endpoints.PUT_PATIENT_NAMES}/{id}')
  Future<PatientName> putPatientName(
    @Path('id') String id,
    @Body() PatientNameRequest patientName,
  );

  @DELETE('${Endpoints.DELETE_PATIENT_NAMES}/{id}')
  Future<void> deletePatientName(
    @Path('id') String id,
  );

  //GET_PATIENT_NATIONALITIES

  @GET('${Endpoints.GET_PATIENT_NATIONALITIES}/{patientId}')
  Future<List<PatientNationality>> patientNationalities(
    @Path('patientId') String patientId,
  );

  @GET('${Endpoints.GET_PATIENT_NATIONALITIES_BY_PATIENT}/{patientId}')
  Future<List<PatientNationality>> patientNationalitiesByPatient(
    @Path('patientId') String patientId,
  );

  @POST(Endpoints.POST_PATIENT_NATIONALITIES)
  Future<PatientNationality> postPatientNationality(
    @Body() PatientNationalityRequest patientNationality,
  );

  @PUT('${Endpoints.PUT_PATIENT_NATIONALITIES}/{id}')
  Future<PatientNationality> putPatientNationality(
    @Path('id') String id,
    @Body() PatientNationalityRequest patientNationality,
  );

  @DELETE('${Endpoints.DELETE_PATIENT_NATIONALITIES}/{id}')
  Future<void> deletePatientNationality(
    @Path('id') String id,
  );

  //GET_PATIENT_PASSPORTS

  @GET('${Endpoints.GET_PATIENT_PASSPORTS}/{patientId}')
  Future<List<PatientPassport>> patientPassports(
    @Path('patientId') String patientId,
  );

  @GET('${Endpoints.GET_PATIENT_PASSPORTS_BY_PATIENT}/{patientId}')
  Future<List<PatientPassport>> patientPassportsByPatient(
    @Path('patientId') String patientId,
  );

  @POST(Endpoints.POST_PATIENT_PASSPORTS)
  Future<PatientPassport> postPatientPassport(
    @Body() PatientPassportRequest patientPassport,
  );

  @PUT('${Endpoints.PUT_PATIENT_PASSPORTS}/{id}')
  Future<PatientPassport> putPatientPassport(
    @Path('id') String id,
    @Body() PatientPassportRequest patientPassport,
  );

  @DELETE('${Endpoints.DELETE_PATIENT_PASSPORTS}/{id}')
  Future<void> deletePatientPassport(
    @Path('id') String id,
  );

  //GET_MEDICAL_RECORDS

  @GET(Endpoints.GET_MEDICAL_RECORDS)
  Future<List<MedicalRecord>> medicalRecords({
    @Query('page') int? page,
    @Query('limit') int? limit,
    @Query('patient') String? patient,
  });

  @GET('${Endpoints.GET_MEDICAL_RECORDS_BY_PATIENT}/{patientId}')
  Future<List<MedicalRecord>> medicalRecordsByPatient(
    @Path('patientId') String patientId,
  );

  @POST(Endpoints.POST_MEDICAL_RECORDS)
  Future<MedicalRecord> postMedicalRecord(
    @Body() MedicalRecordRequest medicalRecord,
  );

  @PUT('${Endpoints.PUT_MEDICAL_RECORDS}/{id}')
  Future<MedicalRecord> putMedicalRecord(
    @Path('id') String id,
    @Body() MedicalRecordRequest medicalRecord,
  );

  @DELETE('${Endpoints.DELETE_MEDICAL_RECORDS}/{id}')
  Future<void> deleteMedicalRecord(
    @Path('id') String id,
  );

  //GET_MEDICAL_RECORD_AGENTS

  @GET('${Endpoints.GET_MEDICAL_RECORD_AGENTS}/{medicalRecordId}')
  Future<List<MedicalRecordAgent>> medicalRecordAgents(
    @Path('medicalRecordId') String medicalRecordId,
  );

  @GET('${Endpoints.GET_MEDICAL_RECORD_AGENTS_BY_MEDICAL_RECORD}/{medicalRecordId}')
  Future<List<MedicalRecordAgent>> medicalRecordAgentsByMedicalRecord(
    @Path('medicalRecordId') String medicalRecordId,
  );

  @POST(Endpoints.POST_MEDICAL_RECORD_AGENTS)
  Future<MedicalRecordAgent> postMedicalRecordAgent(
    @Body() MedicalRecordAgentRequest medicalRecordAgent,
  );

  @PUT('${Endpoints.PUT_MEDICAL_RECORD_AGENTS}/{id}')
  Future<MedicalRecordAgent> putMedicalRecordAgent(
    @Path('id') String id,
    @Body() MedicalRecordAgentRequest medicalRecordAgent,
  );

  @DELETE('${Endpoints.DELETE_MEDICAL_RECORD_AGENTS}/{id}')
  Future<void> deleteMedicalRecordAgent(
    @Path('id') String id,
  );

  //GET_MEDICAL_RECORD_REFERRERS

  @GET('${Endpoints.GET_MEDICAL_RECORD_REFERRERS}/{medicalRecordId}')
  Future<List<MedicalRecordReferrer>> medicalRecordReferrers(
    @Path('medicalRecordId') String medicalRecordId,
  );

  @GET(
      '${Endpoints.GET_MEDICAL_RECORD_REFERRER_BY_MEDICAL_RECORD}/{medicalRecordId}')
  Future<List<MedicalRecordReferrer>> medicalRecordReferrersByMedicalRecord(
    @Path('medicalRecordId') String medicalRecordId,
  );

  @POST(Endpoints.POST_MEDICAL_RECORD_REFERRER)
  Future<MedicalRecordReferrer> postMedicalRecordReferrer(
    @Body() MedicalRecordReferrerRequest medicalRecordAgent,
  );

  @PUT('${Endpoints.PUT_MEDICAL_RECORD_REFERRER}/{id}')
  Future<MedicalRecordReferrer> putMedicalRecordReferrer(
    @Path('id') String id,
    @Body() MedicalRecordReferrerRequest medicalRecordAgent,
  );

  @DELETE('${Endpoints.DELETE_MEDICAL_RECORD_REFERRER}/{id}')
  Future<void> deleteMedicalRecordReferrer(
    @Path('id') String id,
  );

  // GET_MEDICAL_RECORD_BUDGETS

  @GET('${Endpoints.GET_MEDICAL_RECORD_BUDGETS}/{medicalRecordId}')
  Future<List<MedicalRecordBudget>> medicalRecordBudgets(
    @Path('medicalRecordId') String medicalRecordId,
  );

  @GET('${Endpoints.GET_MEDICAL_RECORD_BUDGETS_BY_MEDICAL_RECORD}/{medicalRecordId}')
  Future<List<MedicalRecordBudget>> medicalRecordBudgetsByMedicalRecord(
    @Path('medicalRecordId') String medicalRecordId,
  );

  @POST(Endpoints.POST_MEDICAL_RECORD_BUDGETS)
  Future<MedicalRecordBudget> postMedicalRecordBudget(
    @Body() MedicalRecordBudgetRequest medicalRecordBudget,
  );

  @PUT('${Endpoints.PUT_MEDICAL_RECORD_BUDGETS}/{id}')
  Future<MedicalRecordBudget> putMedicalRecordBudget(
    @Path('id') String id,
    @Body() MedicalRecordBudgetRequest medicalRecordBudget,
  );

  @DELETE('${Endpoints.DELETE_MEDICAL_RECORD_BUDGETS}/{id}')
  Future<void> deleteMedicalRecordBudget(
    @Path('id') String id,
  );

  //GET_MEDICAL_RECORD_COMPANIONS

  @GET('${Endpoints.GET_MEDICAL_RECORD_COMPANIONS}/{medicalRecordId}')
  Future<List<MedicalRecordCompanion>> medicalRecordCompanions(
    @Path('medicalRecordId') String medicalRecordId,
  );

  @GET(
      '${Endpoints.GET_MEDICAL_RECORD_COMPANIONS_BY_MEDICAL_RECORD}/{medicalRecordId}')
  Future<List<MedicalRecordCompanion>> medicalRecordCompanionsByMedicalRecord(
    @Path('medicalRecordId') String medicalRecordId,
  );

  @POST(Endpoints.POST_MEDICAL_RECORD_COMPANIONS)
  Future<MedicalRecordCompanion> postMedicalRecordCompanion(
    @Body() MedicalRecordCompanionRequest medicalRecordCompanion,
  );

  @PUT('${Endpoints.PUT_MEDICAL_RECORD_COMPANIONS}/{id}')
  Future<MedicalRecordCompanion> putMedicalRecordCompanion(
    @Path('id') String id,
    @Body() MedicalRecordCompanionRequest medicalRecordCompanion,
  );

  @DELETE('${Endpoints.DELETE_MEDICAL_RECORD_COMPANIONS}/{id}')
  Future<void> deleteMedicalRecordCompanion(
    @Path('id') String id,
  );

  //GET_MEDICAL_RECORD_HOSPITALS

  @GET('${Endpoints.GET_MEDICAL_RECORD_HOSPITALS}/{medicalRecordId}')
  Future<List<MedicalRecordHospital>> medicalRecordHospitals(
    @Path('medicalRecordId') String medicalRecordId,
  );

  @GET(
      '${Endpoints.GET_MEDICAL_RECORD_HOSPITALS_BY_MEDICAL_RECORD}/{medicalRecordId}')
  Future<List<MedicalRecordHospital>> medicalRecordHospitalsByMedicalRecord(
    @Path('medicalRecordId') String medicalRecordId,
  );

  @POST(Endpoints.POST_MEDICAL_RECORD_HOSPITALS)
  Future<MedicalRecordHospital> postMedicalRecordHospital(
    @Body() MedicalRecordHospitalRequest medicalRecordHospital,
  );

  @PUT('${Endpoints.PUT_MEDICAL_RECORD_HOSPITALS}/{id}')
  Future<MedicalRecordHospital> putMedicalRecordHospital(
    @Path('id') String id,
    @Body() MedicalRecordHospitalRequest medicalRecordHospital,
  );

  @DELETE('${Endpoints.DELETE_MEDICAL_RECORD_HOSPITALS}/{id}')
  Future<void> deleteMedicalRecordHospital(
    @Path('id') String id,
  );

  //GET_MEDICAL_RECORD_INTERPRETERS

  @GET('${Endpoints.GET_MEDICAL_RECORD_INTERPRETERS}/{medicalRecordId}')
  Future<List<MedicalRecordInterpreter>> medicalRecordInterpreters(
    @Path('medicalRecordId') String medicalRecordId,
  );

  @GET(
      '${Endpoints.GET_MEDICAL_RECORD_INTERPRETERS_BY_MEDICAL_RECORD}/{medicalRecordId}')
  Future<List<MedicalRecordInterpreter>>
      medicalRecordInterpretersByMedicalRecord(
    @Path('medicalRecordId') String medicalRecordId,
  );

  @POST(Endpoints.POST_MEDICAL_RECORD_INTERPRETERS)
  Future<MedicalRecordInterpreter> postMedicalRecordInterpreter(
    @Body() MedicalRecordInterpreterRequest medicalRecordInterpreter,
  );

  @PUT('${Endpoints.PUT_MEDICAL_RECORD_INTERPRETERS}/{id}')
  Future<MedicalRecordInterpreter> putMedicalRecordInterpreter(
    @Path('id') String id,
    @Body() MedicalRecordInterpreterRequest medicalRecordInterpreter,
  );

  @DELETE('${Endpoints.DELETE_MEDICAL_RECORD_INTERPRETERS}/{id}')
  Future<void> deleteMedicalRecordInterpreter(
    @Path('id') String id,
  );

  //GET_MEDICAL_RECORDS_PROGRESS

  @GET('${Endpoints.GET_MEDICAL_RECORDS_PROGRESS}/{medicalRecordId}')
  Future<List<MedicalRecordProgress>> medicalRecordsProgress(
    @Path('medicalRecordId') String medicalRecordId,
  );

  @GET(
      '${Endpoints.GET_MEDICAL_RECORDS_PROGRESS_BY_MEDICAL_RECORD}/{medicalRecordId}')
  Future<List<MedicalRecordProgress>> medicalRecordsProgressByMedicalRecord(
    @Path('medicalRecordId') String medicalRecordId,
  );

  @POST(Endpoints.POST_MEDICAL_RECORDS_PROGRESS)
  Future<MedicalRecordProgress> postMedicalRecordProgress(
    @Body() MedicalRecordProgressRequest medicalRecordProgress,
  );

  @PUT('${Endpoints.PUT_MEDICAL_RECORDS_PROGRESS}/{id}')
  Future<MedicalRecordProgress> putMedicalRecordProgress(
    @Path('id') String id,
    @Body() MedicalRecordProgressRequest medicalRecordProgress,
  );

  @DELETE('${Endpoints.DELETE_MEDICAL_RECORDS_PROGRESS}/{id}')
  Future<void> deleteMedicalRecordProgress(
    @Path('id') String id,
  );

  //GET_MEDICAL_RECORDS_OVERSEAS_DATA

  @GET('${Endpoints.MEDICAL_RECORDS_OVERSEAS_DATA_MEDICAL_RECORD}/{medicalRecordId}')
  Future<List<MedicalRecordOverseaData>>
      medicalRecordOverseaDataByMedicalRecord(
    @Path('medicalRecordId') String medicalRecordId,
  );

  @POST(Endpoints.MEDICAL_RECORDS_OVERSEAS_DATA)
  Future<MedicalRecordOverseaData> postMedicalRecordOverseaData(
    @Body() MedicalRecordOverseaDataRequest medicalRecordOverseaData,
  );

  @PUT('${Endpoints.MEDICAL_RECORDS_OVERSEAS_DATA}/{id}')
  Future<MedicalRecordOverseaData> putMedicalRecordOverseaData(
    @Path('id') String id,
    @Body() MedicalRecordOverseaDataRequest medicalRecordOverseaData,
  );

  @DELETE('${Endpoints.MEDICAL_RECORDS_OVERSEAS_DATA}/{id}')
  Future<void> deleteMedicalRecordOverseaData(
    @Path('id') String id,
  );

  //

  @GET('${Endpoints.GET_MEDICAL_RECORD_TRAVEL_GROUP}/{medicalRecord}')
  Future<MedicalRecordTravelGroup> medicalRecordsTravelGroup({
    @Path('medicalRecord') String? medicalRecord,
  });

  @POST(Endpoints.POST_MEDICAL_RECORD_TRAVEL_GROUP)
  Future<MedicalRecordTravelGroup> postMedicalRecordTravelGroup(
    @Body() MedicalRecordTravelGroupRequest medicalRecordTravelGroupRequest,
  );

  //GET_MEDICAL_RECORD_Proposal

  @GET(Endpoints.MEDICAL_RECORD_PROPOSAL)
  Future<List<MedicalRecordProposal>> getAllMedicalRecordProposals();

  @GET('${Endpoints.MEDICAL_RECORD_PROPOSAL_BY_MEDICAL_RECORD}/{medicalRecordId}')
  Future<List<MedicalRecordProposal>> getMedicalRecordProposalsByMedicalRecord(
    @Path('medicalRecordId') String medicalRecordId,
  );

  @GET('${Endpoints.MEDICAL_RECORD_PROPOSAL}/{id}')
  Future<List<MedicalRecordProposal>> getOneMedicalRecordProposal(
    @Path('id') String id,
  );

  @POST(Endpoints.MEDICAL_RECORD_PROPOSAL)
  Future<MedicalRecordProposal> postMedicalRecordProposal(
    @Body() MedicalRecordProposalRequest medicalRecordProposalRequest,
  );

  @PUT('${Endpoints.MEDICAL_RECORD_PROPOSAL}/{id}')
  Future<MedicalRecordProposal> putMedicalRecordProposal(
    @Path('id') String id,
    @Body() MedicalRecordProposalRequest medicalRecordProposalRequest,
  );

  @DELETE('${Endpoints.MEDICAL_RECORD_PROPOSAL}/{id}')
  Future<void> deleteMedicalRecordProposal(
    @Path('id') String id,
  );

  @GET('${Endpoints.MEDICAL_RECORD_PATIENT_RESPONSE_TREATMENT}/{medicalRecord}')
  Future<MedicalRecordPatientResponseTreatment>
      getMedicalRecordPatientResponseTreatment({
    @Path('medicalRecord') String? medicalRecord,
  });

  @POST(Endpoints.MEDICAL_RECORD_PATIENT_RESPONSE_TREATMENT)
  Future<MedicalRecordPatientResponseTreatment>
      postMedicalRecordPatientResponseTreatment(
    @Body()
    MedicalRecordPatientResponseTreatmentRequest
        medicalRecordPatientResponseTreatmentRequest,
  );

  @GET(
      '${Endpoints.MEDICAL_RECORD_PATIENT_RESPONSE_MEDICAL_CHECKUP}/{medicalRecord}')
  Future<MedicalRecordPatientResponseMedicalCheckup>
      getMedicalRecordPatientResponseMedicalCheckup({
    @Path('medicalRecord') String? medicalRecord,
  });

  @POST(Endpoints.MEDICAL_RECORD_PATIENT_RESPONSE_MEDICAL_CHECKUP)
  Future<MedicalRecordPatientResponseMedicalCheckup>
      postMedicalRecordPatientResponseMedicalCheckup(
    @Body()
    MedicalRecordPatientResponseMedicalCheckupRequest
        medicalRecordPatientResponseMedicalCheckupRequest,
  );

  @GET('${Endpoints.MEDICAL_RECORD_PATIENT_RESPONSE_OTHER}/{medicalRecord}')
  Future<MedicalRecordPatientResponseOther>
      getMedicalRecordPatientResponseOther({
    @Path('medicalRecord') String? medicalRecord,
  });

  @POST(Endpoints.MEDICAL_RECORD_PATIENT_RESPONSE_OTHER)
  Future<MedicalRecordPatientResponseOther>
      postMedicalRecordPatientResponseOther(
    @Body()
    MedicalRecordPatientResponseOtherRequest
        medicalRecordPatientResponseOtherRequest,
  );

  @GET('${Endpoints.MEDICAL_RECORD_SUMMARY}/{medicalRecord}')
  Future<MedicalRecordSummary> getMedicalRecordSummary({
    @Path('medicalRecord') String? medicalRecord,
  });

  @POST(Endpoints.MEDICAL_RECORD_SUMMARY)
  Future<MedicalRecordSummary> postMedicalRecordSummary(
    @Body() MedicalRecordSummaryRequest medicalRecordNormalSummaryRequest,
  );

  @GET(
      '${Endpoints.BOOKING_MEDICAL_RECORD}/WebBookingPatientPreferredDate/{patientId}')
  Future<WebBookingPatientPreferredDate> getWebBookingPatientPreferredDate(
    @Path('patientId') String patientId,
  );

  @GET('${Endpoints.BOOKING_MEDICAL_RECORD}/info/{patientId}')
  Future<MedicalExaminationResponse> getInfoMedicalExamination(
      @Path('patientId') String patientId);

  @GET('${Endpoints.BOOKING_MEDICAL_RECORD}/{medicalRecord}')
  Future<List<WebBookingMedicalRecordResponse>> getBookingMedicalRecord(
      @Path('medicalRecord') String medicalRecord);

  @POST(Endpoints.BOOKING_MEDICAL_RECORD)
  Future<WebBookingMedicalRecordResponse> postBookingMedicalRecord(
    @Body() WebBookingMedicalRecordRequest webBookingMedicalRecordRequest,
  );

  @GET(Endpoints.TYPE)
  Future<List<TypeResponse>> getTypes();

  @POST(Endpoints.TYPE)
  Future<TypeResponse> postType(
    @Body() TypeRequest typeRequest,
  );

  @PUT('${Endpoints.TYPE}/{id}')
  Future<TypeResponse> putType(
    @Path('id') String id,
    @Body() TypeRequest typeRequest,
  );

  @GET(Endpoints.WEB_BOOKING_ADMIN)
  Future<List<WebBookingMedicalRecord>> getWebBookingAdmin();

  @GET('${Endpoints.WEB_BOOKING_ADMIN}/{id}')
  Future<WebBookingMedicalRecord> getWebBookingAdminById(
    @Path('id') String id,
  );

  @PUT('${Endpoints.WEB_BOOKING_ADMIN}/{id}')
  Future<WebBookingMedicalRecord> putWebBookingAdmin(
    @Path('id') String id,
    @Body() WebBookingMedicalRecordRequest webBookingMedicalRecordRequest,
  );

  @GET(Endpoints.AGENTS)
  Future<List<AgentResponse>> getAgents();

  @GET('${Endpoints.AGENTS}/{id}')
  Future<AgentResponse> getAgent(
    @Path('id') String id,
  );

  @POST(Endpoints.AGENTS)
  Future<AgentResponse> postAgent(
    @Body() AgentRequest agentRequest,
  );

  @PUT('${Endpoints.AGENTS}/{id}')
  Future<AgentResponse> putAgent(
    @Path('id') String id,
    @Body() AgentRequest agentRequest,
  );

  @DELETE('${Endpoints.AGENTS}/{id}')
  Future<void> deleteAgent(
    @Path('id') String id,
  );

  @GET(Endpoints.AGENT_MANAGER)
  Future<List<AgentManagerResponse>> getAgentManagers({
    @Query('page') int? page,
    @Query('limit') int? limit,
    @Query('agentRecord') String? agentRecord,
  });

  @GET('${Endpoints.AGENT_MANAGER}/{id}')
  Future<AgentManagerResponse> getAgentManager(
    @Path('id') String id,
  );

  @POST(Endpoints.AGENT_MANAGER)
  Future<AgentManagerResponse> postAgentManager(
    @Body() AgentManagerRequest agentManagerRequest,
  );

  @PUT('${Endpoints.AGENT_MANAGER}/{id}')
  Future<AgentManagerResponse> putAgentManager(
    @Path('id') String id,
    @Body() AgentManagerRequest agentManagerRequest,
  );

  @DELETE('${Endpoints.AGENT_MANAGER}/{id}')
  Future<void> deleteAgentManager(
    @Path('id') String id,
  );

  @GET(
      '${Endpoints.MEDICAL_RECORD_PATIENT_RESPONSE_REGENERATIVE_MEDICAL}/{medicalRecord}')
  Future<ApplicationRegenerativeMedicalResponse>
      getApplicationRegenerattiveMedical(
    @Path('medicalRecord') String medicalRecord,
  );

  @POST(Endpoints.MEDICAL_RECORD_PATIENT_RESPONSE_REGENERATIVE_MEDICAL)
  Future<ApplicationRegenerativeMedicalResponse>
      postApplicationRegenerattiveMedical(
    @Body()
    ApplicationRegenerativeMedicalRequest applicationRegenerativeMedicalRequest,
  );

  @GET('${Endpoints.MEDICAL_RECORD_PATIENT_RESPONSE_BEAUTY}/{medicalRecord}')
  Future<ApplicationBeautyResponse> getApplicationBeauty(
    @Path('medicalRecord') String medicalRecord,
  );

  @POST(Endpoints.MEDICAL_RECORD_PATIENT_RESPONSE_BEAUTY)
  Future<ApplicationBeautyResponse> postApplicationBeauty(
    @Body() ApplicationBeautyRequest applicationBeautyRequest,
  );

  @GET(
      '${Endpoints.MEDICAL_RECORD_PATIENT_RESPONSE_BLOOD_PURIFICATION_THERAPY}/{medicalRecord}')
  Future<ApplicationBloodPurificationTherapyResponse>
      getApplicationBloodPurificationTherapy(
    @Path('medicalRecord') String medicalRecord,
  );

  @POST(Endpoints.MEDICAL_RECORD_PATIENT_RESPONSE_BLOOD_PURIFICATION_THERAPY)
  Future<ApplicationBloodPurificationTherapyResponse>
      postApplicationBloodPurificationTherapy(
    @Body()
    ApplicationBloodPurificationTherapyRequest
        applicationBloodPurificationTherapyRequest,
  );

  @GET('${Endpoints.MEDICAL_RECORD_PATIENT_RESPONSE_RISK_TEST}/{medicalRecord}')
  Future<ApplicationRiskTestResponse> getApplicationRiskTest(
    @Path('medicalRecord') String medicalRecord,
  );

  @POST(Endpoints.MEDICAL_RECORD_PATIENT_RESPONSE_RISK_TEST)
  Future<ApplicationRiskTestResponse> postApplicationRiskTest(
    @Body() ApplicationRiskTestRequest applicationRiskTestRequest,
  );
}

extension ApiServiceExts on ApiService {
  RestClient get client => GetIt.I<RestClient>();
}
