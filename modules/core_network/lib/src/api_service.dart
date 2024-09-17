// Package imports:
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

// Project imports:
import '../core_network.dart';
import '../entities.dart';
import 'endpoints.dart';

part 'api_service.g.dart';

@RestApi()
@singleton
abstract class ApiService {
  @factoryMethod
  factory ApiService(RestClient client) {
    return _ApiService(client.dio, baseUrl: client.baseUrl);
  }

  @POST(EndPoints.LOG_IN)
  Future<AuthData> login(
    @Field('email') String email,
    @Field('password') String password,
  );

  @POST(EndPoints.REFRESH_TOKEN)
  Future<AuthData> refreshToken(
    @Field('refresh-token') String refreshToken,
  );

  @POST(EndPoints.LOG_OUT)
  Future<AuthData> logOut();

  @POST('/files/upload-base64')
  Future<FileResponse> uploadFileBase64(
    @Field('file') String file,
    @Field('filename') String filename,
  );

  //GET_PRE_PATIENTS

  @GET(EndPoints.GET_PRE_PATIENTS)
  Future<Paginated<PrePatient>> prePatients({
    @Query('page') int? page,
    @Query('limit') int? limit,
    @Query('agents') String? agents,
    @Query('patient') String? patient,
  });

  @POST(EndPoints.POST_PRE_PATIENTS)
  Future<PrePatient> postPrePatient(
    @Body() PrePatientRequest prePatient,
  );

  @PUT('${EndPoints.PUT_PRE_PATIENTS}/{id}')
  Future<PrePatient> putPrePatient(
    @Path('id') String id,
    @Body() PrePatientRequest prePatient,
  );

  @DELETE('${EndPoints.DELETE_PRE_PATIENT}/{id}')
  Future<void> deletePrePatient(
    @Path('id') String id,
  );

  //GET_PATIENTS

  @GET(EndPoints.GET_PATIENTS)
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

  @GET('${EndPoints.GET_PATIENT}/{id}')
  Future<Patient> patient(
    @Path('id') String id,
  );

  @POST(EndPoints.POST_PATIENTS)
  Future<Patient> postPatient(
    @Body() PatientRequest patient,
  );

  @PUT('${EndPoints.PUT_PATIENTS}/{id}')
  Future<Patient> putPatient(
    @Path('id') String id,
    @Body() PatientRequest patient,
  );

  @DELETE('${EndPoints.DELETE_PATIENT}/{id}')
  Future<void> deletePatient(
    @Path('id') String id,
  );

  //GET_PATIENT_NAMES

  @GET('${EndPoints.GET_PATIENT_NAMES}/{patientId}')
  Future<List<PatientName>> patientNames(
    @Path('patientId') String patientId,
  );

  @GET('${EndPoints.GET_PATIENT_NAMES_BY_PATIENT}/{patientId}')
  Future<List<PatientName>> patientNamesByPatient(
    @Path('patientId') String patientId,
  );

  @GET('${EndPoints.GET_PATIENT_USER}/{userId}')
  Future<User> patientUser(
    @Path('userId') String userId,
  );

  @POST(EndPoints.POST_PATIENT_NAMES)
  Future<PatientName> postPatientName(
    @Body() PatientNameRequest patientName,
  );

  @PUT('${EndPoints.PUT_PATIENT_NAMES}/{id}')
  Future<PatientName> putPatientName(
    @Path('id') String id,
    @Body() PatientNameRequest patientName,
  );

  @DELETE('${EndPoints.DELETE_PATIENT_NAMES}/{id}')
  Future<void> deletePatientName(
    @Path('id') String id,
  );

  //GET_PATIENT_NATIONALITIES

  @GET('${EndPoints.GET_PATIENT_NATIONALITIES}/{patientId}')
  Future<List<PatientNationality>> patientNationalities(
    @Path('patientId') String patientId,
  );

  @GET('${EndPoints.GET_PATIENT_NATIONALITIES_BY_PATIENT}/{patientId}')
  Future<List<PatientNationality>> patientNationalitiesByPatient(
    @Path('patientId') String patientId,
  );

  @POST(EndPoints.POST_PATIENT_NATIONALITIES)
  Future<PatientNationality> postPatientNationality(
    @Body() PatientNationalityRequest patientNationality,
  );

  @PUT('${EndPoints.PUT_PATIENT_NATIONALITIES}/{id}')
  Future<PatientNationality> putPatientNationality(
    @Path('id') String id,
    @Body() PatientNationalityRequest patientNationality,
  );

  @DELETE('${EndPoints.DELETE_PATIENT_NATIONALITIES}/{id}')
  Future<void> deletePatientNationality(
    @Path('id') String id,
  );

  //GET_PATIENT_PASSPORTS

  @GET('${EndPoints.GET_PATIENT_PASSPORTS}/{patientId}')
  Future<List<PatientPassport>> patientPassports(
    @Path('patientId') String patientId,
  );

  @GET('${EndPoints.GET_PATIENT_PASSPORTS_BY_PATIENT}/{patientId}')
  Future<List<PatientPassport>> patientPassportsByPatient(
    @Path('patientId') String patientId,
  );

  @POST(EndPoints.POST_PATIENT_PASSPORTS)
  Future<PatientPassport> postPatientPassport(
    @Body() PatientPassportRequest patientPassport,
  );

  @PUT('${EndPoints.PUT_PATIENT_PASSPORTS}/{id}')
  Future<PatientPassport> putPatientPassport(
    @Path('id') String id,
    @Body() PatientPassportRequest patientPassport,
  );

  @DELETE('${EndPoints.DELETE_PATIENT_PASSPORTS}/{id}')
  Future<void> deletePatientPassport(
    @Path('id') String id,
  );

  //GET_MEDICAL_RECORDS

  @GET(EndPoints.GET_MEDICAL_RECORDS)
  Future<List<MedicalRecord>> medicalRecords({
    @Query('page') int? page,
    @Query('limit') int? limit,
    @Query('patient') String? patient,
  });

  @GET('${EndPoints.GET_MEDICAL_RECORDS_BY_PATIENT}/{patientId}')
  Future<List<MedicalRecord>> medicalRecordsByPatient(
    @Path('patientId') String patientId,
  );

  @POST(EndPoints.POST_MEDICAL_RECORDS)
  Future<MedicalRecord> postMedicalRecord(
    @Body() MedicalRecordRequest medicalRecord,
  );

  @PUT('${EndPoints.PUT_MEDICAL_RECORDS}/{id}')
  Future<MedicalRecord> putMedicalRecord(
    @Path('id') String id,
    @Body() MedicalRecordRequest medicalRecord,
  );

  @DELETE('${EndPoints.DELETE_MEDICAL_RECORDS}/{id}')
  Future<void> deleteMedicalRecord(
    @Path('id') String id,
  );

  //GET_MEDICAL_RECORD_AGENTS

  @GET('${EndPoints.GET_MEDICAL_RECORD_AGENTS}/{medicalRecordId}')
  Future<List<MedicalRecordAgent>> medicalRecordAgents(
    @Path('medicalRecordId') String medicalRecordId,
  );

  @GET(
      '${EndPoints.GET_MEDICAL_RECORD_AGENTS_BY_MEDICAL_RECORD}/{medicalRecordId}')
  Future<List<MedicalRecordAgent>> medicalRecordAgentsByMedicalRecord(
    @Path('medicalRecordId') String medicalRecordId,
  );

  @POST(EndPoints.POST_MEDICAL_RECORD_AGENTS)
  Future<MedicalRecordAgent> postMedicalRecordAgent(
    @Body() MedicalRecordAgentRequest medicalRecordAgent,
  );

