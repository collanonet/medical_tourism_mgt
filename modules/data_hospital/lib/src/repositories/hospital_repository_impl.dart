// Package imports:
import 'package:core_network/entities.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import '../providers/hospital_local_provider.dart';
import '../providers/hospital_remote_provider.dart';
import 'hospital_repository.dart';

@Injectable(as: HospitalRepository)
class HospitalRepositoryIml extends HospitalRepository {
  HospitalRepositoryIml({
    required this.remote,
    required this.local,
  });

  final HospitalRemoteProvider remote;
  final HospitalLocalProvider local;

  @override
  Future<BasicInformationHospitalResponse> getBasicInformationHospital(
      String hospitalId) {
    return remote.getBasicInformationHospital(hospitalId);
  }

  @override
  Future<BasicInformationHospitalResponse> postBasicInformationHospital(
      BasicInformationHospitalRequest basicInformationHospitalRequest) {
    return remote.postBasicInformationHospital(basicInformationHospitalRequest);
  }

  @override
  Future<AdditionalInformationSectionResponse> getAdditionalInformationHospital(
      String hospitalId) {
    return remote.getAdditionalInformationHospital(hospitalId);
  }

  @override
  Future<List<DoctorProfileHospitalResponse>> getDoctorInformationHospital(
      String hospitalId) {
    return remote.getDoctorInformationHospital(hospitalId);
  }

  @override
  Future<PaymentOptionHospitalResponse> getPaymentOptionHospital(
      String hospitalId) {
    return remote.getPaymentOptionHospital(hospitalId);
  }

  @override
  Future<List<SupportLanguageHospitalResponse>> getSupportLanguageHospital(
      String hospitalId) {
    return remote.getSupportLanguageHospital(hospitalId);
  }

  @override
  Future<List<MedicalRecordBasicInfoHospitalResponse>>
      getMedicalRecordBasicInfoHospital(String hospitalId) {
    return remote.getMedicalRecordBasicInfoHospital(hospitalId);
  }

  @override
  Future<AdditionalInformationSectionResponse>
      postAdditionalInformationHospital(
          AdditionalInformationSectionRequest
              additionalInformationHospitalRequest) {
    return remote.postAdditionalInformationHospital(
        additionalInformationHospitalRequest);
  }

  @override
  Future<DoctorProfileHospitalResponse> postDoctorInformationHospital(
      DoctorProfileHospitalRequest doctorInformationHospitalRequest) {
    return remote
        .postDoctorInformationHospital(doctorInformationHospitalRequest);
  }

  @override
  Future<MedicalRecordBasicInfoHospitalResponse>
      postMedicalRecordBasicInfoHospital(
          MedicalRecordBasicInfoHospitalRequest
              basicInformationHospitalRequest) {
    return remote
        .postMedicalRecordBasicInfoHospital(basicInformationHospitalRequest);
  }

  @override
  Future<PaymentOptionHospitalResponse> postPaymentOptionHospital(
      PaymentOptionHospitalRequest paymentOptionHospitalRequest) {
    return remote.postPaymentOptionHospital(paymentOptionHospitalRequest);
  }

  @override
  Future<SupportLanguageHospitalResponse> postSupportLanguageHospital(
      SupportLanguageHospitalRequest supportLanguageHospitalRequest) {
    return remote.postSupportLanguageHospital(supportLanguageHospitalRequest);
  }

  @override
  Future<HowToRequestHospitalResponse> getHowToRequestHospital(
      String hospitalId) {
    return remote.getHowToMakeRequestHospital(hospitalId);
  }

  @override
  Future<HowToRequestHospitalResponse> postHowToRequestHospital(
      HowToRequestHospitalRequest howToRequestHospitalRequest) {
    return remote.postHowToMakeRequestHospital(howToRequestHospitalRequest);
  }

