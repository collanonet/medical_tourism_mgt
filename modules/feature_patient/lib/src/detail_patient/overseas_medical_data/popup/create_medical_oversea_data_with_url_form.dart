import 'package:reactive_forms/reactive_forms.dart';

FormGroup createMedicalOverseaDataWithUrlForm() {
  return FormGroup({
    'entry_date_from': FormControl<DateTime>(validators: [Validators.required]),
    'hospitalName': FormControl<String>(validators: [Validators.required]),
    'hospitalAddress': FormControl<String>(validators: [Validators.required]),
    'hospitalPhone': FormControl<String>(validators: [Validators.required]),
    'hospitalFax': FormControl<String>(validators: [Validators.required]),
    'hospitalEmail': FormControl<String>(validators: [Validators.required]),
    'hospitalWebsite': FormControl<String>(validators: [Validators.required]),
  });
}
