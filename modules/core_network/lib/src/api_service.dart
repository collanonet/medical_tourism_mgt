import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
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

  @GET(
      '${Endpoints.GET_MEDICAL_RECORD_AGENTS_BY_MEDICAL_RECORD}/{medicalRecordId}')
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

  @GET(
      '${Endpoints.GET_MEDICAL_RECORD_BUDGETS_BY_MEDICAL_RECORD}/{medicalRecordId}')
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

  @GET(
      '${Endpoints.MEDICAL_RECORDS_OVERSEAS_DATA_MEDICAL_RECORD}/{medicalRecordId}')
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

  @GET(
      '${Endpoints.MEDICAL_RECORD_PROPOSAL_BY_MEDICAL_RECORD}/{medicalRecordId}')
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
  Future<TreamentResponce> getInfoMedicalExamination(
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
  Future<List<AgentResponse>> getAgents({
    @Query('companyName') String? companyName,
    @Query('nameKana') String? nameKana,
    @Query('postalCode') String? postalCode,
    @Query('address') String? address,
    @Query('area') String? area,
    @Query('phoneNumber') String? phoneNumber,
    @Query('transactionStartDate') DateTime? transactionStartDate,
    @Query('howToMainPayment') String? howToMainPayment,
    @Query('pastCasesNumber') int? pastCasesNumber,
  });

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

  //E1

  @GET(Endpoints.FILTER_PROCESS_CHART_PATIENT)
  Future<PatientFilterResponse> getFilterPatientChart();

  @POST(Endpoints.FILTER_PROCESS_CHART_PATIENT)
  Future<PatientFilterResponse> postFilterpatientChart(
    @Body() PatientFilterRequst patientFilterRequst,
  );

  @GET(Endpoints.ITINERARY_SIMPLE_TITLE)
  Future<ItineraryTitleResponse> getItineraryTitle();

  @POST(Endpoints.ITINERARY_SIMPLE_TITLE)
  Future<ItineraryTitleResponse> postItineraryTitle(
    @Body() ItineraryTitleRequest itineraryTitleRequest,
  );

  @GET(Endpoints.ITINERARY_SIMPLE_EXPLANATION)
  Future<ItineraryExplanationResponse> getItineraryExplanation();

  @POST(Endpoints.ITINERARY_SIMPLE_EXPLANATION)
  Future<ItineraryExplanationResponse> postItineraryExplanation(
    @Body() ItineraryExplanationRequest itineraryExplanationRequest,
  );

  @GET(Endpoints.ITINERARY_SIMPLE_INTERPRETOR_OR_GUIDE)
  Future<ItineraryInterpreterOrGuideInputResponse>
      getItineraryInterpretorOrGuideInput();

  @POST(Endpoints.ITINERARY_SIMPLE_INTERPRETOR_OR_GUIDE)
  Future<ItineraryInterpreterOrGuideInputResponse>
      postItineraryInterpretorOrGuideInput(
    @Body()
    ItineraryInterpreterOrGuideInputRequest
        itineraryInterpreterOrGuideInputRequest,
  );

  @GET(Endpoints.ITINERARY_SIMPLE_TRANSFER_INPUT)
  Future<ItineraryTransferInputResponse> getItineraryTransferInput();

  @POST(Endpoints.ITINERARY_SIMPLE_TRANSFER_INPUT)
  Future<ItineraryTransferInputResponse> postItineraryTransferInput(
    @Body() ItineraryTransferInputRequest itineraryTransferInputRequest,
  );

  @GET(Endpoints.DETAIL_FACILITY_HOSPITAL)
  Future<List<DetailFacilityHotelResponse>> getDetialFacilityHospital();

  @POST(Endpoints.DETAIL_FACILITY_HOSPITAL)
  Future<DetailFacilityHotelResponse> postDetailFacilityHospital(
    @Body() DetailFacilityHotelRequest detailFacilityHotelRequest,
  );

  @GET(Endpoints.DETAIL_FACILITY_DROP_IN_FACILITY)
  Future<DetailDropInFacilityResponse> getDetailFacilityDropIn();

  @POST(Endpoints.DETAIL_FACILITY_DROP_IN_FACILITY)
  Future<DetailDropInFacilityResponse> postDetailFacilityDropIn(
    @Body() DetailDropInFacilityRequest detailDropInFacilityRequest,
  );

  @GET(Endpoints.DETAIL_HOTEL_REGISTATION)
  Future<DetainHotelRegistationResponse> getDetainlHotelRegistation();

  @POST(Endpoints.DETAIL_HOTEL_REGISTATION)
  Future<DetainHotelRegistationResponse> postDetailHotelRegistation(
    @Body() DetainHotelRegistationRequest detainHotelRegistationRequest,
  );

  @GET(Endpoints.DETAIL_HOTEL_SEARCH)
  Future<DetailHotelSearchResponse> getDetailHotelSearch();

  @POST(Endpoints.DETAIL_HOTEL_SEARCH)
  Future<DetailHotelSearchResponse> postDetialHotelSearch(
    @Body() DetailHotelSearchRequest detailHotelSearchRequest,
  );

  @GET(Endpoints.DETAIL_RELATED_PARTIES_GUIDE_OR_INERPRETER)
  Future<DetailRelatedPartiesResponse> getRelatedPartiesGuideOrInterpreter();

  @POST(Endpoints.DETAIL_RELATED_PARTIES_GUIDE_OR_INERPRETER)
  Future<DetailRelatedPartiesResponse> postRelatedPartiesGuideOrInterpreter(
    @Body() DetailRelatedPartiesRequest detailRelatedPartiesRequest,
  );

  @GET(Endpoints.DETAIL_RELATED_PARTIES_BUS_COMPANY)
  Future<DetailRelatedPartiesBusCompanyResponse> getRelatedPartiesBusCompany();

  @POST(Endpoints.DETAIL_RELATED_PARTIES_BUS_COMPANY)
  Future<DetailRelatedPartiesBusCompanyResponse> postRelatedPartiesBusCompany(
    @Body()
    DetailRelatedPartiesBusCompanyRequest detailRelatedPartiesBusCompanyRequest,
  );

  @GET(Endpoints.DETAIL_RELATED_PARTIES_DRIVER)
  Future<DetailRelatedPartiesDriverResponse> getRelatedPartiesDriver();

  @POST(Endpoints.DETAIL_RELATED_PARTIES_DRIVER)
  Future<DetailRelatedPartiesDriverResponse> postRelatedPartiesDriver(
    @Body() DetailRelatedPartiesDriverRequest detailRelatedPartiesDriverRequest,
  );

  @GET(Endpoints.DETAIL_RELATED_EMERGENCY_CONTACT)
  Future<DetailRelatedPartiesEmergencyContactResponse>
      getRelatedPartiesEmergencyContact();

  @POST(Endpoints.DETAIL_RELATED_EMERGENCY_CONTACT)
  Future<DetailRelatedPartiesEmergencyContactResponse>
      postRelatedPartiesEmergencyContact(
    @Body()
    DetailRelatedPartiesEmergencyContactRequest
        detailRelatedPartiesEmergencyContactRequest,
  );

  @GET(Endpoints.DETAIL_ITINERARY_SIMPLE_VERSION_TITLE)
  Future<DetailItinerarySimpleTitle> getDetailItinerarySimpleTitle();

  @POST(Endpoints.DETAIL_ITINERARY_SIMPLE_VERSION_TITLE)
  Future<DetailItinerarySimpleTitle> postDetailItinerarySimpleTitle(
    @Body() DetailItinerarySimpleTitleRequest detailItinerarySimpleTitleRequest,
  );

  @GET(Endpoints.DETAIL_ITINERARY_SIMPLE_VERSION_EXPANATION)
  Future<DetailItinerarySimplePriorExplanationResponse>
      getDetailItinerarySimpleExplanation();

  @POST(Endpoints.DETAIL_ITINERARY_SIMPLE_VERSION_EXPANATION)
  Future<DetailItinerarySimplePriorExplanationResponse>
      postDetailItinerarySimpleExplanation(
    @Body()
    DetailItinerarySimplePriorExplanationRequest
        detailItinerarySimplePriorExplanationRequest,
  );

  @GET(Endpoints.DETAIL_ITINERARY_SIMPLE_VERSION_INTERPRETER)
  Future<DetailItinerarySimpleInterpreterOrGuideResponse>
      getDetailItinerarySimpleInterpreter();

  @POST(Endpoints.DETAIL_ITINERARY_SIMPLE_VERSION_INTERPRETER)
  Future<DetailItinerarySimpleInterpreterOrGuideResponse>
      postDetailItinerarySimpleInterpreter(
    @Body()
    DetailItinerarySimpleInterpreterOrGuideRequest
        detailItinerarySimpleInterpreterOrGuideRequest,
  );

  @GET(Endpoints.DETAIL_ITINERARY_SIMPLE_VERAION_PICK_UP)
  Future<DetailItinerarySimplePickUpAndDropOffResponse>
      getDetailItinerarySimplePickUp();

  @POST(Endpoints.DETAIL_ITINERARY_SIMPLE_VERAION_PICK_UP)
  Future<DetailItinerarySimplePickUpAndDropOffResponse>
      postDetailItinerarySimplePickUp(
    @Body()
    DetailItinerarySimplePickUpAndDropOffRequest
        detailItinerarySimplePickUpAndDropOffRequest,
  );

  @GET(Endpoints.DETAIL_ITINERARY)
  Future<DetailItineraryResponse> getDetailitinerary();

  @POST(Endpoints.DETAIL_ITINERARY)
  Future<DetailItineraryResponse> postDetailItinerary(
    @Body() DetailIneraryRequest detailIneraryRequest,
  );

  /// Get basic information of hospital C3 Page

  @GET('${Endpoints.BASIC_INFORMATION_HOSPITAL}/{hospitalId}')
  Future<BasicInformationHospitalResponse> getBasicInformationHospital(
    @Path('hospitalId') String hospitalId,
  );

  @POST(Endpoints.BASIC_INFORMATION_HOSPITAL)
  Future<BasicInformationHospitalResponse> postBasicInformationHospital(
    @Body() BasicInformationHospitalRequest basicInformationHospitalRequest,
  );

  @GET('${Endpoints.MEDICAL_RECORD_BASIC_INFO_HOSPITAL}/hospital/{hospitalId}')
  Future<List<MedicalRecordBasicInfoHospitalResponse>>
      getMedicalRecordBasicInfoHospital(
    @Path('hospitalId') String hospitalId,
  );

  @POST(Endpoints.MEDICAL_RECORD_BASIC_INFO_HOSPITAL)
  Future<MedicalRecordBasicInfoHospitalResponse>
      postMedicalRecordBasicInfoHospital(
    @Body()
    MedicalRecordBasicInfoHospitalRequest basicInformationHospitalRequest,
  );

  @GET('${Endpoints.DOCTOR_INFORMATION_HOSPITAL}/{hospitalId}')
  Future<List<DoctorProfileHospitalResponse>> getDoctorInformationHospital(
    @Path('hospitalId') String hospitalId,
  );

  @POST(Endpoints.DOCTOR_INFORMATION_HOSPITAL)
  Future<DoctorProfileHospitalResponse> postDoctorInformationHospital(
    @Body() DoctorProfileHospitalRequest doctorInformationHospitalRequest,
  );

  @GET('${Endpoints.ADDITIONALINFORMATION_HOSPITAL}/{hospitalId}')
  Future<AdditionalInformationSectionResponse> getAdditionalInformationHospital(
    @Path('hospitalId') String hospitalId,
  );

  @POST(Endpoints.ADDITIONALINFORMATION_HOSPITAL)
  Future<AdditionalInformationSectionResponse>
      postAdditionalInformationHospital(
    @Body()
    AdditionalInformationSectionRequest additionalInformationHospitalRequest,
  );

  @GET('${Endpoints.PAYMENT_OPTION_HOSPITAL}/{hospitalId}')
  Future<PaymentOptionHospitalResponse> getPaymentOptionHospital(
    @Path('hospitalId') String hospitalId,
  );

  @POST(Endpoints.PAYMENT_OPTION_HOSPITAL)
  Future<PaymentOptionHospitalResponse> postPaymentOptionHospital(
    @Body() PaymentOptionHospitalRequest paymentOptionHospitalRequest,
  );

  @GET('${Endpoints.SUPPORT_LANGUAGE_HOSPITAL}/{hospitalId}')
  Future<List<SupportLanguageHospitalResponse>> getSupportLanguageHospital(
    @Path('hospitalId') String hospitalId,
  );

  @POST(Endpoints.SUPPORT_LANGUAGE_HOSPITAL)
  Future<SupportLanguageHospitalResponse> postSupportLanguageHospital(
    @Body() SupportLanguageHospitalRequest supportLanguageHospitalRequest,
  );

  @GET('${Endpoints.GET_HOW_TO_REQUEST_HOSPITAL}/{hospitalId}')
  Future<HowToRequestHospitalResponse> getHowToRequestHospital(
    @Path('hospitalId') String hospitalId,
  );

  @POST(Endpoints.GET_HOW_TO_REQUEST_HOSPITAL)
  Future<HowToRequestHospitalResponse> postHowToRequestHospital(
    @Body() HowToRequestHospitalRequest supportLanguageHospitalRequest,
  );

  @GET('${Endpoints.GET_NEW_REGISTRATION_HOSPITAL}/by-hospital/{hospitalId}')
  Future<NewRegistrationHospitalResponse> getNewRegistrationHospital(
    @Path('hospitalId') String hospitalId,
  );

  @POST(Endpoints.GET_NEW_REGISTRATION_HOSPITAL)
  Future<NewRegistrationHospitalResponse> postNewRegistrationHospital(
    @Body() NewRegistrationHospitalRequest newRegistrationHospitalRequest,
  );

  @GET('${Endpoints.GET_LIST_SECTION_HOSPITAL}/{hospitalId}')
  Future<ListSectionQAndAHospitalResponse> getListSectionQAndAHospital(
    @Path('hospitalId') String hospitalId,
  );

  @POST(Endpoints.GET_LIST_SECTION_HOSPITAL)
  Future<ListSectionQAndAHospitalResponse> postListSectionQAndAHospital(
    @Body() ListSectionQAndAHospitalRequest listSectionQAndAHospitalRequest,
  );

  @GET('${Endpoints.GET_MATERIAL_HOSPITAL}/{hospitalId}')
  Future<List<MaterialHospitalResponse>> getMaterialHospital({
    @Path('hospitalId') required String hospitalId,
  });

  @POST(Endpoints.GET_MATERIAL_HOSPITAL)
  Future<MaterialHospitalResponse> postMaterialHospital(
    @Body() MaterialHospitalRequest materialHospitalRequest,
  );

  @GET('${Endpoints.GET_MEMO_MATERIAL_HOSPITAL}/{hospitalId}')
  Future<MemoMaterialHospitalResponse> getMemoMaterialHospital({
    @Path('hospitalId') required String hospitalId,
  });

  @POST(Endpoints.GET_MEMO_MATERIAL_HOSPITAL)
  Future<MemoMaterialHospitalResponse> postMemoMaterialHospital(
    @Body() MemoMaterialHospitalRequest memoMaterialHospitalRequest,
  );

  @GET('${Endpoints.GET_WEB_RESERVATION_PATIENT}/{hospitalId}')
  Future<PatientSectionHospitalResponse> getPatientSectionHospital(
    @Path('hospitalId') String hospitalId,
  );

  @GET('${Endpoints.GET_MEDICAL_INSTITUTION_HOSPITAL}/{hospitalId')
  Future<MedicalInstitutionSectionHospitalResponse>
      getMedicalInstitutionSectionHospital(
    @Path('hospitalId') String hospitalId,
  );

  @GET(Endpoints.GET_HOSPITAL)
  Future<List<BasicInformationHospitalResponse>> getHospitals();

  /// end get basic information of hospital C3 Page

  /// G2
  @GET(Endpoints.SALE_DEARD_INFO)
  Future<HeadInfoResponse> getHeadInfo();

  @POST(Endpoints.SALE_DEARD_INFO)
  Future<HeadInfoResponse> postHeadInfo(
    @Body() HeadInfoRequest headInfoRequest,
  );

  @GET(Endpoints.SALE_SERVICE_FREE)
  Future<ServiceFeeResponse> getServiceFree();

  @POST(Endpoints.SALE_SERVICE_FREE)
  Future<ServiceFeeResponse> postServiceFree(
    @Body() ServiceFeeRequest serviceFeeRequest,
  );

  @GET(Endpoints.SALE_EXPLENSES)
  Future<ExpensesResponse> getExpense();

  @POST(Endpoints.SALE_EXPLENSES)
  Future<ExpensesResponse> postExpense(
    @Body() ExpensesRequest expensesRequest,
  );

  @GET(Endpoints.SALE_TOTAL)
  Future<TotalResponse> getTotal();

  @POST(Endpoints.SALE_TOTAL)
  Future<TotalResponse> postTotal(
    @Body() TotalRequest totalRequest,
  );

  @GET('${Endpoints.FACILITY_PHOTO}/{id}')
  Future<List<FacilityResponse>> getFacilityPhoto({
    @Path('id') required String id,
  });

  @POST(Endpoints.FACILITY_PHOTO)
  Future<FacilityResponse> postFacilityPhoto(
    @Body() FacilityRequest facilityRequest,
  );

  @GET('${Endpoints.DOCUMENT}/{id}')
  Future<List<DocumentResponse>> getDocument({
    @Path('id') required String id,
  });

  @POST(Endpoints.DOCUMENT)
  Future<DocumentResponse> postDocument(
    @Body() DocumentRequest documentRequest,
  );

  @GET('${Endpoints.HEALTH_CHECKUP}/{id}')
  Future<List<HealthResponse>> getHealthCheckup({
    @Path('id') required String id,
  });

  @POST(Endpoints.HEALTH_CHECKUP)
  Future<HealthResponse> postHealthCheckup(
    @Body() HealthRequest healthCheckupRequest,
  );

  @DELETE('${Endpoints.HEALTH_CHECKUP}/{id}')
  Future<void> deleteHealth({
    @Path('id') required String id,
  });

  @GET('${Endpoints.CONTRACT}/{id}')
  Future<List<ContractResponse>> getContract({
    @Path('id') required String id,
  });

  @POST(Endpoints.CONTRACT)
  Future<ContractResponse> postContract(
    @Body() ContractRequest contractRequest,
  );

  @GET('${Endpoints.CONTRANT_AGENT}/{id}')
  Future<List<ContrantAgentResponse>> getContractAgent({
    @Path('id') required String id,
  });

  @POST(Endpoints.CONTRANT_AGENT)
  Future<ContrantAgentResponse> postContractAgent(
    @Body() ContrantAgentRequest contrantAgentRequest,
  );

  @GET('${Endpoints.ESTIMATE_INVOICE}/{id}')
  Future<List<EstimateInvoiceResponse>> getEstimateInvoice({
    @Path('id') required String id,
  });

  @POST(Endpoints.ESTIMATE_INVOICE)
  Future<EstimateInvoiceResponse> postEstimateInvoice(
    @Body() EstimateInvoiceRequest estimateInvoiceRequest,
  );

  @GET('${Endpoints.DOMESTIC_MEDICAL_DATA}/{id}')
  Future<List<DomesticMedicalDataResponse>> getDomesticMedicalData({
    @Path('id') required String id,
  });

  @POST(Endpoints.DOMESTIC_MEDICAL_DATA)
  Future<DomesticMedicalDataResponse> postDomesticMedicalData(
    @Body() DomesticMedicalDataRequest domesticMedicalDataRequest,
  );

  @GET('${Endpoints.MEDICAL_PAYMENT_DETAIL}/{id}')
  Future<List<MedicalPaymentResponse>> getMedicalPaymentDetail({
    @Path('id') required String id,
  });

  @POST(Endpoints.MEDICAL_PAYMENT_DETAIL)
  Future<MedicalPaymentResponse> postMedicalPaymentDetail(
    @Body() MedicalPaymentRequest medicalPaymentRequest,
  );

  @GET(Endpoints.INVOICE_DETAIL)
  Future<List<InvoiceResponse>> getInvoiceDetail();

  @POST(Endpoints.INVOICE_DETAIL)
  Future<InvoiceResponse> postInvoiceDetail(
    @Body() InvoiceRequest invoiceRequest,
  );

  @GET(Endpoints.FILTER_IVOICE)
  Future<List<InvoiceFilterResponse>> filterInvoice();

  @POST(Endpoints.FILTER_IVOICE)
  Future<InvoiceFilterResponse> postFilterInvoice(
    @Body() InvoiceFilterRequest invoiceFilterRequest,
  );

  @GET(Endpoints.ESTIMATE_MASTER)
  Future<List<EstimateMasterResponse>> getEstimateMaster();

  @POST(Endpoints.ESTIMATE_MASTER)
  Future<EstimateMasterResponse> postEstimateMaster(
    @Body() EstimateMasterRequest estimateMasterRequest,
  );

  @GET(Endpoints.REPROT_CONTRACT)
  Future<List<ReportContractResponse>> getReportContract();

  @POST(Endpoints.REPROT_CONTRACT)
  Future<ReportContractResponse> postReportContract(
    @Body() ReportContractRequest reportContractRequest,
  );

  @GET(Endpoints.REPROT_CONTRACT_FILTER)
  Future<ContractFilterResponse> getReportFilter();

  @POST(Endpoints.REPROT_CONTRACT_FILTER)
  Future<ContractFilterResponse> postReportFilter(
    @Body() ContractFilterRequest contractFilterRequest,
  );

  @GET(Endpoints.REPROT_CONTRACT_DETAIL)
  Future<ContractReportDetailResponse> getContractReportDetail();

  @POST(Endpoints.REPROT_CONTRACT_DETAIL)
  Future<ContractReportDetailResponse> postContractReportDetail(
    @Body() ContractReportDetailRequest contractReportDetailRequest,
  );

  @GET(Endpoints.CONTRACT_TEMPLATE_DETAIL_BASIC_INFO)
  Future<ContractTemplateBasicInformationResponse>
      getContractTemplateBasicInformation();

  @POST(Endpoints.CONTRACT_TEMPLATE_DETAIL_BASIC_INFO)
  Future<ContractTemplateBasicInformationResponse>
      postContractTemplateBasicInformation(
    ContractTemplateBasicInformationRequest
        contractTemplateBasicInformationRequest,
  );

  @GET(Endpoints.ESTIMATE_MASTER_REPORT)
  Future<List<EstimatemasterReportResponse>> getEstimateMasterReport();

  @POST(Endpoints.ESTIMATE_MASTER_REPORT)
  Future<EstimatemasterReportResponse> postEstimateMasterReport(
    @Body() EstimatemasterReportRequest estimateMasterReportRequest,
  );

  @GET(Endpoints.PROSPECTIVE_RANK)
  Future<List<ProspectiveRankResponse>> getProspectiveRank();

  @POST(Endpoints.PROSPECTIVE_RANK)
  Future<ProspectiveRankResponse> postProspectiveRank(
    @Body() ProspectiveRankRequest prospectiveRankRequest,
  );

  @GET('${Endpoints.TREATMENT_MENU}/{id}')
  Future<List<TreatmentMenuResponse>> getTreatmentMenu({
    @Path('id') required String id,
  });

  @POST(Endpoints.TREATMENT_MENU)
  Future<TreatmentMenuResponse> postTreatmentMenu(
    @Body() TreatmentMenuRequest treatmentMenuRequest,
  );

  @GET('${Endpoints.TREATMENT_TELE_MENU}/by-hospital/{id}')
  Future<List<TreatmentTeleMenuResponse>> getTreatmentTeleMenu({
    @Path('id') required String id,
  });

  @POST(Endpoints.TREATMENT_TELE_MENU)
  Future<TreatmentTeleMenuResponse> postTreatmentTeleMenu(
    @Body() TreatmentTeleMenuRequest treatmentTeleMenuRequest,
  );
}

extension ApiServiceExts on ApiService {
  RestClient get client => GetIt.I<RestClient>();
}
