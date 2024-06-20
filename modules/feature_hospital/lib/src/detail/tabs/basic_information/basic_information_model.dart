import 'package:core_network/core_network.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_hospital/data_hospital.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

@injectable
class BasicInformationModel {
  BasicInformationModel({
    required this.hospitalRepository,
  });

  final HospitalRepository hospitalRepository;

  // todo: value data repsonse as valuenotifier
  ValueNotifier<AsyncData<BasicInformationHospitalResponse>>
      basicInformationData = ValueNotifier(const AsyncData());

  ValueNotifier<AsyncData<HowToRequestHospitalResponse>>
      howToMakeRequestHospitalData = ValueNotifier(const AsyncData());

  ValueNotifier<AsyncData<List<DoctorProfileHospitalResponse>>>
      doctorInformationData = ValueNotifier(const AsyncData());

  ValueNotifier<AsyncData<List<MedicalRecordBasicInfoHospitalResponse>>>
      medicalRecordBasicInfoData = ValueNotifier(const AsyncData());

  ValueNotifier<AsyncData<AdditionalInformationSectionResponse>>
      additionalInformationData = ValueNotifier(const AsyncData());

  ValueNotifier<AsyncData<PaymentOptionHospitalResponse>> paymentOptionData =
      ValueNotifier(const AsyncData());

  ValueNotifier<AsyncData<List<SupportLanguageHospitalResponse>>>
      supportLangaugeData = ValueNotifier(const AsyncData());

  Future<void> fetchData(FormGroup formGroup, {String? hospitalId}) async {
    try {
      if (hospitalId != null) {
        await fetchBasicInformation(
            formGroup.control('basicInformation') as FormGroup, hospitalId);
        await fetchMedicalRecordBasicInfoHospital(
          hospitalId: hospitalId,
          formArray: formGroup.control('medicalRecordHospitals') as FormArray,
        );
        await fetchDoctorInformation(
            formGroup.control('addDoctorProfile') as FormArray, hospitalId);
        await fetchAdditionalInformation(
            formGroup.control('additionalInformationSection') as FormGroup,
            hospitalId);
        await fetchPaymentOption(
            formGroup.control('paymentOptionSection') as FormGroup, hospitalId);
        await fetchSupportLanguage(
            formGroup.control('supportLanguageSection') as FormArray,
            hospitalId);
        await fetchHowToMakeRequest(
            formGroup.control('howToMakeRequest') as FormGroup, hospitalId);
        // section 7th
      }
    } catch (e) {
      // todo: implement error handling
    }
  }

  Future<void> fetchHowToMakeRequest(
      FormGroup formGroup, String hospitalId) async {
    try {
      howToMakeRequestHospitalData.value = const AsyncData(loading: true);
      final result =
          await hospitalRepository.getHowToRequestHospital(hospitalId);
      howToMakeRequestHospitalData.value = AsyncData(data: result);
      insertDataHowToMakeRequest(formGroup, result);
    } catch (e) {
      logger.d(e);
      howToMakeRequestHospitalData.value = AsyncData(error: e);
    }
  }

  void insertDataHowToMakeRequest(
      FormGroup formGroup, HowToRequestHospitalResponse data) {
    formGroup.control('howToMakeRequest').patchValue({
      'dateOfUpdate': data.dateOfUpdate,
      'updater': data.updater,
      'memo': data.memo,
      'updates': data.updates,
    });
  }

  Future<void> fetchBasicInformation(
      FormGroup formGroup, String hospitalId) async {
    try {
      basicInformationData.value = const AsyncData(loading: true);
      final result =
          await hospitalRepository.getBasicInformationHospital(hospitalId);
      basicInformationData.value = AsyncData(data: result);
      insertDataBasicInformation(formGroup, result);
    } catch (e) {
      logger.d(e);
      basicInformationData.value = AsyncData(error: e);
    }
  }

  void insertDataBasicInformation(
    FormGroup formGroup,
    BasicInformationHospitalResponse data,
  ) {
    formGroup.patchValue(data.toJson());
  }

  Future<void> fetchMedicalRecordBasicInfoHospital({
    required String hospitalId,
    required FormArray formArray,
  }) async {
    try {
      medicalRecordBasicInfoData.value = const AsyncData(loading: true);
      final result = await hospitalRepository
          .getMedicalRecordBasicInfoHospital(hospitalId);
      medicalRecordBasicInfoData.value = AsyncData(data: result);
      insertDataMedicalRecordBasicInfo(formArray, result);
    } catch (e) {
      logger.d(e);
      medicalRecordBasicInfoData.value = AsyncData(error: e);
    }
  }

