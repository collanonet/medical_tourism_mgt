// Package imports:
import 'package:core_network/entities.dart';
import 'package:core_utils/core_utils.dart';
import 'package:reactive_forms/reactive_forms.dart';

FormGroup formApplicationRegenerativeMedical(
    {ApplicationRegenerativeMedicalResponse? data}) {
  var drug = FormArray([
    FormGroup({
      'nameDrug': FormControl<String>(),
    })
  ]);

  if (data?.nameDrug != null && data!.nameDrug!.isNotEmpty) {
    drug.clear();
    for (var element in data.nameDrug!) {
      drug.add(
        FormGroup(
          {
            'nameDrug': FormControl<String>(value: element),
          },
        ),
      );
    }
  }

  return FormGroup({
    'diseasePrevention': FormControl<bool>(
      value: data?.diseasePrevention,
    ),
    'relapsePrevention': FormControl<bool>(
      value: data?.relapsePrevention,
    ),
    'antiAging': FormControl<bool>(
      value: data?.antiAging,
    ),
    'beauty': FormControl<bool>(
      value: data?.beauty,
    ),
    'increaseImmunity': FormControl<bool>(
      value: data?.increaseImmunity,
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
    'noDesiredDate': FormControl<bool>(
      value: data?.noDesiredDate,
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
    'atten': FormControl<bool>(
      value: data?.atten,
    ),
    'desiredArea': FormControl<String>(
      value: data?.desiredArea,
    ),
    'reason': FormControl<String>(
      value: data?.reason,
    ),
    'stemCellTherapy': FormControl<bool>(
      value: data?.stemCellTherapy,
    ),
    'stemCellTherapy1': FormControl<bool>(
      value: data?.stemCellTherapy1,
    ),
    'stemCellTherapy2': FormControl<bool>(
      value: data?.stemCellTherapy2,
    ),
    'freeInput': FormControl<String>(
      value: data?.freeInput,
    ),
    'fibroblastTherapy': FormControl<bool>(
      value: data?.fibroblastTherapy,
    ),
    'prpTherapy': FormControl<bool>(
      value: data?.prpTherapy,
    ),
    'others': FormControl<String>(
      value: data?.others,
    ),
    'currentlyConcerned': FormControl<String>(
      value: data?.currentlyConcerned,
    ),
    'medicine': FormControl<bool>(
      value: data?.medicine,
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
    'item4': FormControl<bool>(
      value: data?.item4,
    ),
    'item5': FormControl<bool>(
      value: data?.item5,
    ),
    'others1': FormControl<String>(
      value: data?.others1,
    ),
    'receive1': FormControl<bool>(
      value: data?.receive1,
    ),
    'receive2': FormControl<bool>(
      value: data?.receive2,
    ),
    'countryOther': FormControl<String>(
      value: data?.countryOther ?? '',
    ),
    'brokerageCompany': FormControl<String>(
      value: data?.brokerageCompany ?? '',
    ),
    'historyCancer': FormControl<bool>(
      value: data?.historyCancer,
    ),
    'cancerSite': FormControl<String>(
      value: data?.cancerSite ?? '',
    ),
    'currentHealth': FormControl<bool>(
      value: data?.currentHealth,
    ),
    'detail': FormControl<String>(
      value: data?.detail ?? '',
    ),
    'currentHealth1': FormControl<bool>(
      value: data?.currentHealth1,
    ),
    'detail1': FormControl<String>(
      value: data?.detail1 ?? '',
    ),
    'nameOfTheDrug': drug,
    'medicalInformation': FormControl<bool>(
      value: data?.medicalInformation,
    ),
    'dicomImage': FormControl<bool>(
      value: data?.dicomImage,
    ),
    'otherTest': FormControl<bool>(
      value: data?.otherTest,
    ),
    'detail2': FormControl<String>(
      value: data?.detail2 ?? '',
    ),
    'readio': FormControl<String>(
      value: data?.readio,
    ),
    'privetcy': FormControl<bool>(
      value: data?.privetcy,
    ),
  });
}
