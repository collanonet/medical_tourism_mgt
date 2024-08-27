import 'package:core_network/core_network.dart';
import 'package:core_network/entities.dart';

abstract class HospitalRepository {
  /// Get basic information of hospital C3 Page
  ///
  Future<FileResponse> uploadFileBase64(
    String file,
    String filename,
  );

  Future<BasicInformationHospitalResponse> getBasicInformationHospital(
    String hospitalId,
  );

  Future<BasicInformationHospitalResponse> postBasicInformationHospital(
    BasicInformationHospitalRequest basicInformationHospitalRequest,
  );

  Future<List<MedicalRecordBasicInfoHospitalResponse>>
      getMedicalRecordBasicInfoHospital(String hospitalId);

  Future<MedicalRecordBasicInfoHospitalResponse>
      postMedicalRecordBasicInfoHospital(
    MedicalRecordBasicInfoHospitalRequest basicInformationHospitalRequest,
  );

  Future<List<DoctorProfileHospitalResponse>> getDoctorInformationHospital(
      String hospitalId);

  Future<DoctorProfileHospitalResponse> postDoctorInformationHospital(
    DoctorProfileHospitalRequest doctorInformationHospitalRequest,
  );

  Future<AdditionalInformationSectionResponse> getAdditionalInformationHospital(
      String hospitalId);

  Future<AdditionalInformationSectionResponse>
      postAdditionalInformationHospital(
    AdditionalInformationSectionRequest additionalInformationHospitalRequest,
  );

  Future<PaymentOptionHospitalResponse> getPaymentOptionHospital(
      String hospitalId);

  Future<PaymentOptionHospitalResponse> postPaymentOptionHospital(
    PaymentOptionHospitalRequest paymentOptionHospitalRequest,
  );

  Future<List<SupportLanguageHospitalResponse>> getSupportLanguageHospital(
      String hospitalId);

  Future<SupportLanguageHospitalResponse> postSupportLanguageHospital(
    SupportLanguageHospitalRequest supportLanguageHospitalRequest,
  );

  Future<HowToRequestHospitalResponse> getHowToRequestHospital(
      String hospitalId);

  Future<HowToRequestHospitalResponse> postHowToRequestHospital(
    HowToRequestHospitalRequest howToRequestHospitalRequest,
  );

  Future<List<NewRegistrationHospitalResponse>> getNewRegistrationHospital({
    required String hospitalId,
    String? classification,
    String? search,
  });

  Future<NewRegistrationHospitalResponse> postNewRegistrationHospital(
    NewRegistrationHospitalRequest newRegistrationHospitalRequest,
  );

  Future<ListSectionQAndAHospitalResponse> getListSectionQAndAHospital(
      String hospitalId);

  Future<List<MaterialHospitalResponse>> getMaterialHospital(String hospitalId);

  Future<MaterialHospitalResponse> postMaterialHospital(
    MaterialHospitalRequest materialHospitalRequest,
  );

  Future<MemoMaterialHospitalResponse> getMemoMaterialHospital(
      String hospitalId);

  Future<MemoMaterialHospitalResponse> postMemoMaterialHospital(
    MemoMaterialHospitalRequest memoMaterialHospitalRequest,
  );

  Future<PatientSectionHospitalResponse> getWebReservationPatient(
    String hospitalId,
  );

  Future<MedicalInstitutionSectionHospitalResponse>
      getMedicalInstitutionSection(
    String hospitalId,
  );

  Future<List<BasicInformationHospitalResponse>> getHospitals({
    int? page,
    int? pageSize,
  });

  Future<List<FacilityResponse>> getFacilityPhoto({required String id});

  Future<FacilityResponse> postFacilityPhoto(
    FacilityRequest facilityRequest,
  );

  Future<List<DocumentResponse>> getDocument({required String id});

  Future<DocumentResponse> postDocument(
    DocumentRequest documentRequest,
  );

  Future<List<HealthResponse>> getHealth({required String id});

  Future<HealthResponse> postHealth(
    HealthRequest headInfoRequest,
  );

  Future<List<ContractResponse>> getContract({required String id});

  Future<ContractResponse> postContract(
    ContractRequest contractRequest,
  );

  Future<void> deleteHealth({required String id});

  Future<List<TreatmentMenuResponse>> getTreatmentMenu({required String id});

  Future<TreatmentMenuResponse> postTreatmentMenu(
      TreatmentMenuRequest treatmentMenuRequest);

  Future<List<TreatmentTeleMenuResponse>> getTreatmentTeleMenu(
      {required String id});

  Future<TreatmentTeleMenuResponse> postTreatmentTeleMenu(
      TreatmentTeleMenuRequest treatmentTeleMenuRequest);

  Future<TreatmentMenuResponse> putTreatmentMenu(
      String id, TreatmentMenuRequest treatmentMenuRequest);

  Future<TreatmentTeleMenuResponse> putTreatmentTeleMenu(
      String id, TreatmentTeleMenuRequest treatmentTeleMenuRequest);

  Future<void> deleteNewRegistrationHospital(String id);

  Future<void> deleteMaterialHospital(String id);

  Future<void> deleteContract(String id);

  Future<void> deleteDocument(String id);

  Future<void> deleteFacilityPhoto(String id);


  // web booking v2

  Future<BasicInformationHospitalResponse> webBookingGetHospitalById(String id);

  Future<List<BasicInformationHospitalResponse>> webBookingSearchHospital(
      {String? search});

  Future<List<DoctorProfileHospitalResponse>> getDoctorsByHospitalId(
      String hospitalId);

  Future<Patient> webBookingGetPatientById(String id);

  Future<List<Patient>> webBookingSearchPatients({String? search});

  Future<TreamentResponce> getBookingByPatientId(String patientId);

  Future<List<WebBookingMedicalRecordResponse>> webBookingGetReservationAll({
    String? hospitalName,
    String? doctor_name,
    DateTime? reservation_date_from,
    DateTime? reservation_date_to,
    bool? inquiryInProgress,
    bool? reservationConfirmed,
    String? hospitalId,
    String? patientId,
  });

  Future<WebBookingMedicalRecordResponse> webBookingGetReservationById(
      String id);

  Future<WebBookingMedicalRecordResponse> webBookingPostReservation(
      WebBookingMedicalRecordRequest request);

  Future<WebBookingMedicalRecordResponse> webBookingPutReservation(
      String reservationId, WebBookingMedicalRecordRequest request);

  Future<void> webBookingDeleteReservation(String reservationId);

  Future<TreamentResponce> updateBooking(String treatmentId, TreamentRequest treatmentRequest);

}

