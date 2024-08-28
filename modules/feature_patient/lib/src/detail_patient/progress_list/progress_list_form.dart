import 'package:core_utils/core_utils.dart';
import 'package:reactive_forms/reactive_forms.dart';

FormGroup progressListForm() {
  return FormGroup({
    'progressList': FormArray([
      // group of section
      FormGroup({
        'progress': FormArray([
          // record of item
          FormGroup({
            'id': FormControl<String>(),
            'completed': FormControl<bool>(value: false),
            'key': FormControl<String>(),
            'tag': FormControl<String>(),
            'task': FormControl<String>(),
            'completionDate': FormControl<DateTime>(
              validators: [
                Validators.pattern(
                  ValidatorRegExp.date,
                ),
              ],
            ),
            'remarks': FormControl<String>(),
            'medicalRecord': FormControl<String>(),
            'type': FormControl<String>(),
          }),
        ]),
      })
    ]),
  });
}
