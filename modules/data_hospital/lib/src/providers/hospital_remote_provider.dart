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

  Future<List<NewRegistrationHospitalResponse>> getNewRegistrationHospital({
    required String hospitalId,
    String? classification,
    String? search,
  }) {
    return apiService.getNewRegistrationHospital(
      hospitalId: hospitalId,
      classification: classification,
      search: search,
    );
  }

  Future<NewRegistrationHospitalResponse> postNewRegistrationHospital(
      NewRegistrationHospitalRequest newRegistrationHospitalRequest) {
    return apiService
        .postNewRegistrationHospital(newRegistrationHospitalRequest);
  }

  Future<ListSectionQAndAHospitalResponse> getListSectionQAndAHospital(
      String hospitalId) {
    return apiService.getListSectionQAndAHospital(hospitalId);
  }

  Future<List<MaterialHospitalResponse>> getMaterialHospital(
      String hospitalId) {
    return apiService.getMaterialHospital(hospitalId: hospitalId);
  }

  Future<MaterialHospitalResponse> postMaterialHospital(
    MaterialHospitalRequest materialHospitalRequest,
  ) {
    return apiService.postMaterialHospital(materialHospitalRequest);
  }

  Future<MemoMaterialHospitalResponse> getMemoMaterialHospital(
      String hospitalId) {
    return apiService.getMemoMaterialHospital(hospitalId: hospitalId);
  }

  Future<MemoMaterialHospitalResponse> postMemoMaterialHospital(
    MemoMaterialHospitalRequest memoMaterialHospitalRequest,
  ) {
    return apiService.postMemoMaterialHospital(memoMaterialHospitalRequest);
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

  Future<List<FacilityResponse>> getFacilityPhoto({required String id}) {
    return apiService.getFacilityPhoto(id: id);
  }

  Future<FacilityResponse> postFacilityPhoto(FacilityRequest facilityRequest) {
    return apiService.postFacilityPhoto(facilityRequest);
  }

  Future<List<DocumentResponse>> getDocument({required String id}) {
    return apiService.getDocument(id: id);
  }

  Future<DocumentResponse> postDocument(DocumentRequest documentRequest) {
    return apiService.postDocument(documentRequest);
  }

  Future<List<HealthResponse>> getHealth({required String id}) {
    return apiService.getHealthCheckup(id: id);
  }

  Future<HealthResponse> postHealth(HealthRequest healthRequest) {
    return apiService.postHealthCheckup(healthRequest);
  }

  Future<List<ContractResponse>> getContract({required String id}) {
    return apiService.getContract(id: id);
  }

  Future<ContractResponse> postContract(ContractRequest contractRequest) {
    return apiService.postContract(contractRequest);
  }

  Future<FileResponse> uploadFileBase64(String file, String filename) {
    return apiService.uploadFileBase64(file, filename);
  }

  Future<void> deleteHealth({required String id}) {
    return apiService.deleteHealth(id: id);
  }

  Future<List<TreatmentMenuResponse>> getTreatmentMenu({required String id}) {
    return apiService.getTreatmentMenu(id: id);
  }

  Future<TreatmentMenuResponse> postTreatmentMenu(
    TreatmentMenuRequest treatmentMenuRequest,
  ) {
    return apiService.postTreatmentMenu(treatmentMenuRequest);
  }

  Future<TreatmentMenuResponse> putTreatmentMenu(
      String id, TreatmentMenuRequest treatmentMenuRequest) {
    return apiService.putTreatmentMenu(
        id: id, treatmentMenuRequest: treatmentMenuRequest);
  }

  Future<List<TreatmentTeleMenuResponse>> getTreatmentTeleMenu(
      {required String id}) {
    return apiService.getTreatmentTeleMenu(id: id);
  }

  Future<TreatmentTeleMenuResponse> postTreatmentTeleMenu(
    TreatmentTeleMenuRequest treatmentTeleMenuRequest,
  ) {
    return apiService.postTreatmentTeleMenu(treatmentTeleMenuRequest);
  }

  Future<TreatmentTeleMenuResponse> putTreatmentTeleMenu(
      String id, TreatmentTeleMenuRequest treatmentTeleMenuRequest) {
    return apiService.putTreatmentTeleMenu(
        id: id, treatmentTeleMenuRequest: treatmentTeleMenuRequest);
  }

  Future<void> deleteNewRegistrationHospital(String id) {
    return apiService.deleteNewRegistrationHospital(id);
  }

  Future<void> deleteMaterialHospital(String id) {
    return apiService.deleteMaterialHospital(id);
  }

  Future<void> deleteContract(String id) {
    return apiService.deleteContract(id: id);
  }
}
