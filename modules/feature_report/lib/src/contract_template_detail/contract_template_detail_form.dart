import 'package:core_network/entities.dart';
import 'package:reactive_forms/reactive_forms.dart';

FormGroup contractTemplateform(FileSelect file) {
  return FormGroup({
    'uploadFile': FormControl<FileSelect>(value: file),
    'version': FormControl<String>(),
    'updatedOn': FormControl<DateTime>(),
    'subject': FormControl<String>(),
    'operation': FormControl<String>(),
  });
}

FormGroup contractTemplatebasicInformation() {
  return FormGroup({
    'version': FormControl<String>(),
    'documentName': FormControl<String>(),
    'contractA': FormControl<String>(),
    'contractB': FormControl<String>(),
    'contractC': FormControl<String>(),
    'fastening_method': FormControl<String>(),
    'contracting_party_for_hospitals': FormControl<String>(),
    'operation': FormControl<bool>(),
  });
}
