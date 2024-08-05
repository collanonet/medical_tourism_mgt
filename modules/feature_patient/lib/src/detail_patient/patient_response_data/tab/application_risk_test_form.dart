import 'package:core_network/entities.dart';
import 'package:reactive_forms/reactive_forms.dart';

FormGroup formRiskTest({ApplicationRiskTestResponse? data}) {
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
    'date1': FormControl<DateTime>(
      value: data?.date1,
    ),
    'date2': FormControl<DateTime>(
      value: data?.date2,
    ),
    'date3': FormControl<DateTime>(
      value: data?.date3,
    ),
    'noDate': FormControl<bool>(
      value: data?.noDate,
    ),
    'remark': FormControl<String>(
      value: data?.remark,
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
    'menu1': FormControl<bool>(
      value: data?.menu1,
    ),
    'menu2': FormControl<bool>(
      value: data?.menu2,
    ),
    'menu3': FormControl<bool>(
      value: data?.menu3,
    ),
    'menu4': FormControl<bool>(
      value: data?.menu4,
    ),
    'menu5': FormControl<bool>(
      value: data?.menu4,
    ),
    'menu6': FormControl<bool>(
      value: data?.menu6,
    ),
    'menu7': FormControl<bool>(
      value: data?.menu7,
    ),
    'menu8': FormControl<bool>(
      value: data?.menu8,
    ),
    'menu9': FormControl<bool>(
      value: data?.menu9,
    ),
    'menu10': FormControl<bool>(
      value: data?.menu10,
    ),
    'menu11': FormControl<bool>(
      value: data?.menu11,
    ),
    'menu12': FormControl<bool>(
      value: data?.menu12,
    ),
    'menu13': FormControl<bool>(
      value: data?.menu13,
    ),
    'others': FormControl<String>(
      value: data?.others,
    ),
    'concern': FormControl<String>(
      value: data?.concern,
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
    'privetcy': FormControl<bool>(
      value: data?.privetcy,
    ),
  });
}