  @PUT('${EndPoints.PUT_MEDICAL_RECORD_AGENTS}/{id}')
  Future<MedicalRecordAgent> putMedicalRecordAgent(
    @Path('id') String id,
    @Body() MedicalRecordAgentRequest medicalRecordAgent,
  );

  @DELETE('${EndPoints.DELETE_MEDICAL_RECORD_AGENTS}/{id}')
  Future<void> deleteMedicalRecordAgent(
    @Path('id') String id,
  );

  //GET_MEDICAL_RECORD_REFERRERS

  @GET('${EndPoints.GET_MEDICAL_RECORD_REFERRERS}/{medicalRecordId}')
  Future<List<MedicalRecordReferrer>> medicalRecordReferrers(
    @Path('medicalRecordId') String medicalRecordId,
  );

  @GET(
      '${EndPoints.GET_MEDICAL_RECORD_REFERRER_BY_MEDICAL_RECORD}/{medicalRecordId}')
  Future<List<MedicalRecordReferrer>> medicalRecordReferrersByMedicalRecord(
    @Path('medicalRecordId') String medicalRecordId,
  );

  @POST(EndPoints.POST_MEDICAL_RECORD_REFERRER)
  Future<MedicalRecordReferrer> postMedicalRecordReferrer(
    @Body() MedicalRecordReferrerRequest medicalRecordAgent,
  );

  @PUT('${EndPoints.PUT_MEDICAL_RECORD_REFERRER}/{id}')
  Future<MedicalRecordReferrer> putMedicalRecordReferrer(
    @Path('id') String id,
    @Body() MedicalRecordReferrerRequest medicalRecordAgent,
  );

  @DELETE('${EndPoints.DELETE_MEDICAL_RECORD_REFERRER}/{id}')
  Future<void> deleteMedicalRecordReferrer(
    @Path('id') String id,
  );

  // GET_MEDICAL_RECORD_BUDGETS

  @GET('${EndPoints.GET_MEDICAL_RECORD_BUDGETS}/{medicalRecordId}')
  Future<List<MedicalRecordBudget>> medicalRecordBudgets(
    @Path('medicalRecordId') String medicalRecordId,
  );

  @GET(
      '${EndPoints.GET_MEDICAL_RECORD_BUDGETS_BY_MEDICAL_RECORD}/{medicalRecordId}')
  Future<List<MedicalRecordBudget>> medicalRecordBudgetsByMedicalRecord(
    @Path('medicalRecordId') String medicalRecordId,
  );

  @POST(EndPoints.POST_MEDICAL_RECORD_BUDGETS)
  Future<MedicalRecordBudget> postMedicalRecordBudget(
    @Body() MedicalRecordBudgetRequest medicalRecordBudget,
  );

  @PUT('${EndPoints.PUT_MEDICAL_RECORD_BUDGETS}/{id}')
  Future<MedicalRecordBudget> putMedicalRecordBudget(
    @Path('id') String id,
    @Body() MedicalRecordBudgetRequest medicalRecordBudget,
  );

  @DELETE('${EndPoints.DELETE_MEDICAL_RECORD_BUDGETS}/{id}')
  Future<void> deleteMedicalRecordBudget(
    @Path('id') String id,
  );

  //GET_MEDICAL_RECORD_COMPANIONS

  @GET('${EndPoints.GET_MEDICAL_RECORD_COMPANIONS}/{medicalRecordId}')
  Future<List<MedicalRecordCompanion>> medicalRecordCompanions(
    @Path('medicalRecordId') String medicalRecordId,
  );

  @GET(
      '${EndPoints.GET_MEDICAL_RECORD_COMPANIONS_BY_MEDICAL_RECORD}/{medicalRecordId}')
  Future<List<MedicalRecordCompanion>> medicalRecordCompanionsByMedicalRecord(
    @Path('medicalRecordId') String medicalRecordId,
  );

  @POST(EndPoints.POST_MEDICAL_RECORD_COMPANIONS)
  Future<MedicalRecordCompanion> postMedicalRecordCompanion(
    @Body() MedicalRecordCompanionRequest medicalRecordCompanion,
  );

  @PUT('${EndPoints.PUT_MEDICAL_RECORD_COMPANIONS}/{id}')
  Future<MedicalRecordCompanion> putMedicalRecordCompanion(
    @Path('id') String id,
    @Body() MedicalRecordCompanionRequest medicalRecordCompanion,
  );

  @DELETE('${EndPoints.DELETE_MEDICAL_RECORD_COMPANIONS}/{id}')
  Future<void> deleteMedicalRecordCompanion(
    @Path('id') String id,
  );

  //GET_MEDICAL_RECORD_HOSPITALS

  @GET('${EndPoints.GET_MEDICAL_RECORD_HOSPITALS}/{medicalRecordId}')
  Future<List<MedicalRecordHospital>> medicalRecordHospitals(
    @Path('medicalRecordId') String medicalRecordId,
  );

  @GET(
      '${EndPoints.GET_MEDICAL_RECORD_HOSPITALS_BY_MEDICAL_RECORD}/{medicalRecordId}')
  Future<List<MedicalRecordHospital>> medicalRecordHospitalsByMedicalRecord(
    @Path('medicalRecordId') String medicalRecordId,
  );

  @POST(EndPoints.POST_MEDICAL_RECORD_HOSPITALS)
  Future<MedicalRecordHospital> postMedicalRecordHospital(
    @Body() MedicalRecordHospitalRequest medicalRecordHospital,
  );

  @PUT('${EndPoints.PUT_MEDICAL_RECORD_HOSPITALS}/{id}')
  Future<MedicalRecordHospital> putMedicalRecordHospital(
    @Path('id') String id,
    @Body() MedicalRecordHospitalRequest medicalRecordHospital,
  );

  @DELETE('${EndPoints.DELETE_MEDICAL_RECORD_HOSPITALS}/{id}')
  Future<void> deleteMedicalRecordHospital(
    @Path('id') String id,
  );

  //GET_MEDICAL_RECORD_INTERPRETERS

  @GET('${EndPoints.GET_MEDICAL_RECORD_INTERPRETERS}/{medicalRecordId}')
  Future<List<MedicalRecordInterpreter>> medicalRecordInterpreters(
    @Path('medicalRecordId') String medicalRecordId,
  );

  @GET(
      '${EndPoints.GET_MEDICAL_RECORD_INTERPRETERS_BY_MEDICAL_RECORD}/{medicalRecordId}')
  Future<List<MedicalRecordInterpreter>>
      medicalRecordInterpretersByMedicalRecord(
    @Path('medicalRecordId') String medicalRecordId,
  );

  @POST(EndPoints.POST_MEDICAL_RECORD_INTERPRETERS)
  Future<MedicalRecordInterpreter> postMedicalRecordInterpreter(
    @Body() MedicalRecordInterpreterRequest medicalRecordInterpreter,
  );

  @PUT('${EndPoints.PUT_MEDICAL_RECORD_INTERPRETERS}/{id}')
  Future<MedicalRecordInterpreter> putMedicalRecordInterpreter(
    @Path('id') String id,
    @Body() MedicalRecordInterpreterRequest medicalRecordInterpreter,
  );

  @DELETE('${EndPoints.DELETE_MEDICAL_RECORD_INTERPRETERS}/{id}')
  Future<void> deleteMedicalRecordInterpreter(
    @Path('id') String id,
  );

  //GET_MEDICAL_RECORDS_PROGRESS

  @GET('${EndPoints.GET_MEDICAL_RECORDS_PROGRESS}/{medicalRecordId}')
  Future<List<MedicalRecordProgress>> medicalRecordsProgress(
    @Path('medicalRecordId') String medicalRecordId,
  );

  @GET(
      '${EndPoints.GET_MEDICAL_RECORDS_PROGRESS_BY_MEDICAL_RECORD}/{medicalRecordId}')
  Future<List<MedicalRecordProgress>> medicalRecordsProgressByMedicalRecord(
    @Path('medicalRecordId') String medicalRecordId,
  );