  void insertDataMedicalRecordBasicInfo(
    FormArray formArray,
    List<MedicalRecordBasicInfoHospitalResponse> data,
  ) {
    if (data.isNotEmpty) {
      formArray.clear();

      for (var item in data) {
        formArray.add(
          FormGroup({
            '_id': FormControl<String>(value: item.id),
            'hospital': FormControl<String>(value: item.hospital),
            'dateOfUpdate': FormControl<DateTime>(value: item.dateOfUpdate),
            'departmentName': FormControl<String>(value: item.departmentName),
            'nameKanji': FormControl<String>(value: item.nameKanji),
            'nameKana': FormControl<String>(value: item.nameKana),
            'telephoneNumber': FormControl<String>(value: item.telephoneNumber),
            'email': FormControl<String>(value: item.email),
            'faxNumber': FormControl<String>(value: item.faxNumber),
          }),
        );
      }
    }
  }

  Future<void> fetchDoctorInformation(
      FormArray formArray, String hospitalId) async {
    try {
      doctorInformationData.value = const AsyncData(loading: true);
      final result =
          await hospitalRepository.getDoctorInformationHospital(hospitalId);
      doctorInformationData.value = AsyncData(data: result);
      insertDataDoctorInformation(formArray, result);
    } catch (e) {
      logger.d(e);
      doctorInformationData.value = AsyncData(error: e);
    }
  }

  void insertDataDoctorInformation(
      FormArray formArray, List<DoctorProfileHospitalResponse> data) {
    if (data.isNotEmpty) {
      formArray.clear();

      for (var item in data) {
        FormArray affiliatedAcademicSociety = FormArray([]);
        if (item.affiliatedAcademicSociety != null &&
            item.affiliatedAcademicSociety!.isNotEmpty) {
          item.affiliatedAcademicSociety!.map((e) {
            affiliatedAcademicSociety.add(
              FormGroup({
                'name': FormControl<String>(value: e),
              }),
            );
          });
        } else {
          affiliatedAcademicSociety.add(
            FormGroup({
              'name': FormControl<String>(),
            }),
          );
        }

        FormArray qualifications = FormArray([]);
        if (item.qualifications != null && item.qualifications!.isNotEmpty) {
          item.qualifications!.map((e) {
            affiliatedAcademicSociety.add(
              FormGroup({
                'name': FormControl<String>(value: e),
              }),
            );
          });
        } else {
          affiliatedAcademicSociety.add(
            FormGroup({
              'name': FormControl<String>(),
            }),
          );
        }

        FormArray completionCertificate = FormArray([]);
        if (item.completionCertificate != null &&
            item.completionCertificate!.isNotEmpty) {
          item.completionCertificate!.map((e) {
            completionCertificate.add(
              FormGroup({
                'name': FormControl<String>(value: e),
              }),
            );
          });
        } else {
          completionCertificate.add(
            FormGroup({
              'name': FormControl<String>(),
            }),
          );
        }

        formArray.add(
          FormGroup({
            '_id': FormControl<String>(value: item.id),
            'hospital': FormControl<String>(value: item.hospital),
            'profile': FormControl<String>(value: item.profile),
            'photoRelease': FormControl<String>(value: item.photoRelease),
            'name': FormControl<String>(value: item.name),
            'remark': FormControl<String>(value: item.remark),
            'departmentName': FormControl<String>(value: item.departmentName),
            'post': FormControl<String>(value: item.post),
            'specialty': FormControl<String>(value: item.specialty),
            'nameKanji': FormControl<String>(value: item.nameKanji),
            'nameKana': FormControl<String>(value: item.nameKana),
            'affiliatedAcademicSociety': affiliatedAcademicSociety,
            'qualifications': qualifications,
            'trainingCompletionCertificateNumber': FormControl<String>(
                value: item.trainingCompletionCertificateNumber),
            'onlineMedicalTreatment':
                FormControl<String>(value: item.onlineMedicalTreatment),
            'telephoneNumber': FormControl<String>(value: item.telephoneNumber),
            'completionCertificate': completionCertificate,
            'faxNumber': FormControl<String>(value: item.faxNumber),
            'email': FormControl<String>(value: item.email),
            'remark2': FormControl<String>(value: item.remark2),
          }),
        );
      }
    }
  }

  Future<void> fetchAdditionalInformation(
      FormGroup formGroup, String hospitalId) async {
    try {
      additionalInformationData.value = const AsyncData(loading: true);
      final result =
          await hospitalRepository.getAdditionalInformationHospital(hospitalId);
      additionalInformationData.value = AsyncData(data: result);
      insertDataAdditionalInformation(formGroup, result);
    } catch (e) {
      logger.d(e);
      additionalInformationData.value = AsyncData(error: e);
    }
  }

