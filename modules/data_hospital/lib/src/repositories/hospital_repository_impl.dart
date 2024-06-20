import 'package:core_network/core_network.dart';
import 'package:injectable/injectable.dart';

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
  Future<NewRegistrationHospitalResponse> getNewRegistrationHospital(
      String hospitalId) {
    return remote.getNewRegistrationHospital(hospitalId);
  }

  @override
  Future<ListSectionQAndAHospitalResponse> getListSectionQAndAHospital(
      String hospitalId) {
    return remote.getListSectionQAndAHospital(hospitalId);
  }

  @override
  Future<MaterialHospitalResponse> getMaterialHospital(String hospitalId) {
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
  Future<List<BasicInformationHospitalResponse>> getHospitals() {
    return remote.getHospitals();
  }
}