  @POST(EndPoints.POST_MEDICAL_RECORDS_PROGRESS)
  Future<MedicalRecordProgress> postMedicalRecordProgress(
    @Body() MedicalRecordProgressRequest medicalRecordProgress,
  );

  @PUT('${EndPoints.PUT_MEDICAL_RECORDS_PROGRESS}/{id}')
  Future<MedicalRecordProgress> putMedicalRecordProgress(
    @Path('id') String id,
    @Body() MedicalRecordProgressRequest medicalRecordProgress,
  );

  @DELETE('${EndPoints.DELETE_MEDICAL_RECORDS_PROGRESS}/{id}')
  Future<void> deleteMedicalRecordProgress(
    @Path('id') String id,
  );

  //GET_MEDICAL_RECORDS_OVERSEAS_DATA

  @GET(
      '${EndPoints.MEDICAL_RECORDS_OVERSEAS_DATA_MEDICAL_RECORD}/{medicalRecordId}')
  Future<List<MedicalRecordOverseaData>>
      medicalRecordOverseaDataByMedicalRecord(
    @Path('medicalRecordId') String medicalRecordId,
  );

  @POST(EndPoints.MEDICAL_RECORDS_OVERSEAS_DATA)
  Future<MedicalRecordOverseaData> postMedicalRecordOverseaData(
    @Body() MedicalRecordOverseaDataRequest medicalRecordOverseaData,
  );

  @PUT('${EndPoints.MEDICAL_RECORDS_OVERSEAS_DATA}/{id}')
  Future<MedicalRecordOverseaData> putMedicalRecordOverseaData(
    @Path('id') String id,
    @Body() MedicalRecordOverseaDataRequest medicalRecordOverseaData,
  );

  @DELETE('${EndPoints.MEDICAL_RECORDS_OVERSEAS_DATA}/{id}')
  Future<void> deleteMedicalRecordOverseaData(
    @Path('id') String id,
  );

  //

  @GET('${EndPoints.GET_MEDICAL_RECORD_TRAVEL_GROUP}/{medicalRecord}')
  Future<MedicalRecordTravelGroup> medicalRecordsTravelGroup({
    @Path('medicalRecord') String? medicalRecord,
  });

  @POST(EndPoints.POST_MEDICAL_RECORD_TRAVEL_GROUP)
  Future<MedicalRecordTravelGroup> postMedicalRecordTravelGroup(
    @Body() MedicalRecordTravelGroupRequest medicalRecordTravelGroupRequest,
  );

  //GET_MEDICAL_RECORD_Proposal

  @GET(EndPoints.MEDICAL_RECORD_PROPOSAL)
  Future<List<MedicalRecordProposal>> getAllMedicalRecordProposals();

  @GET(
      '${EndPoints.MEDICAL_RECORD_PROPOSAL_BY_MEDICAL_RECORD}/{medicalRecordId}')
  Future<List<MedicalRecordProposal>> getMedicalRecordProposalsByMedicalRecord(
    @Path('medicalRecordId') String medicalRecordId,
  );

  @GET('${EndPoints.MEDICAL_RECORD_PROPOSAL}/{id}')
  Future<List<MedicalRecordProposal>> getOneMedicalRecordProposal(
    @Path('id') String id,
  );

  @POST(EndPoints.MEDICAL_RECORD_PROPOSAL)
  Future<MedicalRecordProposal> postMedicalRecordProposal(
    @Body() MedicalRecordProposalRequest medicalRecordProposalRequest,
  );

  @PUT('${EndPoints.MEDICAL_RECORD_PROPOSAL}/{id}')
  Future<MedicalRecordProposal> putMedicalRecordProposal(
    @Path('id') String id,
    @Body() MedicalRecordProposalRequest medicalRecordProposalRequest,
  );

  @DELETE('${EndPoints.MEDICAL_RECORD_PROPOSAL}/{id}')
  Future<void> deleteMedicalRecordProposal(
    @Path('id') String id,
  );

  @GET('${EndPoints.MEDICAL_RECORD_PATIENT_RESPONSE_TREATMENT}/{medicalRecord}')
  Future<MedicalRecordPatientResponseTreatment>
      getMedicalRecordPatientResponseTreatment({
    @Path('medicalRecord') String? medicalRecord,
  });

  @POST(EndPoints.MEDICAL_RECORD_PATIENT_RESPONSE_TREATMENT)
  Future<MedicalRecordPatientResponseTreatment>
      postMedicalRecordPatientResponseTreatment(
    @Body()
    MedicalRecordPatientResponseTreatmentRequest
        medicalRecordPatientResponseTreatmentRequest,
  );

  @GET(
      '${EndPoints.MEDICAL_RECORD_PATIENT_RESPONSE_MEDICAL_CHECKUP}/{medicalRecord}')
  Future<MedicalRecordPatientResponseMedicalCheckup>
      getMedicalRecordPatientResponseMedicalCheckup({
    @Path('medicalRecord') String? medicalRecord,
  });

  @POST(EndPoints.MEDICAL_RECORD_PATIENT_RESPONSE_MEDICAL_CHECKUP)
  Future<MedicalRecordPatientResponseMedicalCheckup>
      postMedicalRecordPatientResponseMedicalCheckup(
    @Body()
    MedicalRecordPatientResponseMedicalCheckupRequest
        medicalRecordPatientResponseMedicalCheckupRequest,
  );

  @GET('${EndPoints.MEDICAL_RECORD_PATIENT_RESPONSE_OTHER}/{medicalRecord}')
  Future<MedicalRecordPatientResponseOther>
      getMedicalRecordPatientResponseOther({
    @Path('medicalRecord') String? medicalRecord,
  });

  @POST(EndPoints.MEDICAL_RECORD_PATIENT_RESPONSE_OTHER)
  Future<MedicalRecordPatientResponseOther>
      postMedicalRecordPatientResponseOther(
    @Body()
    MedicalRecordPatientResponseOtherRequest
        medicalRecordPatientResponseOtherRequest,
  );

  @GET('${EndPoints.MEDICAL_RECORD_SUMMARY}/{medicalRecord}')
  Future<MedicalRecordSummary> getMedicalRecordSummary({
    @Path('medicalRecord') String? medicalRecord,
  });

  @POST(EndPoints.MEDICAL_RECORD_SUMMARY)
  Future<MedicalRecordSummary> postMedicalRecordSummary(
    @Body() MedicalRecordSummaryRequest medicalRecordNormalSummaryRequest,
  );

  @GET(
      '${EndPoints.BOOKING_MEDICAL_RECORD}/WebBookingPatientPreferredDate/{patientId}')
  Future<WebBookingPatientPreferredDate> getWebBookingPatientPreferredDate(
    @Path('patientId') String patientId,
  );

  @GET('${EndPoints.BOOKING_MEDICAL_RECORD}/info/{patientId}')
  Future<TreamentResponce> getInfoMedicalExamination(
      @Path('patientId') String patientId);

  @GET('${EndPoints.BOOKING_MEDICAL_RECORD}/{medicalRecord}')
  Future<List<WebBookingMedicalRecordResponse>> getBookingMedicalRecord(
      @Path('medicalRecord') String medicalRecord);

  @POST(EndPoints.BOOKING_MEDICAL_RECORD)
  Future<WebBookingMedicalRecordResponse> postBookingMedicalRecord(
    @Body() WebBookingMedicalRecordRequest webBookingMedicalRecordRequest,
  );

  @GET(EndPoints.TYPE)
  Future<List<TypeResponse>> getTypes();

  @POST(EndPoints.TYPE)
  Future<TypeResponse> postType(
    @Body() TypeRequest typeRequest,
  );

