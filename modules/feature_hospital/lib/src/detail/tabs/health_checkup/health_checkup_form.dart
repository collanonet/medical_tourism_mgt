import 'package:core_network/core_network.dart';
import 'package:reactive_forms/reactive_forms.dart';

FormGroup healthCheckupForm({required String hospitalRecordId}) {
  return FormGroup({
    'hospitalRecord': FormControl<String>(value: hospitalRecordId),
    'uploadFile': FormControl<FileSelect>(),
    'fileName': FormControl<String>(),
    'updatedOn': FormControl<DateTime>(),
  });
}
