import 'package:core_network/core_network.dart';

abstract class HospitalRepository {
  /// Get basic information of hospital C3 Page

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

  Future<NewRegistrationHospitalResponse> getNewRegistrationHospital(
      String hospitalId);

  Future<ListSectionQAndAHospitalResponse> getListSectionQAndAHospital(
      String hospitalId);

  Future<MaterialHospitalResponse> getMaterialHospital(String hospitalId);

  Future<MaterialHospitalResponse> postMaterialHospital(
    MaterialHospitalRequest materialHospitalRequest,
  );

  Future<PatientSectionHospitalResponse> getWebReservationPatient(
    String hospitalId,
  );

  Future<MedicalInstitutionSectionHospitalResponse>
      getMedicalInstitutionSection(
    String hospitalId,
  );

  Future<List<BasicInformationHospitalResponse>> getHospitals();

  /// end get basic information of hospital C3 Page
}