  @PUT('${EndPoints.TYPE}/{id}')
  Future<TypeResponse> putType(
    @Path('id') String id,
    @Body() TypeRequest typeRequest,
  );

  @GET(EndPoints.WEB_BOOKING_ADMIN)
  Future<List<WebBookingMedicalRecord>> getWebBookingAdmin();

  @GET('${EndPoints.WEB_BOOKING_ADMIN}/{id}')
  Future<WebBookingMedicalRecord> getWebBookingAdminById(
    @Path('id') String id,
  );

  @PUT('${EndPoints.WEB_BOOKING_ADMIN}/{id}')
  Future<WebBookingMedicalRecord> putWebBookingAdmin(
    @Path('id') String id,
    @Body() WebBookingMedicalRecordRequest webBookingMedicalRecordRequest,
  );

  @GET(EndPoints.AGENTS)
  Future<List<AgentResponse>> getAgents({
    @Query('companyName') String? companyName,
    @Query('nameKana') String? nameKana,
    @Query('country') String? country,
    @Query('area') String? area,
    @Query('fullNameJapaneseKanjiChineseOnly')
    String? fullNameJapaneseKanjiChineseOnly,
    @Query('pastCasesNumber') int? pastCasesNumber,
  });

  @GET('${EndPoints.AGENTS}/{id}')
  Future<AgentResponse> getAgent(
    @Path('id') String id,
  );

  @POST(EndPoints.AGENTS)
  Future<AgentResponse> postAgent(
    @Body() AgentRequest agentRequest,
  );

  @PUT('${EndPoints.AGENTS}/{id}')
  Future<AgentResponse> putAgent(
    @Path('id') String id,
    @Body() AgentRequest agentRequest,
  );

  @DELETE('${EndPoints.AGENTS}/{id}')
  Future<void> deleteAgent(
    @Path('id') String id,
  );

  @GET(EndPoints.AGENT_MANAGER)
  Future<List<AgentManagerResponse>> getAgentManagers({
    @Query('page') int? page,
    @Query('limit') int? limit,
    @Query('agentRecord') String? agentRecord,
  });

  @GET('${EndPoints.AGENT_MANAGER}/{id}')
  Future<AgentManagerResponse> getAgentManager(
    @Path('id') String id,
  );

  @POST(EndPoints.AGENT_MANAGER)
  Future<AgentManagerResponse> postAgentManager(
    @Body() AgentManagerRequest agentManagerRequest,
  );

  @PUT('${EndPoints.AGENT_MANAGER}/{id}')
  Future<AgentManagerResponse> putAgentManager(
    @Path('id') String id,
    @Body() AgentManagerRequest agentManagerRequest,
  );

  @DELETE('${EndPoints.AGENT_MANAGER}/{id}')
  Future<void> deleteAgentManager(
    @Path('id') String id,
  );

  @GET(
      '${EndPoints.MEDICAL_RECORD_PATIENT_RESPONSE_REGENERATIVE_MEDICAL}/{medicalRecord}')
  Future<ApplicationRegenerativeMedicalResponse>
      getApplicationRegenerattiveMedical(
    @Path('medicalRecord') String medicalRecord,
  );

  @POST(EndPoints.MEDICAL_RECORD_PATIENT_RESPONSE_REGENERATIVE_MEDICAL)
  Future<ApplicationRegenerativeMedicalResponse>
      postApplicationRegenerattiveMedical(
    @Body()
    ApplicationRegenerativeMedicalRequest applicationRegenerativeMedicalRequest,
  );

  @GET('${EndPoints.MEDICAL_RECORD_PATIENT_RESPONSE_BEAUTY}/{medicalRecord}')
  Future<ApplicationBeautyResponse> getApplicationBeauty(
    @Path('medicalRecord') String medicalRecord,
  );

  @POST(EndPoints.MEDICAL_RECORD_PATIENT_RESPONSE_BEAUTY)
  Future<ApplicationBeautyResponse> postApplicationBeauty(
    @Body() ApplicationBeautyRequest applicationBeautyRequest,
  );

  @GET(
      '${EndPoints.MEDICAL_RECORD_PATIENT_RESPONSE_BLOOD_PURIFICATION_THERAPY}/{medicalRecord}')
  Future<ApplicationBloodPurificationTherapyResponse>
      getApplicationBloodPurificationTherapy(
    @Path('medicalRecord') String medicalRecord,
  );

  @POST(EndPoints.MEDICAL_RECORD_PATIENT_RESPONSE_BLOOD_PURIFICATION_THERAPY)
  Future<ApplicationBloodPurificationTherapyResponse>
      postApplicationBloodPurificationTherapy(
    @Body()
    ApplicationBloodPurificationTherapyRequest
        applicationBloodPurificationTherapyRequest,
  );

  @GET('${EndPoints.MEDICAL_RECORD_PATIENT_RESPONSE_RISK_TEST}/{medicalRecord}')
  Future<ApplicationRiskTestResponse> getApplicationRiskTest(
    @Path('medicalRecord') String medicalRecord,
  );

  @POST(EndPoints.MEDICAL_RECORD_PATIENT_RESPONSE_RISK_TEST)
  Future<ApplicationRiskTestResponse> postApplicationRiskTest(
    @Body() ApplicationRiskTestRequest applicationRiskTestRequest,
  );

  //E1

  @POST(EndPoints.FILTER_PROCESS_CHART_PATIENT)
  Future<PatientFilterResponse> postFilterpatientChart(
    @Body() PatientFilterRequst patientFilterRequst,
  );

  @GET(EndPoints.ITINERARY_SIMPLE_TITLE)
  Future<ItineraryTitleResponse> getItineraryTitle();

  @POST(EndPoints.ITINERARY_SIMPLE_TITLE)
  Future<ItineraryTitleResponse> postItineraryTitle(
    @Body() ItineraryTitleRequest itineraryTitleRequest,
  );

  @GET(EndPoints.ITINERARY_SIMPLE_EXPLANATION)
  Future<ItineraryExplanationResponse> getItineraryExplanation();

  @POST(EndPoints.ITINERARY_SIMPLE_EXPLANATION)
  Future<ItineraryExplanationResponse> postItineraryExplanation(
    @Body() ItineraryExplanationRequest itineraryExplanationRequest,
  );

  @GET(EndPoints.ITINERARY_SIMPLE_INTERPRETOR_OR_GUIDE)
  Future<ItineraryInterpreterOrGuideInputResponse>
      getItineraryInterpretorOrGuideInput();

  @POST(EndPoints.ITINERARY_SIMPLE_INTERPRETOR_OR_GUIDE)
  Future<ItineraryInterpreterOrGuideInputResponse>
      postItineraryInterpretorOrGuideInput(
    @Body()
    ItineraryInterpreterOrGuideInputRequest
        itineraryInterpreterOrGuideInputRequest,
  );

  @GET(EndPoints.ITINERARY_SIMPLE_TRANSFER_INPUT)
  Future<ItineraryTransferInputResponse> getItineraryTransferInput();

  @POST(EndPoints.ITINERARY_SIMPLE_TRANSFER_INPUT)
  Future<ItineraryTransferInputResponse> postItineraryTransferInput(
    @Body() ItineraryTransferInputRequest itineraryTransferInputRequest,
  );

  @GET(EndPoints.DETAIL_FACILITY_HOSPITAL)
  Future<List<DetailFacilityHotelResponse>> getDetialFacilityHospital(
    @Query('tour') String id,
  );

  @POST(EndPoints.DETAIL_FACILITY_HOSPITAL)
  Future<DetailFacilityHotelResponse> postDetailFacilityHospital(
    @Body() DetailFacilityHotelRequest detailFacilityHotelRequest,
  );

