import 'package:reactive_forms/reactive_forms.dart';

class FormKeys {
  static const doYouHaveAValidVisa = 'doYouHaveAValidVisa';
  static const visa = 'visa';
  static const requestingAPersonalGuaranteeForObtainingAMedicalVisa =
      'requestingAPersonalGuaranteeForObtainingAMedicalVisa';
  static const remarks = 'remarks';
  static const companionDoYouHaveAValidVisa = 'companionDoYouHaveAValidVisa';
  static const companionVisa = 'companionVisa';
  static const companionRequestingAPersonalGuaranteeForObtainingAMedicalVisa =
      'companionRequestingAPersonalGuaranteeForObtainingAMedicalVisa';
}

FormGroup otherForm() => FormGroup({
      FormKeys.doYouHaveAValidVisa: FormControl<bool>(),
      FormKeys.visa: FormControl<String>(),
      FormKeys.requestingAPersonalGuaranteeForObtainingAMedicalVisa:
          FormControl<bool>(),
      FormKeys.remarks: FormControl<String>(),
      FormKeys.companionDoYouHaveAValidVisa: FormControl<bool>(),
      FormKeys.companionVisa: FormControl<String>(),
      FormKeys.companionRequestingAPersonalGuaranteeForObtainingAMedicalVisa:
          FormControl<bool>(),
    });
