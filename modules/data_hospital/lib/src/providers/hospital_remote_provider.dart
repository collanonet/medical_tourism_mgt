import 'package:core_network/core_network.dart';
import 'package:core_network/entities.dart';
import 'package:injectable/injectable.dart';

@injectable
class HospitalRemoteProvider {
  HospitalRemoteProvider({
    required this.apiService,
  });

  final ApiService apiService;

  /// Get basic information of hospital C3 Page

  Future<BasicInformationHospitalResponse> getBasicInformationHospital(
    String hospitalId,
  ) {
    return apiService.getBasicInformationHospital(hospitalId);
  }

  Future<BasicInformationHospitalResponse> postBasicInformationHospital(
    BasicInformationHospitalRequest basicInformationHospitalRequest,
  ) {
    return apiService
        .postBasicInformationHospital(basicInformationHospitalRequest);
  }

  Future<List<MedicalRecordBasicInfoHospitalResponse>>
      getMedicalRecordBasicInfoHospital(String hospitalId) {
    return apiService.getMedicalRecordBasicInfoHospital(hospitalId);
  }

  Future<MedicalRecordBasicInfoHospitalResponse>
      postMedicalRecordBasicInfoHospital(
    MedicalRecordBasicInfoHospitalRequest basicInformationHospitalRequest,
  ) {
    return apiService
        .postMedicalRecordBasicInfoHospital(basicInformationHospitalRequest);
  }

  Future<DoctorProfileHospitalResponse> postDoctorInformationHospital(
    DoctorProfileHospitalRequest doctorInformationHospitalRequest,
  ) {
    return apiService
        .postDoctorInformationHospital(doctorInformationHospitalRequest);
  }

  Future<List<DoctorProfileHospitalResponse>> getDoctorInformationHospital(
      String hospitalId) {
    return apiService.getDoctorInformationHospital(hospitalId);
  }

  Future<AdditionalInformationSectionResponse>
      postAdditionalInformationHospital(
    AdditionalInformationSectionRequest additionalInformationHospitalRequest,
  ) {
    return apiService.postAdditionalInformationHospital(
        additionalInformationHospitalRequest);
  }

  Future<AdditionalInformationSectionResponse> getAdditionalInformationHospital(
      String hospitalId) {
    return apiService.getAdditionalInformationHospital(hospitalId);
  }

  Future<PaymentOptionHospitalResponse> postPaymentOptionHospital(
    PaymentOptionHospitalRequest paymentOptionHospitalRequest,
  ) {
    return apiService.postPaymentOptionHospital(paymentOptionHospitalRequest);
  }

  Future<PaymentOptionHospitalResponse> getPaymentOptionHospital(
      String hospitalId) {
    return apiService.getPaymentOptionHospital(hospitalId);
  }

  Future<SupportLanguageHospitalResponse> postSupportLanguageHospital(
    SupportLanguageHospitalRequest supportLanguageHospitalRequest,
  ) {
    return apiService
        .postSupportLanguageHospital(supportLanguageHospitalRequest);
  }

  Future<List<SupportLanguageHospitalResponse>> getSupportLanguageHospital(
      String hospitalId) {
    return apiService.getSupportLanguageHospital(hospitalId);
  }

  Future<HowToRequestHospitalResponse> getHowToMakeRequestHospital(
      String hospitalId) {
    return apiService.getHowToRequestHospital(hospitalId);
  }

  Future<HowToRequestHospitalResponse> postHowToMakeRequestHospital(
    HowToRequestHospitalRequest howToRequestHospitalRequest,
  ) {
    return apiService.postHowToRequestHospital(howToRequestHospitalRequest);
  }

  Future<NewRegistrationHospitalResponse> getNewRegistrationHospital(
      String hospitalId) {
    return apiService.getNewRegistrationHospital(hospitalId);
  }

  Future<ListSectionQAndAHospitalResponse> getListSectionQAndAHospital(
      String hospitalId) {
    return apiService.getListSectionQAndAHospital(hospitalId);
  }

  Future<MaterialHospitalResponse> getMaterialHospital(String hospitalId) {
    return apiService.getMaterialHospital(hospitalId);
  }

  Future<MaterialHospitalResponse> postMaterialHospital(
    MaterialHospitalRequest materialHospitalRequest,
  ) {
    return apiService.postMaterialHospital(materialHospitalRequest);
  }

  Future<PatientSectionHospitalResponse> getWebReservationPatient(
    String hospitalId,
  ) {
    return apiService.getPatientSectionHospital(hospitalId);
  }

  Future<MedicalInstitutionSectionHospitalResponse>
      getMedicalInstitutionSection(
    String hospitalId,
  ) {
    return apiService.getMedicalInstitutionSectionHospital(hospitalId);
  }

  Future<List<BasicInformationHospitalResponse>> getHospitals() {
    return apiService.getHospitals();
  }

  Future<List<FacilityResponse>> getFacilityPhoto(){
    return apiService.getFacilityPhoto();
  }

  Future<FacilityResponse> postFacilityPhoto(FacilityRequest facilityRequest){
    return apiService.postFacilityPhoto(facilityRequest);
  }

  Future<List<DocumentResponse>> getDocument(){
    return apiService.getDocument();
  }

  Future<DocumentResponse> postDocument(DocumentRequest documentRequest){
    return apiService.postDocument(documentRequest);
  }

  Future<List<HealthResponse>> getHealth(){
    return apiService.getHealthCheckup();
  }

  Future<HealthResponse> postHealth(HealthRequest healthRequest){
    return apiService.postHealthCheckup(healthRequest);
  }

  Future<List<ContractResponse>> getContract(){
    return apiService.getContract();
  }

  Future<ContractResponse> postContract(ContractRequest contractRequest){
    return apiService.postContract(contractRequest);
  }

   Future<FileResponse> uploadFileBase64(
    String file,
    String filename) {
      return apiService.uploadFileBase64(file, filename);
    }
  /// end get basic information of hospital C3 Page
}