  @PUT('${EndPoints.DETAIL_FACILITY_HOSPITAL}/{id}')
  Future<DetailFacilityHotelResponse> putDetailFacilityHospital(
    @Path('id') String id,
    @Body() DetailFacilityHotelRequest detailFacilityHotelRequest,
  );

  @GET(EndPoints.DETAIL_FACILITY_DROP_IN_FACILITY)
  Future<DetailDropInFacilityResponse> getDetailFacilityDropIn(
    @Query('tour') String tourId,
  );

  @POST(EndPoints.DETAIL_FACILITY_DROP_IN_FACILITY)
  Future<DetailDropInFacilityResponse> postDetailFacilityDropIn(
    @Body() DetailDropInFacilityRequest detailDropInFacilityRequest,
  );

  @PUT('${EndPoints.DETAIL_FACILITY_DROP_IN_FACILITY}/{id}')
  Future<DetailDropInFacilityResponse> putDetailFacilityDropIn(
    @Path('id') String id,
    @Body() DetailDropInFacilityRequest detailDropInFacilityRequest,
  );

  @GET(EndPoints.DETAIL_HOTEL_REGISTATION)
  Future<List<DetainHotelRegistationResponse>> getDetainlHotelRegistation({
    @Query('accommodationName') String? accommodationName,
    //  @Query('accommodationType') List<String>? accommodationType,
    @Query('usageRecord') bool? usageRecord,
    @Query('area') String? area,
    @Query('isJapanese') bool? isJapanese,
    @Query('isChinese') bool? isChinese,
    @Query('isVietnamese') bool? isVietnamese,
    @Query('isEnglish') bool? isEnglish,
    @Query('isKorean') bool? isKorean,
    @Query('isThai') bool? isThai,
  });

  @POST(EndPoints.DETAIL_HOTEL_REGISTATION)
  Future<DetainHotelRegistationResponse> postDetailHotelRegistation(
    @Body() DetainHotelRegistationRequest detainHotelRegistationRequest,
  );

  @POST(EndPoints.DETAIL_HOTEL_SEARCH)
  Future<DetailHotelSearchResponse> postDetialHotelSearch(
    @Body() DetailHotelSearchRequest detailHotelSearchRequest,
  );

  @GET(EndPoints.DETAIL_RELATED_PARTIES_GUIDE_OR_INERPRETER)
  Future<List<DetailRelatedPartiesResponse>>
      getRelatedPartiesGuideOrInterpreter(
    @Query('tour') String id,
  );

  @POST(EndPoints.DETAIL_RELATED_PARTIES_GUIDE_OR_INERPRETER)
  Future<DetailRelatedPartiesResponse> postRelatedPartiesGuideOrInterpreter(
    @Body() DetailRelatedPartiesRequest detailRelatedPartiesRequest,
  );

  @PUT('${EndPoints.DETAIL_RELATED_PARTIES_GUIDE_OR_INERPRETER}/{id}')
  Future<DetailRelatedPartiesResponse> putRelatedPartiesGuideOrInterpreter(
    @Path('id') String id,
    @Body() DetailRelatedPartiesRequest detailRelatedPartiesRequest,
  );

  @GET(EndPoints.DETAIL_RELATED_PARTIES_BUS_COMPANY)
  Future<List<DetailRelatedPartiesBusCompanyResponse>>
      getRelatedPartiesBusCompany(
    @Query('tour') String id,
  );

  @POST(EndPoints.DETAIL_RELATED_PARTIES_BUS_COMPANY)
  Future<DetailRelatedPartiesBusCompanyResponse> postRelatedPartiesBusCompany(
    @Body()
    DetailRelatedPartiesBusCompanyRequest detailRelatedPartiesBusCompanyRequest,
  );

  @GET(EndPoints.DETAIL_RELATED_PARTIES_DRIVER)
  Future<List<DetailRelatedPartiesDriverResponse>> getRelatedPartiesDriver(
    @Query('tour') String id,
  );

  @POST(EndPoints.DETAIL_RELATED_PARTIES_DRIVER)
  Future<DetailRelatedPartiesDriverResponse> postRelatedPartiesDriver(
    @Body() DetailRelatedPartiesDriverRequest detailRelatedPartiesDriverRequest,
  );

  @PUT('${EndPoints.DETAIL_RELATED_PARTIES_DRIVER}/{id}')
  Future<DetailRelatedPartiesDriverResponse> putRelatedPartiesDriver(
    @Path('id') String id,
    @Body() DetailRelatedPartiesDriverRequest detailRelatedPartiesDriverRequest,
  );

  @GET(EndPoints.DETAIL_RELATED_EMERGENCY_CONTACT)
  Future<List<DetailRelatedPartiesEmergencyContactResponse>>
      getRelatedPartiesEmergencyContact(
    @Query('tour') String id,
  );

  @POST(EndPoints.DETAIL_RELATED_EMERGENCY_CONTACT)
  Future<DetailRelatedPartiesEmergencyContactResponse>
      postRelatedPartiesEmergencyContact(
    @Body()
    DetailRelatedPartiesEmergencyContactRequest
        detailRelatedPartiesEmergencyContactRequest,
  );

  @PUT('${EndPoints.DETAIL_RELATED_EMERGENCY_CONTACT}/{id}')
  Future<DetailRelatedPartiesEmergencyContactResponse> putRelatedPartiesEmergency(
    @Path('id') String id,
    @Body() DetailRelatedPartiesEmergencyContactRequest detailRelatedPartiesEmergencyContactRequest,
  );

  @GET(EndPoints.DETAIL_ITINERARY_SIMPLE_VERSION_TITLE)
  Future<DetailItinerarySimpleTitle> getDetailItinerarySimpleTitle();

  @POST(EndPoints.DETAIL_ITINERARY_SIMPLE_VERSION_TITLE)
  Future<DetailItinerarySimpleTitle> postDetailItinerarySimpleTitle(
    @Body() DetailItinerarySimpleTitleRequest detailItinerarySimpleTitleRequest,
  );

  @GET(EndPoints.DETAIL_ITINERARY_SIMPLE_VERSION_EXPANATION)
  Future<DetailItinerarySimplePriorExplanationResponse>
      getDetailItinerarySimpleExplanation();

  @POST(EndPoints.DETAIL_ITINERARY_SIMPLE_VERSION_EXPANATION)
  Future<DetailItinerarySimplePriorExplanationResponse>
      postDetailItinerarySimpleExplanation(
    @Body()
    DetailItinerarySimplePriorExplanationRequest
        detailItinerarySimplePriorExplanationRequest,
  );

  @GET(EndPoints.DETAIL_ITINERARY_SIMPLE_VERSION_INTERPRETER)
  Future<DetailItinerarySimpleInterpreterOrGuideResponse>
      getDetailItinerarySimpleInterpreter();

  @POST(EndPoints.DETAIL_ITINERARY_SIMPLE_VERSION_INTERPRETER)
  Future<DetailItinerarySimpleInterpreterOrGuideResponse>
      postDetailItinerarySimpleInterpreter(
    @Body()
    DetailItinerarySimpleInterpreterOrGuideRequest
        detailItinerarySimpleInterpreterOrGuideRequest,
  );

  @GET('${EndPoints.DETAIL_ITINERARY_SIMPLE_VERAION_PICK_UP}/{id}')
  Future<DetailItinerarySimplePickUpAndDropOffResponse>
      getDetailItinerarySimplePickUp();

  @POST(EndPoints.DETAIL_ITINERARY_SIMPLE_VERAION_PICK_UP)
  Future<DetailItinerarySimplePickUpAndDropOffResponse>
      postDetailItinerarySimplePickUp(
    @Body()
    DetailItinerarySimplePickUpAndDropOffRequest
        detailItinerarySimplePickUpAndDropOffRequest,
  );

  @GET('${EndPoints.DETAIL_ITINERARY}/{id}')
  Future<DetailItineraryResponse> getDetailitinerary({
    @Path('id') String? id,
  });