  void insertDataAdditionalInformation(
    FormGroup formGroup,
    AdditionalInformationSectionResponse data,
  ) {
    formGroup.patchValue(data.toJson());
    FormArray contract = formGroup.control('contract') as FormArray;
    contract.clear();
    if (data.contract != null && data.contract!.isNotEmpty) {
      for (var item in data.contract!) {
        contract.add(
          FormGroup({
            'name': FormControl<String>(value: item),
          }),
        );
      }
    } else {
      contract.add(
        FormGroup({
          'name': FormControl<String>(),
        }),
      );
    }
  }

  Future<void> fetchPaymentOption(
      FormGroup formGroup, String hospitalId) async {
    try {
      paymentOptionData.value = const AsyncData(loading: true);
      final result =
          await hospitalRepository.getPaymentOptionHospital(hospitalId);
      paymentOptionData.value = AsyncData(data: result);
      insertDataPaymentOption(formGroup, result);
    } catch (e) {
      logger.d(e);
      paymentOptionData.value = AsyncData(error: e);
    }
  }

  void insertDataPaymentOption(
    FormGroup formGroup,
    PaymentOptionHospitalResponse data,
  ) {
    formGroup.patchValue(data.toJson());
  }

  Future<void> fetchSupportLanguage(
    FormArray formArray,
    String hospitalId,
  ) async {
    try {
      supportLangaugeData.value = const AsyncData(loading: true);
      final result =
          await hospitalRepository.getSupportLanguageHospital(hospitalId);
      supportLangaugeData.value = AsyncData(data: result);
      insertDataSupportLanguage(formArray, result);
    } catch (e) {
      logger.d(e);
      supportLangaugeData.value = AsyncData(error: e);
    }
  }

  void insertDataSupportLanguage(
      FormArray formArray, List<SupportLanguageHospitalResponse> data) {
    if (data.isNotEmpty) {
      formArray.clear();

      for (var item in data) {
        formArray.add(
          FormGroup({
            '_id': FormControl<String>(value: item.id),
            'hospital': FormControl<String>(value: item.hospital),
            'supportLanguage': FormControl<String>(value: item.supportLanguage),
            'foreignStaff': FormControl<bool>(value: item.foreignStaff),
            'medicalInterpretationSupport':
                FormControl<bool>(value: item.medicalInterpretationSupport),
          }),
        );
      }
    }
  }

  /// end fetch data for all section and main basic information data hospital

  ValueNotifier<AsyncData<bool>> submit = ValueNotifier(const AsyncData());

  void submitData(FormGroup formGroup) async {
    // try {
    submit.value = const AsyncData(loading: true);
    await submitBasicInformation(
        formGroup.control('basicInformation') as FormGroup);

    logger.d(basicInformationData.value.hasData);
    if (basicInformationData.value.hasData) {
      await submitHowToMakeRequest(
          formGroup.control('howToMakeRequest') as FormGroup);
      await submitPaymentOption(
          formGroup.control('paymentOptionSection') as FormGroup);
      await submitAdditionalInformation(
          formGroup.control('additionalInformationSection') as FormGroup);
      await submitSupportLanguage(formGroup);
      await submitMedicalRecordBasicInfo(formGroup);
      await submitDoctorInformation(formGroup);
    }

    submit.value = const AsyncData(data: true);
    // } catch (e) {
    //   submit.value = AsyncData(error: e);
    // }
  }

  Future<void> submitBasicInformation(FormGroup formGroup) async {
    // try {
    basicInformationData.value = const AsyncData(loading: true);
    logger.d(formGroup.value);
    final result = await hospitalRepository.postBasicInformationHospital(
      BasicInformationHospitalRequest.fromJson(formGroup.value),
    );

    basicInformationData.value = AsyncData(data: result);
    // } catch (e) {
    //   basicInformationData.value = AsyncData(error: e);
    // }
  }

  Future<void> submitHowToMakeRequest(FormGroup form) async {
    // try {
    howToMakeRequestHospitalData.value = const AsyncData(loading: true);
    logger.d(form.value);
    Map<String, dynamic> json = form.value;
    json['hospital'] = basicInformationData.value.requireData.id;
    HowToRequestHospitalRequest request =
        HowToRequestHospitalRequest.fromJson(json);
    await hospitalRepository
        .postHowToRequestHospital(request.copyWith(
            hospital: basicInformationData.value.requireData.id))
        .then((value) {
      howToMakeRequestHospitalData.value = AsyncData(data: value);
    });
    // } catch (e) {
    //   logger.d(e);
    //   howToMakeRequestHospitalData.value = AsyncData(error: e);
    // }
  }

