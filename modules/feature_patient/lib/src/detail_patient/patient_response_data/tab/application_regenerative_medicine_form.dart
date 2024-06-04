import 'package:core_network/entities.dart';
import 'package:reactive_forms/reactive_forms.dart';

FormGroup formApplicationRegenerativeMedical(
    {ApplicationRegenerativeMedicalResponse? data}) {
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
    ),
    'date2': FormControl<DateTime>(
      value: data?.date2,
    ),
    'date3': FormControl<DateTime>(
      value: data?.date3,
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
    'privetcy': FormControl<bool>(
      value: data?.privetcy,
    ),
  });
}
