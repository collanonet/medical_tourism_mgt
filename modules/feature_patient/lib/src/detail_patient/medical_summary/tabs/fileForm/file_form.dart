import 'package:core_network/core_network.dart';
import 'package:reactive_forms/reactive_forms.dart';

FormGroup summaryFileForm(
    {required FileSelect file}) {
  return FormGroup({
    'file': FormControl<FileSelect>(
      value: file,
    ),
    'documentName': FormControl<String>(),
    'publicationDate': FormControl<DateTime>(),
    'share': FormControl<String>(
      value: '○',
    ),
    'disclosureToAgent': FormControl<String>(
      value: '○',
    ),
  });
}
