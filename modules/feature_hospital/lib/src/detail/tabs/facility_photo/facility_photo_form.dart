import 'package:reactive_forms/reactive_forms.dart';

FormGroup facilityPhotoForm() {
  return FormGroup({
    'facilityFile': FormControl<String>(),
  });
}
