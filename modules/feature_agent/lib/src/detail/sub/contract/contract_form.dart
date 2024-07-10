import 'package:core_network/entities.dart';
import 'package:reactive_forms/reactive_forms.dart';

FormGroup contractForm() {
  return FormGroup({
    'uploadFile' : FormControl<FileSelect>(),
    'DocumentName' : FormControl<String>(),
    'updatedOn' : FormControl<DateTime>(),
    'contract': FormGroup({
      '_id': FormControl<String?>(),
      'contractDate': FormControl<DateTime>(
        validators: [Validators.required],
      ),
      'contractType': FormControl<String>(),
      'contractPeriod': FormControl<String>(),
      'contractEndDate': FormControl<DateTime>(),
      'contractStatus': FormControl<String>(),
      'contractMemo': FormControl<String>(),
    }),
  });
}