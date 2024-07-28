import 'package:core_network/core_network.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_hospital/data_hospital.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

@injectable
class QAndAModel {
  QAndAModel({
    required this.hospitalRepository,
  });

  final HospitalRepository hospitalRepository;

  ValueNotifier<AsyncData<List<NewRegistrationHospitalResponse>>>
      newRegistrationHospitalData = ValueNotifier(
          const AsyncData<List<NewRegistrationHospitalResponse>>(data: []));

  ValueNotifier<AsyncData<ListSectionQAndAHospitalResponse>>
      listSectionQAndAHospitalData = ValueNotifier(const AsyncData());

  Future<void> fetchData(FormGroup formGroup, {String? hospitalId}) async {
    try {
      if (hospitalId != null) {
        await fetchNewRegistrationHospital(formGroup, hospitalId);
      }
    } catch (e) {
      logger.d(e);
    }
  }

  Future<void> fetchNewRegistrationHospital(
      FormGroup formGroup, String hospitalId) async {
    try {
      newRegistrationHospitalData.value = const AsyncData(loading: true);
      final result = await hospitalRepository.getNewRegistrationHospital(
        hospitalId,
      );
      // insertDataNewRegisterRequest(formGroup, result);
      newRegistrationHospitalData.value = AsyncData(data: result);
    } catch (e) {
      logger.d(e);
      newRegistrationHospitalData.value = AsyncData(error: e);
    }
  }

  // void insertDataNewRegisterRequest(
  //     FormGroup formGroup, List<NewRegistrationHospitalResponse> data) {
  //   FormArray dataQa = formGroup.control('newRegistrationSection') as FormArray;
  //   for (var item in data) {
  //     dataQa.add(
  //       FormGroup({
  //         'hospital': FormControl<String>(value: item.hospital),
  //         'updateDate': FormControl<DateTime>(
  //             validators: [Validators.required], value: item.updateDate),
  //         'updatedBy': FormControl<String>(
  //             validators: [Validators.required], value: item.updatedBy),
  //         'classification': FormControl<String>(
  //             validators: [Validators.required], value: item.classification),
  //         'shareThisQADataWithHospitals': FormControl<bool>(
  //             validators: [Validators.required],
  //             value: item.shareThisQADataWithHospitals),
  //         'question': FormControl<String>(
  //             validators: [Validators.required], value: item.question),
  //         'answer': FormControl<String>(
  //             validators: [Validators.required], value: item.answer),
  //       }),
  //     );
  //   }

  //   // formGroup.control('updateDate').value = data.updateDate;
  //   // formGroup.control('updatedBy').value = data.updatedBy;
  //   // formGroup.control('classification').value = data.classification;
  //   // formGroup.control('shareThisQADataWithHospitals').value =
  //   //     data.shareThisQADataWithHospitals;
  //   // formGroup.control('question').value = data.question;
  //   // formGroup.control('answer').value = data.answer;
  //   // formGroup.control('hospital').value = data.hospital;
  //   // formGroup.control('newRegistrationSection').patchValue({
  //   //   'updateDate': data.updateDate,
  //   //   'updatedBy': data.updatedBy,
  //   //   'classification': data.classification,
  //   //   'shareThisQADataWithHospitals': data.shareThisQADataWithHospitals,
  //   //   'question': data.question,
  //   //   'answer': data.answer,
  //   //   'hospital': data.hospital,
  //   // });
  // }

  ValueNotifier<AsyncData<NewRegistrationHospitalResponse>> submit =
      ValueNotifier(const AsyncData());

  Future<void> submitNewRegistrationHospital(FormGroup formGroup) async {
    try {
      submit.value = const AsyncData(loading: true);
      final response = await hospitalRepository.postNewRegistrationHospital(
        NewRegistrationHospitalRequest(
          hospital: formGroup.control('hospital').value,
          updateDate: formGroup.control('updateDate').value,
          updatedBy: formGroup.control('updatedBy').value,
          classification: formGroup.control('classification').value,
          shareThisQADataWithHospitals:
              formGroup.control('shareThisQADataWithHospitals').value,
          question: formGroup.control('question').value,
          answer: formGroup.control('answer').value,
        ),
      );
      submit.value = AsyncData(data: response);
      newRegistrationHospitalData.value = AsyncData(
          data: newRegistrationHospitalData.value.data!..add(response));
    } catch (e) {
      logger.d(e);
      submit.value = AsyncData(error: e);
    }
  }
}
