import 'package:core_network/core_network.dart';
import 'package:reactive_forms/reactive_forms.dart';

FormGroup facilityPhotoForm({required String hospitalRecordId}) {
  return FormGroup({
    'hospitalRecord': FormControl<String>(value: hospitalRecordId),
    'facilityFile': FormControl<String>(),
    'NameOfHspital' : FormControl<String>(),
    'photograph' : FormControl<String>(),
    'shootingDate' : FormControl<DateTime>(),
    'share' : FormControl<String>(),
    'UploadePhoto' : FormControl<FileSelect>(),

  });
}