  @override
  Future<List<NewRegistrationHospitalResponse>> getNewRegistrationHospital({
    required String hospitalId,
    String? classification,
    String? search,
  }) {
    return remote.getNewRegistrationHospital(
      hospitalId: hospitalId,
      classification: classification,
      search: search,
    );
  }

  @override
  Future<ListSectionQAndAHospitalResponse> getListSectionQAndAHospital(
      String hospitalId) {
    return remote.getListSectionQAndAHospital(hospitalId);
  }

  @override
  Future<List<MaterialHospitalResponse>> getMaterialHospital(
      String hospitalId) {
    return remote.getMaterialHospital(hospitalId);
  }

  @override
  Future<MaterialHospitalResponse> postMaterialHospital(
      MaterialHospitalRequest materialHospitalRequest) {
    return remote.postMaterialHospital(materialHospitalRequest);
  }

  @override
  Future<PatientSectionHospitalResponse> getWebReservationPatient(
      String hospitalId) {
    return remote.getWebReservationPatient(
      hospitalId,
    );
  }

  @override
  Future<MedicalInstitutionSectionHospitalResponse>
      getMedicalInstitutionSection(
    String hospitalId,
  ) {
    return remote.getMedicalInstitutionSection(
      hospitalId,
    );
  }

  @override
  Future<List<BasicInformationHospitalResponse>> getHospitals({
    int? page,
    int? pageSize,
  }) {
    return remote.getHospitals(
      page: page,
      pageSize: pageSize,
    );
  }

  @override
  Future<FileResponse> uploadFileBase64(String file, String filename) {
    return remote.uploadFileBase64(file, filename);
  }

  @override
  Future<List<FacilityResponse>> getFacilityPhoto({required String id}) {
    return remote.getFacilityPhoto(id: id);
  }

  @override
  Future<FacilityResponse> postFacilityPhoto(FacilityRequest facilityRequest) {
    return remote.postFacilityPhoto(facilityRequest);
  }

  @override
  Future<List<DocumentResponse>> getDocument({required String id}) {
    return remote.getDocument(id: id);
  }

  @override
  Future<DocumentResponse> postDocument(DocumentRequest documentRequest) {
    return remote.postDocument(documentRequest);
  }

  @override
  Future<List<HealthResponse>> getHealth({required String id}) {
    return remote.getHealth(id: id);
  }

  @override
  Future<HealthResponse> postHealth(HealthRequest healthRequest) {
    return remote.postHealth(healthRequest);
  }

  @override
  Future<List<ContractResponse>> getContract({required String id}) {
    return remote.getContract(id: id);
  }

  @override
  Future<ContractResponse> postContract(ContractRequest contractRequest) {
    return remote.postContract(contractRequest);
  }

  @override
  Future<MemoMaterialHospitalResponse> getMemoMaterialHospital(
      String hospitalId) {
    return remote.getMemoMaterialHospital(hospitalId);
  }

  @override
  Future<MemoMaterialHospitalResponse> postMemoMaterialHospital(
      MemoMaterialHospitalRequest memoMaterialHospitalRequest) {
    return remote.postMemoMaterialHospital(memoMaterialHospitalRequest);
  }

  @override
  Future<void> deleteHealth({required String id}) {
    return remote.deleteHealth(id: id);
  }

  @override
  Future<NewRegistrationHospitalResponse> postNewRegistrationHospital(
      NewRegistrationHospitalRequest newRegistrationHospitalRequest) {
    return remote.postNewRegistrationHospital(newRegistrationHospitalRequest);
  }

  @override
  Future<List<TreatmentMenuResponse>> getTreatmentMenu({required String id}) {
    return remote.getTreatmentMenu(id: id);
  }

  @override
  Future<List<TreatmentTeleMenuResponse>> getTreatmentTeleMenu(
      {required String id}) {
    return remote.getTreatmentTeleMenu(id: id);
  }

