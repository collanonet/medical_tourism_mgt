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
        await fetchHowToMakeRequest(
            formGroup.control('howToMakeRequest') as FormGroup, hospitalId);
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
      }
    } catch (e) {
      logger.d(e);
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
    formGroup.patchValue({
      'id': data.id,
      'hospital': data.hospital,
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
            'email': FormControl<String>(validators: [
              Validators.email,
            ], value: item.email),
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
            'email': FormControl<String>(
              value: item.email,
              validators: [
                Validators.email,
              ],
            ),
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
      await insertDataAdditionalInformation(formGroup, result);
      additionalInformationData.value = AsyncData(data: result);
    } catch (e) {
      logger.d("error get data additional information $e");
      additionalInformationData.value = AsyncData(error: e);
    }
  }

  Future<void> insertDataAdditionalInformation(
    FormGroup formGroup,
    AdditionalInformationSectionResponse data,
  ) async {
    try {
      logger.d("data additional information $data");
      logger.d(data.toJson());

      formGroup.control('_id').value = data.id;
      formGroup.control('hospital').value = data.hospital;
      formGroup.control('outsourcingContract').value = data.outsourcingContract;
      formGroup.control('msCorporation').value = data.msCorporation;
      formGroup.control('referralFee').value = data.referralFee;
      formGroup.control('treatmentCostPointCalculationPerPoint').value =
          data.treatmentCostPointCalculationPerPoint;
      formGroup.control('remark').value = data.remark;
      formGroup.control('paymentSiteTighten').value = data.paymentSiteTighten;
      formGroup.control('paymentSitePayment').value = data.paymentSitePayment;

      FormArray contract = FormArray([]);
      if (data.contract != null && data.contract!.isNotEmpty) {
        data.contract!.map((e) {
          if (e != null) {
            contract.add(
              FormGroup({
                'name': FormControl<String>(value: e),
              }),
            );
          }
        });
      }
      contract.add(
        FormGroup({
          'name': FormControl<String>(),
        }),
      );
    } catch (e) {
      logger.d("error insert data additional information $e");
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
    try {
      submit.value = const AsyncData(loading: true);
      await submitBasicInformation(formGroup);

      submit.value = const AsyncData(data: true);
    } catch (e) {
      logger.d(e);
      submit.value = AsyncData(error: e);
    }
  }

  Future<void> submitBasicInformation(FormGroup formGroup) async {
    try {
      basicInformationData.value = const AsyncData(loading: true);
      logger.d(formGroup.value);
      final result = await hospitalRepository.postBasicInformationHospital(
        BasicInformationHospitalRequest.fromJson(
            (formGroup.control('basicInformation') as FormGroup).value),
      );

      basicInformationData.value = AsyncData(data: result);

      await submitHowToMakeRequest(
          formGroup.control('howToMakeRequest') as FormGroup);
      await submitMedicalRecordBasicInfo(formGroup);
      await submitDoctorInformation(formGroup);
      await submitAdditionalInformation(
          formGroup.control('additionalInformationSection') as FormGroup);
      await submitPaymentOption(
          formGroup.control('paymentOptionSection') as FormGroup);
      await submitSupportLanguage(formGroup);
    } catch (e) {
      logger.d(e);
      basicInformationData.value = AsyncData(error: e);
    }
  }

  Future<void> submitHowToMakeRequest(FormGroup form) async {
    try {
      howToMakeRequestHospitalData.value = const AsyncData(loading: true);

      HowToRequestHospitalRequest request = HowToRequestHospitalRequest(
        hospital: basicInformationData.value.requireData.id,
        id: form.control('_id').value,
        dateOfUpdate: form.control('dateOfUpdate').value,
        updater: form.control('updater').value,
        memo: form.control('memo').value,
        updates: form.control('updates').value,
      );
      logger.e(request.toJson());
      var result = await hospitalRepository.postHowToRequestHospital(request);

      howToMakeRequestHospitalData.value = AsyncData(data: result);
    } catch (e) {
      logger.d("test why $e");
      howToMakeRequestHospitalData.value = AsyncData(error: e);
    }
  }

  Future<void> submitMedicalRecordBasicInfo(FormGroup formGroup) async {
    try {
      medicalRecordBasicInfoData.value =
          const AsyncData(loading: true, data: []);

      await formGroup
          .control('medicalRecordHospitals')
          .value
          .forEach((element) async {
        MedicalRecordBasicInfoHospitalRequest request =
            MedicalRecordBasicInfoHospitalRequest(
          hospital: basicInformationData.value.requireData.id,
          id: element['_id'],
          dateOfUpdate: element['dateOfUpdate'],
          departmentName: element['departmentName'],
          nameKanji: element['nameKanji'],
          nameKana: element['nameKana'],
          telephoneNumber: element['telephoneNumber'],
          email: element['email'],
          faxNumber: element['faxNumber'],
        );
        // var result =
        await hospitalRepository.postMedicalRecordBasicInfoHospital(request);

        // medicalRecordBasicInfoData.value.copyWith(data: [
        //   ...medicalRecordBasicInfoData.value.requireData,
        //   result,
        // ]);
      });

      medicalRecordBasicInfoData.value = AsyncData(data: []);
    } catch (e) {
      logger.d(e);
      medicalRecordBasicInfoData.value = AsyncData(error: e);
    }
  }

  Future<void> submitDoctorInformation(FormGroup formGroup) async {
    try {
      doctorInformationData.value = const AsyncData(loading: true);
      await formGroup
          .control('addDoctorProfile')
          .value
          .forEach((element) async {
        logger.e(element);

        List<String> affiliatedAcademicSociety = [];
        // List data = element['affiliatedAcademicSociety'] as List;
        // if (data.isNotEmpty) {
        //   for (var i = 0; i < data.length; i++) {
        //     if (data[i]['name'] != null || data[i]['name'] != '') {
        //       affiliatedAcademicSociety.add(data[i]['name']);
        //     }
        //   }
        // }

        List<String> qualifications = [];
        // List data1 = element['qualifications'] as List;
        // if (data1.isNotEmpty) {
        //   for (var i = 0; i < data1.length; i++) {
        //     if (data1[i]['name'] != null || data1[i]['name'] != '') {
        //       qualifications.add(data1[i]['name']);
        //     }
        //   }
        // }

        List<String> completionCertificate = [];
        // List data2 = element['completionCertificate'] as List;
        // if (data2.isNotEmpty) {
        //   for (var i = 0; i < data2.length; i++) {
        //     if (data2[i]['name'] != null || data2[i]['name'] != '') {
        //       completionCertificate.add(data2[i]['name']);
        //     }
        //   }
        // }

        DoctorProfileHospitalRequest request = DoctorProfileHospitalRequest(
          hospital: basicInformationData.value.requireData.id,
          id: element['_id'],
          profile: element['profile'],
          photoRelease: element['photoRelease'],
          name: element['name'],
          remark: element['remark'],
          departmentName: element['departmentName'],
          post: element['post'],
          specialty: element['specialty'],
          nameKanji: element['nameKanji'],
          nameKana: element['nameKana'],
          affiliatedAcademicSociety: affiliatedAcademicSociety,
          qualifications: qualifications,
          onlineMedicalTreatment: element['onlineMedicalTreatment'],
          trainingCompletionCertificateNumber:
              element['trainingCompletionCertificateNumber'],
          completionCertificate: completionCertificate,
          telephoneNumber: element['telephoneNumber'],
          faxNumber: element['faxNumber'],
          email: element['email'],
          remark2: element['remark2'],
        );
        // var result =
        await hospitalRepository.postDoctorInformationHospital(request);
        // doctorInformationData.value.copyWith(data: [
        //   ...doctorInformationData.value.data ?? [],
        //   result,
        // ]);
      });

      doctorInformationData.value = AsyncData(data: []);
    } catch (e) {
      logger.d("error create doctor $e");
      doctorInformationData.value = AsyncData(error: e);
    }
  }

  Future<void> submitAdditionalInformation(FormGroup form) async {
    try {
      additionalInformationData.value = const AsyncData(loading: true);

      List<String> contract = [];

      form.control('contract').value.forEach((element) {
        if (element['name'] != null) {
          contract.add(element['name']);
        }
      });

      AdditionalInformationSectionRequest request =
          AdditionalInformationSectionRequest(
        hospital: basicInformationData.value.requireData.id,
        id: form.control('_id').value,
        outsourcingContract: form.control('outsourcingContract').value,
        contract: contract,
        msCorporation: form.control('msCorporation').value,
        referralFee: form.control('referralFee').value,
        treatmentCostPointCalculationPerPoint:
            form.control('treatmentCostPointCalculationPerPoint').value,
        remark: form.control('remark').value,
        paymentSiteTighten: form.control('paymentSiteTighten').value,
        paymentSitePayment: form.control('paymentSitePayment').value,
      );
      logger.e(request.toJson());
      var result =
          await hospitalRepository.postAdditionalInformationHospital(request);

      additionalInformationData.value = AsyncData(data: result);
    } catch (e) {
      logger.d("additional error: $e");
      additionalInformationData.value = AsyncData(error: e);
    }
  }

  Future<void> submitPaymentOption(FormGroup form) async {
    try {
      paymentOptionData.value = const AsyncData(loading: true);

      PaymentOptionHospitalRequest request = PaymentOptionHospitalRequest(
        hospital: basicInformationData.value.requireData.id,
        id: form.control('_id').value,
        payer: form.control('payer').value,
        paymentTiming: form.control('paymentTiming').value,
        feeBack: form.control('feeBack').value,
        paymentDirectlyToTheHospital:
            form.control('paymentDirectlyToTheHospital').value,
        transfer: form.control('transfer').value,
        electronicPayment: form.control('electronicPayment').value,
        alipay: form.control('alipay').value,
        unionPayPay: form.control('unionPayPay').value,
        unionPay: form.control('unionPay').value,
        weChatPay: form.control('weChatPay').value,
        creditCard: form.control('creditCard').value,
        visa: form.control('visa').value,
        masterCard: form.control('masterCard').value,
        americanExpress: form.control('americanExpress').value,
        jcb: form.control('jcb').value,
        cash: form.control('cash').value,
        remark: form.control('remark').value,
      );
      var result = await hospitalRepository.postPaymentOptionHospital(request);

      paymentOptionData.value = AsyncData(data: result);
    } catch (e) {
      logger.d(e);
      paymentOptionData.value = AsyncData(error: e);
    }
  }

  Future<void> submitSupportLanguage(FormGroup form) async {
    try {
      supportLangaugeData.value = const AsyncData(loading: true, data: []);

      await form
          .control('supportLanguageSection')
          .value
          .forEach((element) async {
        if (element['supportLanguage'] != null &&
            element['supportLanguage'].toString().isNotEmpty) {
          SupportLanguageHospitalRequest request =
              SupportLanguageHospitalRequest(
            hospital: basicInformationData.value.requireData.id,
            id: element['_id'],
            supportLanguage: element['supportLanguage'],
            foreignStaff: element['foreignStaff'],
            medicalInterpretationSupport:
                element['medicalInterpretationSupport'],
          );
          await hospitalRepository.postSupportLanguageHospital(request);
        }
      });

      supportLangaugeData.value = AsyncData(data: []);
    } catch (e) {
      logger.d(e);
      supportLangaugeData.value = AsyncData(error: e);
    }
  }
}

List<String> convertToList(Map<String, dynamic> element, String key) {
  if ((element[key] as List).isNotEmpty) {
    return element[key].map((e) => e['name'] as String).toList();
  }
  return [];
}
