// Package imports:
import 'package:core_network/entities.dart';
import 'package:core_utils/core_utils.dart';
import 'package:reactive_forms/reactive_forms.dart';

FormGroup formPurificationTherapy(
    {ApplicationBloodPurificationTherapyResponse? data}) {
  var drug = FormArray([
    FormGroup({
      'drug': FormControl<String>(),
    })
  ]);

  if (data?.drugName != null && data!.drugName!.isNotEmpty) {
    drug.clear();
    for (var element in data.drugName!) {
      drug.add(
        FormGroup(
          {
            'drug': FormControl<String>(value: element),
          },
        ),
      );
    }
  }
  return FormGroup({
    'purposeOfCommission1': FormControl<bool>(
      value: data?.purposeOfCommission1,
    ),
    'purposeOfCommission2': FormControl<bool>(
      value: data?.purposeOfCommission2,
    ),
    'purposeOfCommission3': FormControl<bool>(
      value: data?.purposeOfCommission3,
    ),
    'purposeOfCommission4': FormControl<bool>(
      value: data?.purposeOfCommission4,
    ),
    'purposeOfCommission5': FormControl<bool>(
      value: data?.purposeOfCommission5,
    ),
    'date1': FormControl<DateTime>(
      value: data?.date1,
      validators: [
        Validators.pattern(
          ValidatorRegExp.date,
        ),
      ],
    ),
    'date2': FormControl<DateTime>(
      value: data?.date2,
      validators: [
        Validators.pattern(
          ValidatorRegExp.date,
        ),
      ],
    ),
    'date3': FormControl<DateTime>(
      value: data?.date3,
      validators: [
        Validators.pattern(
          ValidatorRegExp.date,
        ),
      ],
    ),
    'noDate': FormControl<bool>(
      value: data?.noDate,
    ),
    'remarks': FormControl<String>(
      value: data?.remarks,
    ),
    'people': FormControl<int>(
      value: data?.people,
    ),
    'age': FormControl<int>(
      value: data?.age,
    ),
    'sex': FormControl<bool>(
      value: data?.sex,
    ),
    'relationship': FormControl<String>(
      value: data?.relationship,
    ),
    'attend': FormControl<bool>(
      value: data?.attend,
    ),
    'desiredArea': FormControl<String>(
      value: data?.desiredArea,
    ),
    'reason': FormControl<String>(
      value: data?.reason,
    ),
    'menu1': FormControl<bool>(
      value: data?.menu1,
    ),
    'menu2': FormControl<bool>(
      value: data?.menu2,
    ),
    'menu3': FormControl<bool>(
      value: data?.menu3,
    ),
    'others': FormControl<String>(
      value: data?.others,
    ),
    'concern': FormControl<String>(
      value: data?.concern,
    ),
    'question': FormControl<bool>(
      value: data?.question,
    ),
    'item1': FormControl<bool>(
      value: data?.item1,
    ),
    'item2': FormControl<bool>(
      value: data?.item2,
    ),
    'item3': FormControl<bool>(
      value: data?.item3,
    ),
    'others1': FormControl<String>(
      value: data?.others1,
    ),
    'pleaceReceive1': FormControl<bool>(
      value: data?.pleaceReceive1,
    ),
    'pleaceReceive2': FormControl<bool>(
      value: data?.pleaceReceive2,
    ),
    'otherCountry': FormControl<String>(
      value: data?.otherCountry,
    ),
    'introducer': FormControl<String>(
      value: data?.introducer,
    ),
    'historyCancer': FormControl<bool>(
      value: data?.historyCancer,
    ),
    'cancerSite': FormControl<String>(
      value: data?.cancerSite,
    ),
    'ifwoman': FormControl<String>(
      value: data?.ifwoman,
    ),
    'treatmentDetail': FormControl<bool>(
      value: data?.treatmentDetail,
    ),
    'detail': FormControl<String>(
      value: data?.detail,
    ),
    'treatmentDetail1': FormControl<bool>(
      value: data?.treatmentDetail1,
    ),
    'detail1': FormControl<String>(
      value: data?.detail1,
    ),
    'drugName': drug,
    'dicom': FormControl<bool>(
      value: data?.dicom,
    ),
    'otherTestData': FormControl<bool>(
      value: data?.otherTestData,
    ),
    'detail2': FormControl<String>(
      value: data?.detail2,
    ),
    'privetcy': FormControl<bool>(
      value: data?.privetcy,
    ),
  });
}