  @GET(EndPoints.DETAIL_ITINERARY)
  Future<List<DetailItineraryResponse>> getPatientChart({
    @Query('tourName') String? tourName,
    @Query('classification') String? classification,
    @Query('dateFrom') DateTime? dateFrom,
    @Query('dateTo') DateTime? dateTo,
  });

  @POST(EndPoints.DETAIL_ITINERARY)
  Future<DetailItineraryResponse> postDetailItinerary(
    @Body() DetailIneraryRequest detailIneraryRequest,
  );

  @PUT('${EndPoints.DETAIL_ITINERARY}/{id}')
  Future<DetailItineraryResponse> putDetailItinerary(
    @Path('id') String id,
    @Body() DetailIneraryRequest detailIneraryRequest,
  );

  /// Get basic information of hospital C3 Page

  @GET('${EndPoints.BASIC_INFORMATION_HOSPITAL}/{hospitalId}')
  Future<BasicInformationHospitalResponse> getBasicInformationHospital(
    @Path('hospitalId') String hospitalId,
  );

  @POST(EndPoints.BASIC_INFORMATION_HOSPITAL)
  Future<BasicInformationHospitalResponse> postBasicInformationHospital(
    @Body() BasicInformationHospitalRequest basicInformationHospitalRequest,
  );

  @DELETE('${EndPoints.BASIC_INFORMATION_HOSPITAL}/{id}')
  Future<void> deleteBasicInformationHospital(
    @Path('id') String id,
  );

  @GET('${EndPoints.MEDICAL_RECORD_BASIC_INFO_HOSPITAL}/hospital/{hospitalId}')
  Future<List<MedicalRecordBasicInfoHospitalResponse>>
      getMedicalRecordBasicInfoHospital(
    @Path('hospitalId') String hospitalId,
  );

  @POST(EndPoints.MEDICAL_RECORD_BASIC_INFO_HOSPITAL)
  Future<MedicalRecordBasicInfoHospitalResponse>
      postMedicalRecordBasicInfoHospital(
    @Body()
    MedicalRecordBasicInfoHospitalRequest basicInformationHospitalRequest,
  );

  @DELETE('${EndPoints.MEDICAL_RECORD_BASIC_INFO_HOSPITAL}/{id}')
  Future<void> deleteMedicalRecordBasicInfoHospital(
    @Path('id') String id,
  );

  @GET('${EndPoints.DOCTOR_INFORMATION_HOSPITAL}/{hospitalId}')
  Future<List<DoctorProfileHospitalResponse>> getDoctorInformationHospital(
    @Path('hospitalId') String hospitalId,
  );

  @POST(EndPoints.DOCTOR_INFORMATION_HOSPITAL)
  Future<DoctorProfileHospitalResponse> postDoctorInformationHospital(
    @Body() DoctorProfileHospitalRequest doctorInformationHospitalRequest,
  );

  @GET('${EndPoints.ADDITIONALINFORMATION_HOSPITAL}/{hospitalId}')
  Future<AdditionalInformationSectionResponse> getAdditionalInformationHospital(
    @Path('hospitalId') String hospitalId,
  );

  @POST(EndPoints.ADDITIONALINFORMATION_HOSPITAL)
  Future<AdditionalInformationSectionResponse>
      postAdditionalInformationHospital(
    @Body()
    AdditionalInformationSectionRequest additionalInformationHospitalRequest,
  );

  @GET('${EndPoints.PAYMENT_OPTION_HOSPITAL}/{hospitalId}')
  Future<PaymentOptionHospitalResponse> getPaymentOptionHospital(
    @Path('hospitalId') String hospitalId,
  );

  @POST(EndPoints.PAYMENT_OPTION_HOSPITAL)
  Future<PaymentOptionHospitalResponse> postPaymentOptionHospital(
    @Body() PaymentOptionHospitalRequest paymentOptionHospitalRequest,
  );

  @GET('${EndPoints.SUPPORT_LANGUAGE_HOSPITAL}/{hospitalId}')
  Future<List<SupportLanguageHospitalResponse>> getSupportLanguageHospital(
    @Path('hospitalId') String hospitalId,
  );

  @POST(EndPoints.SUPPORT_LANGUAGE_HOSPITAL)
  Future<SupportLanguageHospitalResponse> postSupportLanguageHospital(
    @Body() SupportLanguageHospitalRequest supportLanguageHospitalRequest,
  );

  @GET('${EndPoints.GET_HOW_TO_REQUEST_HOSPITAL}/{hospitalId}')
  Future<HowToRequestHospitalResponse> getHowToRequestHospital(
    @Path('hospitalId') String hospitalId,
  );

  @POST(EndPoints.GET_HOW_TO_REQUEST_HOSPITAL)
  Future<HowToRequestHospitalResponse> postHowToRequestHospital(
    @Body() HowToRequestHospitalRequest supportLanguageHospitalRequest,
  );

  @GET('${EndPoints.GET_NEW_REGISTRATION_HOSPITAL}/by-hospital/{hospitalId}')
  Future<List<NewRegistrationHospitalResponse>> getNewRegistrationHospital({
    @Path('hospitalId') required String hospitalId,
    @Query('classification') String? classification,
    @Query('search') String? search,
  });

  @DELETE('${EndPoints.GET_NEW_REGISTRATION_HOSPITAL}/{id}')
  Future<void> deleteNewRegistrationHospital(
    @Path('id') String id,
  );

  @POST(EndPoints.GET_NEW_REGISTRATION_HOSPITAL)
  Future<NewRegistrationHospitalResponse> postNewRegistrationHospital(
    @Body() NewRegistrationHospitalRequest newRegistrationHospitalRequest,
  );

  @GET('${EndPoints.GET_LIST_SECTION_HOSPITAL}/{hospitalId}')
  Future<ListSectionQAndAHospitalResponse> getListSectionQAndAHospital(
    @Path('hospitalId') String hospitalId,
  );

  @POST(EndPoints.GET_LIST_SECTION_HOSPITAL)
  Future<ListSectionQAndAHospitalResponse> postListSectionQAndAHospital(
    @Body() ListSectionQAndAHospitalRequest listSectionQAndAHospitalRequest,
  );

  @GET('${EndPoints.GET_MATERIAL_HOSPITAL}/{hospitalId}')
  Future<List<MaterialHospitalResponse>> getMaterialHospital({
    @Path('hospitalId') required String hospitalId,
  });

  @POST(EndPoints.GET_MATERIAL_HOSPITAL)
  Future<MaterialHospitalResponse> postMaterialHospital(
    @Body() MaterialHospitalRequest materialHospitalRequest,
  );

  @DELETE('${EndPoints.GET_MATERIAL_HOSPITAL}/{id}')
  Future<void> deleteMaterialHospital(
    @Path('id') String id,
  );

  @GET('${EndPoints.GET_MEMO_MATERIAL_HOSPITAL}/{hospitalId}')
  Future<MemoMaterialHospitalResponse> getMemoMaterialHospital({
    @Path('hospitalId') required String hospitalId,
  });

  @POST(EndPoints.GET_MEMO_MATERIAL_HOSPITAL)
  Future<MemoMaterialHospitalResponse> postMemoMaterialHospital(
    @Body() MemoMaterialHospitalRequest memoMaterialHospitalRequest,
  );

  @GET('${EndPoints.GET_WEB_RESERVATION_PATIENT}/{hospitalId}')
  Future<PatientSectionHospitalResponse> getPatientSectionHospital(
    @Path('hospitalId') String hospitalId,
  );

  @GET('${EndPoints.GET_MEDICAL_INSTITUTION_HOSPITAL}/{hospitalId')
  Future<MedicalInstitutionSectionHospitalResponse>
      getMedicalInstitutionSectionHospital(
    @Path('hospitalId') String hospitalId,
  );

