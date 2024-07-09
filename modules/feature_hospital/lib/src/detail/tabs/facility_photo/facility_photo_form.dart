import 'package:core_network/core_network.dart';
import 'package:reactive_forms/reactive_forms.dart';

FormGroup facilityPhotoForm() {
  return FormGroup({
    'facilityFile': FormControl<String>(),
    'NameOfHspital' : FormControl<String>(),
    'photograph' : FormControl<String>(),
    'shooting_date' : FormControl<DateTime>(),
    'share' : FormControl<String>(),
    'UploadePhoto' : FormControl<FileSelect>(),

  });
}
