import 'package:reactive_forms/reactive_forms.dart';

FormGroup otherForm() => FormGroup({
      'Do_you_have_a_valid_visa': FormControl<String>(),
      'visa': FormControl<String>(),
      'Requesting_a_personal_guarantee_for_obtaining_a_medical_visa':
          FormControl<String>(),
      'remarks': FormControl<String>(),
      'companion_Do_you_have_a_valid_visa': FormControl<String>(),
      'companion_visa': FormControl<String>(),
      'companion_Requesting_a_personal_guarantee_for_obtaining_a_medical_visa':
          FormControl<String>(),
    });