  @GET(EndPoints.GET_HOSPITAL)
  Future<List<BasicInformationHospitalResponse>> getHospitals({
    @Query('page') int? page,
    @Query('pageSize') int? pageSize,
    @Query('hospitalName') String? hospitalName,
    @Query('type') String? type,
    @Query('location') String? location,
    @Query('rHave') String? rHave,
    @Query('hospitalType1') bool? hospitalType1,
    @Query('hospitalType2') bool? hospitalType2,
    @Query('hospitalType3') bool? hospitalType3,
    @Query('hospitalType4') bool? hospitalType4,
  });

  /// end get basic information of hospital C3 Page

  /// G2
  @GET(EndPoints.SALE_DEARD_INFO)
  Future<HeadInfoResponse> getHeadInfo();

  @POST(EndPoints.SALE_DEARD_INFO)
  Future<HeadInfoResponse> postHeadInfo(
    @Body() HeadInfoRequest headInfoRequest,
  );

  @GET(EndPoints.SALE_SERVICE_FREE)
  Future<ServiceFeeResponse> getServiceFree();

  @POST(EndPoints.SALE_SERVICE_FREE)
  Future<ServiceFeeResponse> postServiceFree(
    @Body() ServiceFeeRequest serviceFeeRequest,
  );

  @GET(EndPoints.SALE_EXPLENSES)
  Future<ExpensesResponse> getExpense();

  @POST(EndPoints.SALE_EXPLENSES)
  Future<ExpensesResponse> postExpense(
    @Body() ExpensesRequest expensesRequest,
  );

  @GET(EndPoints.SALE_TOTAL)
  Future<TotalResponse> getTotal();

  @POST(EndPoints.SALE_TOTAL)
  Future<TotalResponse> postTotal(
    @Body() TotalRequest totalRequest,
  );

  @GET('${EndPoints.FACILITY_PHOTO}/{id}')
  Future<List<FacilityResponse>> getFacilityPhoto({
    @Path('id') required String id,
  });

  @POST(EndPoints.FACILITY_PHOTO)
  Future<FacilityResponse> postFacilityPhoto(
    @Body() FacilityRequest facilityRequest,
  );

  @DELETE('${EndPoints.FACILITY_PHOTO}/{id}')
  Future<void> deleteFacilityPhoto(
    @Path('id') String id,
  );

  @GET('${EndPoints.DOCUMENT}/{id}')
  Future<List<DocumentResponse>> getDocument({
    @Path('id') required String id,
  });

  @POST(EndPoints.DOCUMENT)
  Future<DocumentResponse> postDocument(
    @Body() DocumentRequest documentRequest,
  );

  @DELETE('${EndPoints.DOCUMENT}/{id}')
  Future<void> deleteDocument({
    @Path('id') required String id,
  });

  @GET('${EndPoints.HEALTH_CHECKUP}/{id}')
  Future<List<HealthResponse>> getHealthCheckup({
    @Path('id') required String id,
  });

  @POST(EndPoints.HEALTH_CHECKUP)
  Future<HealthResponse> postHealthCheckup(
    @Body() HealthRequest healthCheckupRequest,
  );

  @DELETE('${EndPoints.HEALTH_CHECKUP}/{id}')
  Future<void> deleteHealth({
    @Path('id') required String id,
  });

  @GET('${EndPoints.CONTRACT}/{id}')
  Future<List<ContractResponse>> getContract({
    @Path('id') required String id,
  });

  @POST(EndPoints.CONTRACT)
  Future<ContractResponse> postContract(
    @Body() ContractRequest contractRequest,
  );

  @DELETE('${EndPoints.CONTRACT}/{id}')
  Future<void> deleteContract({
    @Path('id') required String id,
  });

  @GET('${EndPoints.CONTRANT_AGENT}/{id}')
  Future<List<ContrantAgentResponse>> getContractAgent({
    @Path('id') required String id,
  });

  @POST(EndPoints.CONTRANT_AGENT)
  Future<ContrantAgentResponse> postContractAgent(
    @Body() ContrantAgentRequest contrantAgentRequest,
  );

  @DELETE('${EndPoints.CONTRANT_AGENT}/{id}')
  Future<void> deleteContractAgent(
    @Path('id') String id,
  );

  @GET('${EndPoints.ESTIMATE_INVOICE}/{id}')
  Future<List<EstimateInvoiceResponse>> getEstimateInvoice({
    @Path('id') required String id,
  });

  @POST(EndPoints.ESTIMATE_INVOICE)
  Future<EstimateInvoiceResponse> postEstimateInvoice(
    @Body() EstimateInvoiceRequest estimateInvoiceRequest,
  );

  @DELETE('${EndPoints.ESTIMATE_INVOICE}/{id}')
  Future<void> deleteEstimateInvoice(
    @Path('id') String id,
  );

  @GET('${EndPoints.DOMESTIC_MEDICAL_DATA}/by-medical-record/{id}')
  Future<List<DomesticMedicalDataResponse>> getDomesticMedicalData({
    @Path('id') required String id,
  });

  @POST(EndPoints.DOMESTIC_MEDICAL_DATA)
  Future<DomesticMedicalDataResponse> postDomesticMedicalData(
    @Body() DomesticMedicalDataRequest domesticMedicalDataRequest,
  );

  @DELETE('${EndPoints.DOMESTIC_MEDICAL_DATA}/{id}')
  Future<void> deleteDomesticMedical(
    @Path('id') String id,
  );

  @GET('${EndPoints.MEDICAL_PAYMENT_DETAIL}/by-medical-record/{id}')
  Future<List<MedicalPaymentResponse>> getMedicalPaymentDetail({
    @Path('id') required String id,
  });

  @POST(EndPoints.MEDICAL_PAYMENT_DETAIL)
  Future<MedicalPaymentResponse> postMedicalPaymentDetail(
    @Body() MedicalPaymentRequest medicalPaymentRequest,
  );

  @DELETE('${EndPoints.MEDICAL_PAYMENT_DETAIL}/{id}')
  Future<void> deleteMedicalPaymentDetail(
    @Path('id') String id,
  );

  @GET(EndPoints.INVOICE_DETAIL)
  Future<List<InvoiceResponse>> getInvoiceDetail();

  @POST(EndPoints.INVOICE_DETAIL)
  Future<InvoiceResponse> postInvoiceDetail(
    @Body() InvoiceRequest invoiceRequest,
  );

  @GET(EndPoints.FILTER_IVOICE)
  Future<List<InvoiceFilterResponse>> filterInvoice();

  @POST(EndPoints.FILTER_IVOICE)
  Future<InvoiceFilterResponse> postFilterInvoice(
    @Body() InvoiceFilterRequest invoiceFilterRequest,
  );

  @GET(EndPoints.ESTIMATE_MASTER)
  Future<List<EstimateMasterResponse>> getEstimateMaster();

  @POST(EndPoints.ESTIMATE_MASTER)
  Future<EstimateMasterResponse> postEstimateMaster(
    @Body() EstimateMasterRequest estimateMasterRequest,
  );

  @GET(EndPoints.REPROT_CONTRACT)
  Future<List<ReportContractResponse>> getReportContract();

  @POST(EndPoints.REPROT_CONTRACT)
  Future<ReportContractResponse> postReportContract(
    @Body() ReportContractRequest reportContractRequest,
  );

  @GET(EndPoints.REPROT_CONTRACT_FILTER)
  Future<ContractFilterResponse> getReportFilter();

  @POST(EndPoints.REPROT_CONTRACT_FILTER)
  Future<ContractFilterResponse> postReportFilter(
    @Body() ContractFilterRequest contractFilterRequest,
  );