  @override
  Future<TreatmentMenuResponse> postTreatmentMenu(
      TreatmentMenuRequest treatmentMenuRequest) {
    return remote.postTreatmentMenu(treatmentMenuRequest);
  }

  @override
  Future<TreatmentTeleMenuResponse> postTreatmentTeleMenu(
      TreatmentTeleMenuRequest treatmentTeleMenuRequest) {
    return remote.postTreatmentTeleMenu(treatmentTeleMenuRequest);
  }

  @override
  Future<TreatmentMenuResponse> putTreatmentMenu(
      String id, TreatmentMenuRequest treatmentMenuRequest) {
    return remote.putTreatmentMenu(id, treatmentMenuRequest);
  }

  @override
  Future<TreatmentTeleMenuResponse> putTreatmentTeleMenu(
      String id, TreatmentTeleMenuRequest treatmentTeleMenuRequest) {
    return remote.putTreatmentTeleMenu(id, treatmentTeleMenuRequest);
  }

  @override
  Future<void> deleteNewRegistrationHospital(String id) {
    return remote.deleteNewRegistrationHospital(id);
  }

  @override
  Future<void> deleteContract(String id) {
    return remote.deleteContract(id);
  }

  @override
  Future<void> deleteMaterialHospital(String id) {
    return remote.deleteMaterialHospital(id);
  }

  @override
  Future<void> deleteDocument(String id) {
    return remote.deleteDocument(id);
  }

  @override
  Future<void> deleteFacilityPhoto(String id) {
    return remote.deleteFacilityPhoto(id);
  }


  // web booking v2

  @override
  Future<TreamentResponce> getBookingByPatientId(String patientId) {
    return remote.getBookingByPatientId(patientId);
  }

  @override
  Future<List<DoctorProfileHospitalResponse>> getDoctorsByHospitalId(
      String hospitalId) {
    return remote.getDoctorsByHospitalId(hospitalId);
  }

  @override
  Future<void> webBookingDeleteReservation(String reservationId) {
    return remote.webBookingDeleteReservation(reservationId);
  }

  @override
  Future<BasicInformationHospitalResponse> webBookingGetHospitalById(
      String id) {
    return remote.webBookingGetHospitalById(id);
  }

  @override
  Future<Patient> webBookingGetPatientById(String id) {
    return remote.webBookingGetPatientById(id);
  }

  @override
  Future<List<WebBookingMedicalRecordResponse>> webBookingGetReservationAll({
    String? hospitalName,
    String? doctor_name,
    DateTime? reservation_date_from,
    DateTime? reservation_date_to,
    bool? inquiryInProgress,
    bool? reservationConfirmed,
    String? hospitalId,
    String? patientId,
  }) {
    return remote.webBookingGetReservationAll(
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

  @override
  Future<WebBookingMedicalRecordResponse> webBookingGetReservationById(
      String id) {
    return remote.webBookingGetReservationById(id);
  }

  @override
  Future<WebBookingMedicalRecordResponse> webBookingPostReservation(
      WebBookingMedicalRecordRequest request) {
    return remote.webBookingPostReservation(request);
  }

  @override
  Future<WebBookingMedicalRecordResponse> webBookingPutReservation(
      String reservationId, WebBookingMedicalRecordRequest request) {
    return remote.webBookingPutReservation(reservationId, request);
  }

  @override
  Future<List<BasicInformationHospitalResponse>> webBookingSearchHospital(
      {String? search}) {
    return remote.webBookingSearchHospital(search: search);
  }

  @override
  Future<List<Patient>> webBookingSearchPatients({String? search}) {
    return remote.webBookingSearchPatients(search: search);
  }

  @override
  Future<TreamentResponce> updateBooking(String treatmentId, TreamentRequest treatmentRequest) {
    return remote.updateBooking(treatmentId, treatmentRequest);
  }

  @override
  Future<void> deleteTreatmentTeleMenu(String value) {
    return remote.deleteTreatmentTeleMenu(value);
  }
}
