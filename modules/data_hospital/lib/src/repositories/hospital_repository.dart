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

  Future<List<BasicInformationHospitalResponse>> getHospitals();

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
}
