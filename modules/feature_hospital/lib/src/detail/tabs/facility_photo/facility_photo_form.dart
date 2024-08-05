import 'package:core_network/core_network.dart';
import 'package:reactive_forms/reactive_forms.dart';

FormGroup facilityPhotoForm(
    {required String hospitalRecordId, required FileSelect file}) {
  return FormGroup({
    'hospitalRecord': FormControl<String>(value: hospitalRecordId),
    'facilityFile': FormControl<FileSelect>(
      value: file,
    ),
    'NameOfHspital': FormControl<String>(),
    'photograph': FormControl<String>(),
    'shootingDate': FormControl<DateTime>(),
    'share': FormControl<String>(),
    'uploadedPhoto': FormControl<FileSelect>(
      value: file,
    ),
  });
}
