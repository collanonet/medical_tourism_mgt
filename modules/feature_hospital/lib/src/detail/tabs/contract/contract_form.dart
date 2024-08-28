import 'package:core_network/core_network.dart';
import 'package:core_utils/core_utils.dart';
import 'package:reactive_forms/reactive_forms.dart';

FormGroup contractForm(
    {required String hospitalRecordId, required FileSelect file}) {
  return FormGroup({
    'hospitalRecord': FormControl<String>(value: hospitalRecordId),
    'uploadFile': FormControl<FileSelect>(
      value: file,
    ),
    'DocumentName': FormControl<String>(),
    'updatedOn': FormControl<DateTime>(
      value: DateTime.now(),
      validators: [
        Validators.pattern(
          ValidatorRegExp.date,
        ),
      ],
    ),
  });
}