  @GET(EndPoints.REPROT_CONTRACT_DETAIL)
  Future<ContractReportDetailResponse> getContractReportDetail();

  @POST(EndPoints.REPROT_CONTRACT_DETAIL)
  Future<ContractReportDetailResponse> postContractReportDetail(
    @Body() ContractReportDetailRequest contractReportDetailRequest,
  );

  @GET(EndPoints.CONTRACT_TEMPLATE_DETAIL_BASIC_INFO)
  Future<ContractTemplateBasicInformationResponse>
      getContractTemplateBasicInformation();

  @POST(EndPoints.CONTRACT_TEMPLATE_DETAIL_BASIC_INFO)
  Future<ContractTemplateBasicInformationResponse>
      postContractTemplateBasicInformation(
    ContractTemplateBasicInformationRequest
        contractTemplateBasicInformationRequest,
  );

  @GET(EndPoints.ESTIMATE_MASTER_REPORT)
  Future<List<EstimatemasterReportResponse>> getEstimateMasterReport();

  @POST(EndPoints.ESTIMATE_MASTER_REPORT)
  Future<EstimatemasterReportResponse> postEstimateMasterReport(
    @Body() EstimatemasterReportRequest estimateMasterReportRequest,
  );

  @GET(EndPoints.PROSPECTIVE_RANK)
  Future<List<ProspectiveRankResponse>> getProspectiveRank();

  @POST(EndPoints.PROSPECTIVE_RANK)
  Future<ProspectiveRankResponse> postProspectiveRank(
    @Body() ProspectiveRankRequest prospectiveRankRequest,
  );

  @GET('${EndPoints.TREATMENT_MENU}/by-hospital/{id}')
  Future<List<TreatmentMenuResponse>> getTreatmentMenu({
    @Path('id') required String id,
  });

  @POST(EndPoints.TREATMENT_MENU)
  Future<TreatmentMenuResponse> postTreatmentMenu(
    @Body() TreatmentMenuRequest treatmentMenuRequest,
  );

  @PUT('${EndPoints.TREATMENT_MENU}/{id}')
  Future<TreatmentMenuResponse> putTreatmentMenu({
    @Path('id') required String id,
    @Body() required TreatmentMenuRequest treatmentMenuRequest,
  });

  @DELETE('${EndPoints.TREATMENT_MENU}/{id}')
  Future<void> deleteTreatmentMenu({
    @Path('id') required String id,
  });

  @GET('${EndPoints.TREATMENT_TELE_MENU}/by-hospital/{id}')
  Future<List<TreatmentTeleMenuResponse>> getTreatmentTeleMenu({
    @Path('id') required String id,
  });

  @POST(EndPoints.TREATMENT_TELE_MENU)
  Future<TreatmentTeleMenuResponse> postTreatmentTeleMenu(
    @Body() TreatmentTeleMenuRequest treatmentTeleMenuRequest,
  );

  @PUT('${EndPoints.TREATMENT_TELE_MENU}/{id}')
  Future<TreatmentTeleMenuResponse> putTreatmentTeleMenu({
    @Path('id') required String id,
    @Body() required TreatmentTeleMenuRequest treatmentTeleMenuRequest,
  });

  @DELETE('${EndPoints.TREATMENT_TELE_MENU}/{id}')
  Future<TreatmentTeleMenuResponse> deleteTreatmentTeleMenu({
    @Path('id') required String id,
  });

  @GET('${EndPoints.CLOSE_PATIENT}/{id}')
  Future<void> closePatientAccount(
    @Path('id') String id,
  );

  //WEB_BOOKING_HOSPITAL
  @GET('${EndPoints.WEB_BOOKING_HOSPITAL}/get-by-hospital-id/{id}')
  Future<BasicInformationHospitalResponse> webBookingGetHospitalById(
    @Path('id') String hospitalId,
  );

  @GET('${EndPoints.WEB_BOOKING_HOSPITAL}/search')
  Future<List<BasicInformationHospitalResponse>> webBookingSearchHospital({
    @Query('search') String? search,
  });

  @GET('${EndPoints.WEB_BOOKING_HOSPITAL}/{hospitalId}/doctors')
  Future<List<DoctorProfileHospitalResponse>> getDoctorsByHospitalId(
    @Path('hospitalId') String hospitalId,
  );

  //WEB_BOOKING_PATIENT

  @GET('${EndPoints.WEB_BOOKING_PATIENT}/get-by-patient-id/{id}')
  Future<Patient> webBookingGetPatientById(
    @Path('id') String patientId,
  );

  @GET('${EndPoints.WEB_BOOKING_PATIENT}/search')
  Future<List<Patient>> webBookingSearchPatients({
    @Query('search') String? search,
  });

  @GET('${EndPoints.WEB_BOOKING_PATIENT}/{patientId}/booking')
  Future<TreamentResponce> getBookingByPatientId(
    @Path('patientId') String patientId,
  );

  @PUT('${EndPoints.WEB_BOOKING_PATIENT}/{id}')
  Future<TreamentResponce> updateBooking(
    @Path('id') String id,
    @Body() TreamentRequest treamentResponce,
  );

  //WEB_BOOKING_RESERVATION

  @GET(EndPoints.WEB_BOOKING_RESERVATION)
  Future<List<WebBookingMedicalRecordResponse>> webBookingGetReservationAll({
    @Query('hospitalName') String? hospitalName,
    @Query('doctor_name') String? doctor_name,
    @Query('reservation_date_from') DateTime? reservation_date_from,
    @Query('reservation_date_to') DateTime? reservation_date_to,
    @Query('inquiryInProgress') bool? inquiryInProgress,
    @Query('reservationConfirmed') bool? reservationConfirmed,
    @Query('hospital') String? hospitalId,
    @Query('patient') String? patientId,
  });

  @GET('${EndPoints.WEB_BOOKING_RESERVATION}/{id}')
  Future<WebBookingMedicalRecordResponse> webBookingGetReservationById(
    @Path('id') String reservationId,
  );

  @POST(EndPoints.WEB_BOOKING_RESERVATION)
  Future<WebBookingMedicalRecordResponse> webBookingPostReservation(
    @Body() WebBookingMedicalRecordRequest webBookingMedicalRecordRequest,
  );

  @PUT('${EndPoints.WEB_BOOKING_RESERVATION}/{id}')
  Future<WebBookingMedicalRecordResponse> webBookingPutReservation(
    @Path('id') String reservationId,
    @Body() WebBookingMedicalRecordRequest webBookingMedicalRecordRequest,
  );

  @DELETE('${EndPoints.WEB_BOOKING_RESERVATION}/{id}')
  Future<void> webBookingDeleteReservation(
    @Path('id') String reservationId,
  );

  //Agent A9
  @GET('${EndPoints.SUMMARY_LIST}/medicalRecord/{id}')
  Future<List<MedicalRecordFileSummaryResponse>> getSummaryList(
    @Path('id') String medicalId,
  );

  //getFileSummaryBySummaryId
  @GET('${EndPoints.SUMMARY_LIST}/recordSummary/{id}')
  Future<List<MedicalRecordFileSummaryResponse>> getFileSummaryBySummaryId(
    @Path('id') String summaryId,
  );

  @DELETE('${EndPoints.SUMMARY_LIST}/{id}')
  Future<void> deleteSummaryList(
    @Path('id') String patientId,
  );

  @POST(EndPoints.SUMMARY_LIST)
  Future<MedicalRecordFileSummaryResponse> postFileSummary(
    @Body() MedicalRecordFileSummaryRequest medicalRecordFileSummaryRequest,
  );

  @DELETE('${EndPoints.SUMMARY_LIST}/{id}')
  Future<void> deleteFileSummary(
    @Path('id') String id,
  );
}

extension ApiServiceExts on ApiService {
  RestClient get client => GetIt.I<RestClient>();
}
