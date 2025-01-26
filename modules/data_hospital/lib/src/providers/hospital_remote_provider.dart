// Package imports:
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

  Future<void> deleteDoctorInformationHospital(String id) {
    return apiService.deleteDoctorInformationHospital(id);
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

  Future<NewRegistrationHospitalResponse> putNewRegistrationHospital(String id,
      NewRegistrationHospitalRequest newRegistrationHospitalRequest) {
    return apiService.putNewRegistrationHospital(
        id, newRegistrationHospitalRequest);
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

  Future<MemoMaterialHospitalResponse> putMemoMaterialHospital(
    String id,
    MemoMaterialHospitalRequest memoMaterialHospitalRequest,
  ) {
    return apiService.putMemoMaterialHospital(id, memoMaterialHospitalRequest);
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

  Future<List<BasicInformationHospitalResponse>> getHospitals({
    int? page,
    int? pageSize,
    String? hospitalNameChinese,
    String? hospitalNameKatakana,
    bool? healthCheckup,
    bool? treatment,
    bool? heavyIonBeam,
    bool? protonBeam,
    bool? regenerativeMedicine,
    bool? beauty,
    String? location,
    String? rHave,
    bool? universityHospitalType,
    bool? nationalAndPublicHospitalsType,
    bool? privateHospitalType,
    bool? clinicType,
  }) {
    return apiService.getHospitals(
      page: page,
      pageSize: pageSize,
      hospitalNameChinese: hospitalNameChinese,
      hospitalNameKatakana: hospitalNameKatakana,
      healthCheckup: healthCheckup,
      treatment: treatment,
      heavyIonBeam: heavyIonBeam,
      protonBeam: protonBeam,
      regenerativeMedicine: regenerativeMedicine,
      beauty: beauty,
      location: location,
      rHave: rHave,
      universityHospitalType: universityHospitalType,
      nationalAndPublicHospitalsType: nationalAndPublicHospitalsType,
      privateHospitalType: privateHospitalType,
      clinicType: clinicType,
    );
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

  Future<void> deleteDocument(String id) {
    return apiService.deleteDocument(id: id);
  }

  Future<void> deleteFacilityPhoto(String id) {
    return apiService.deleteFacilityPhoto(id);
  }

  // web booking v2

  Future<BasicInformationHospitalResponse> webBookingGetHospitalById(
      String id) async {
    return apiService.webBookingGetHospitalById(id);
  }

  Future<List<BasicInformationHospitalResponse>> webBookingSearchHospital(
      {String? search}) async {
    return apiService.webBookingSearchHospital(search: search);
  }

  Future<List<DoctorProfileHospitalResponse>> getDoctorsByHospitalId(
      String hospitalId) async {
    return apiService.getDoctorsByHospitalId(hospitalId);
  }

  Future<Patient> webBookingGetPatientById(String id) async {
    return apiService.webBookingGetPatientById(id);
  }

  Future<List<Patient>> webBookingSearchPatients({String? search}) async {
    return apiService.webBookingSearchPatients(search: search);
  }

  Future<TreamentResponce> getBookingByPatientId(String patientId) async {
    return apiService.getBookingByPatientId(patientId);
  }

  Future<List<WebBookingMedicalRecordResponse>> webBookingGetReservationAll({
    String? hospitalName,
    String? doctor_name,
    DateTime? reservation_date_from,
    DateTime? reservation_date_to,
    bool? inquiryInProgress,
    bool? reservationConfirmed,
    String? hospitalId,
    String? patientId,
  }) async {
    return apiService.webBookingGetReservationAll(
      hospitalName: hospitalName,
      doctor_name: doctor_name,
      reservation_date_from: reservation_date_from,
      reservation_date_to: reservation_date_to,
      inquiryInProgress: inquiryInProgress,
      reservationConfirmed: reservationConfirmed,
      hospitalId: hospitalId,
      patientId: patientId,
    );
  }

  Future<WebBookingMedicalRecordResponse> webBookingGetReservationById(
      String id) async {
    return apiService.webBookingGetReservationById(id);
  }

  Future<WebBookingMedicalRecordResponse> webBookingPostReservation(
      WebBookingMedicalRecordRequest request) async {
    return apiService.webBookingPostReservation(request);
  }

  Future<WebBookingMedicalRecordResponse> webBookingPutReservation(
      String reservationId, WebBookingMedicalRecordRequest request) async {
    return apiService.webBookingPutReservation(reservationId, request);
  }

  Future<void> webBookingDeleteReservation(String reservationId) async {
    return apiService.webBookingDeleteReservation(reservationId);
  }

  Future<TreamentResponce> updateBooking(
      String treatmentId, TreamentRequest treatmentRequest) {
    return apiService.updateBooking(treatmentId, treatmentRequest);
  }

  Future<void> deleteTreatmentTeleMenu(String id) {
    return apiService.deleteTreatmentTeleMenu(id: id);
  }

  Future<void> deleteBasicInformationHospital(String id) {
    return apiService.deleteBasicInformationHospital(id);
  }

  Future<void> deleteMedicalRecordBasicInfoHospital(String id) {
    return apiService.deleteMedicalRecordBasicInfoHospital(id);
  }
}
