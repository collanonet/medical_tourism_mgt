// Package imports:
import 'package:core_network/entities.dart';
import 'package:reactive_forms/reactive_forms.dart';

// FormGroup contractTemplateform(FileSelect file) {
//   return FormGroup({
//     'uploadFile': FormControl<FileSelect>(value: file),
//     'version': FormControl<String>(),
//     'updatedOn': FormControl<DateTime>(),
//     'subject': FormControl<String>(),
//     'operation': FormControl<String>(),
//   });
// }

FormGroup contractTemplatebasicInformation() {
  return FormGroup({
    'file': FormControl<FileSelect>(),
    'version': FormControl<String>(value: ''),
    'updateDate': FormControl<DateTime>(value: DateTime.now()),
    'documentName': FormControl<String>(value: ''),
    'first': FormControl<String>(value: ''),
    'second': FormControl<String>(value: ''),
    'c': FormControl<String>(value: ''),
    'methodOfConclusion': FormControl<String>(value: ''),
    'contractPartnerInCaseOfHospital': FormControl<String>(value: ''),
    'user': FormControl<bool>(value: false),
  });
}
