// Package imports:
import 'package:reactive_forms/reactive_forms.dart';

FormGroup detailMedicalOverseaForm() {
  return FormGroup({
    'comment': FormControl<String>(),
  });
}