  Future<void> submitMedicalRecordBasicInfo(FormGroup formGroup) async {
    // try {
    medicalRecordBasicInfoData.value = const AsyncData(loading: true);

    await formGroup
        .control('medicalRecordHospitals')
        .value
        .forEach((element) async {
      logger.d(element);
      Map<String, dynamic> json = element;
      json['hospital'] = basicInformationData.value.requireData.id;
      MedicalRecordBasicInfoHospitalRequest request =
          MedicalRecordBasicInfoHospitalRequest.fromJson(json);
      var result = await hospitalRepository.postMedicalRecordBasicInfoHospital(
          request.copyWith(
              hospital: basicInformationData.value.requireData.id));

      medicalRecordBasicInfoData.value.copyWith(data: [
        ...medicalRecordBasicInfoData.value.requireData,
        result,
      ]);
    });

    medicalRecordBasicInfoData.value.copyWith(loading: false);
    // } catch (e) {
    //   logger.d(e);
    //   medicalRecordBasicInfoData.value = AsyncData(error: e);
    // }
  }

  Future<void> submitDoctorInformation(FormGroup formGroup) async {
    // try {
    doctorInformationData.value = const AsyncData(loading: true);

    await formGroup.control('addDoctorProfile').value.forEach((element) async {
      List<String> affiliatedAcademicSociety = [];
      List<String> qualifications = [];
      List<String> completionCertificate = [];

      if ((element['affiliatedAcademicSociety'] as List).isNotEmpty) {
        affiliatedAcademicSociety = element['affiliatedAcademicSociety']
            .map((e) => e['name'] as String)
            .toList();
      }

      if ((element['qualifications'] as List).isNotEmpty) {
        qualifications =
            element['qualifications'].map((e) => e['name'] as String).toList();
      }

      if ((element['completionCertificate'] as List).isNotEmpty) {
        qualifications = element['completionCertificate']
            .map((e) => e['name'] as String)
            .toList();
      }

      element['affiliatedAcademicSociety'] = affiliatedAcademicSociety;
      element['qualifications'] = qualifications;
      element['completionCertificate'] = completionCertificate;

      logger.d(element);
      element['hospital'] = basicInformationData.value.requireData.id;
      DoctorProfileHospitalRequest request =
          DoctorProfileHospitalRequest.fromJson(element);
      var result = await hospitalRepository.postDoctorInformationHospital(
          request.copyWith(
              hospital: basicInformationData.value.requireData.id));
      doctorInformationData.value.copyWith(data: [
        ...doctorInformationData.value.data ?? [],
        result,
      ]);
    });

    doctorInformationData.value.copyWith(loading: false);
    // } catch (e) {
    //   logger.d(e);
    //   doctorInformationData.value = AsyncData(error: e);
    // }
  }

  Future<void> submitAdditionalInformation(FormGroup form) async {
    // try {
    additionalInformationData.value = const AsyncData(loading: true);
    Map<String, dynamic> element = form.value;

    element['contract'] = element['contract']
        .map((e) => e['name'] as String)
        .toList()
        .cast<String>();

    logger.d(element);

    element['hospital'] = basicInformationData.value.requireData.id;
    AdditionalInformationSectionRequest request =
        AdditionalInformationSectionRequest.fromJson(element);
    var result = await hospitalRepository.postAdditionalInformationHospital(
        request.copyWith(hospital: basicInformationData.value.requireData.id));

    additionalInformationData.value = AsyncData(data: result);
    // } catch (e) {
    //   logger.d(e);
    //   additionalInformationData.value = AsyncData(error: e);
    // }
  }

  Future<void> submitPaymentOption(FormGroup form) async {
    // try {
    paymentOptionData.value = const AsyncData(loading: true);
    logger.d(form.value);
    Map<String, dynamic> json = form.value;
    json['hospital'] = basicInformationData.value.requireData.id;
    PaymentOptionHospitalRequest request =
        PaymentOptionHospitalRequest.fromJson(json);
    var result = await hospitalRepository.postPaymentOptionHospital(
        request.copyWith(hospital: basicInformationData.value.requireData.id));

    paymentOptionData.value = AsyncData(data: result);
    // } catch (e) {
    //   logger.d(e);
    //   paymentOptionData.value = AsyncData(error: e);
    // }
  }

  Future<void> submitSupportLanguage(FormGroup formGroup) async {
    // try {
    supportLangaugeData.value = const AsyncData(loading: true);

    await formGroup
        .control('supportLanguageSection')
        .value
        .forEach((element) async {
      logger.d(element);

      Map<String, dynamic> json = element;
      json['hospital'] = basicInformationData.value.requireData.id;
      SupportLanguageHospitalRequest request =
          SupportLanguageHospitalRequest.fromJson(json);

      var result = await hospitalRepository.postSupportLanguageHospital(request
          .copyWith(hospital: basicInformationData.value.requireData.id));

      supportLangaugeData.value.copyWith(data: [
        ...supportLangaugeData.value.requireData,
        result,
      ]);
    });

    supportLangaugeData.value.copyWith(loading: false);
    // } catch (e) {
    //   logger.d(e);
    //   supportLangaugeData.value = AsyncData(error: e);
    // }
  }
}
