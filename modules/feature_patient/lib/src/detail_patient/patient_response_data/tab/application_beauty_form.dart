// Package imports:
import 'package:core_network/entities.dart';
import 'package:core_utils/core_utils.dart';
import 'package:reactive_forms/reactive_forms.dart';

FormGroup formApplicationBeauty({ApplicationBeautyResponse? data}) {
  return FormGroup({
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
    'desiredDate': FormControl<bool>(
      value: data?.desiredDate,
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
      value: data?.desiredArea ?? '',
    ),
    'reason': FormControl<String>(
      value: data?.reason ?? '',
    ),
    'faceMenu1': FormControl<bool>(
      value: data?.faceMenu1,
      //
    ),
    'faceMenu2': FormControl<bool>(
      value: data?.faceMenu2,
      //
    ),
    'faceMenu3': FormControl<bool>(
      value: data?.faceMenu3,
      //
    ),
    'faceMenu4': FormControl<bool>(
      value: data?.faceMenu4,
      //
    ),
    'faceMenu5': FormControl<bool>(
      value: data?.faceMenu5,
      //
    ),
    'faceMenu6': FormControl<bool>(
      value: data?.faceMenu6,
      //
    ),
    'faceMenu7': FormControl<bool>(
      value: data?.faceMenu7,
      //
    ),
    'faceMenu8': FormControl<bool>(
      value: data?.faceMenu8,
      //
    ),
    'faceMenu9': FormControl<bool>(
      value: data?.faceMenu9,
      //
    ),
    'others': FormControl<String>(
      value: data?.others,
      //
    ),
    'bodyMenu1': FormControl<bool>(
      value: data?.bodyMenu1,
      //
    ),
    'bodyMenu2': FormControl<bool>(
      value: data?.bodyMenu2,
      //
    ),
    'bodyMenu3': FormControl<bool>(
      value: data?.bodyMenu3,
      //
    ),
    'bodyMenu4': FormControl<bool>(
      value: data?.bodyMenu4,
      //
    ),
    'bodyMenu5': FormControl<bool>(
      value: data?.bodyMenu5,
      //
    ),
    'others1': FormControl<String>(
      value: data?.others1,
      //
    ),
    'skinMenu1': FormControl<bool>(
      value: data?.skinMenu1,
    ),
    'skinMenu2': FormControl<bool>(
      value: data?.skinMenu2,
    ),
    'skinMenu3': FormControl<bool>(
      value: data?.skinMenu3,
    ),
    'hairRemovalMeun1': FormControl<bool>(
      value: data?.hairRemovalMeun1,
    ),
    'hairRemovalMeun2': FormControl<bool>(
      value: data?.hairRemovalMeun2,
    ),
    'otherMenu1': FormControl<bool>(
      value: data?.otherMenu1,
      //
    ),
    'otherMenu2': FormControl<bool>(
      value: data?.otherMenu2,
      //
    ),
    'otherMenu3': FormControl<bool>(
      value: data?.otherMenu3,
      //
    ),
    'otherMenu4': FormControl<bool>(
      value: data?.otherMenu4,
      //
    ),
    'otherMenu5': FormControl<bool>(
      value: data?.otherMenu5,
      //
    ),
    'menMenu1': FormControl<bool>(
      value: data?.menMenu1,
    ),
    'menMenu2': FormControl<bool>(
      value: data?.menMenu2,
    ),
    'otherHospital': FormControl<bool>(
      value: data?.otherHospital,
    ),
    'others2': FormControl<String>(
      value: data?.others2,
    ),
    'concerne': FormControl<String>(
      value: data?.concerne,
    ),
    'brokerageCompany': FormControl<String>(
      value: data?.brokerageCompany,
    ),
    'privetcy': FormControl<bool>(
      value: data?.privetcy,
      //
    ),
  });
}
